package postgres

import (
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"os"

	"gitlab.com/sean.manierre/typer-site/parser"
)

func loadDb(db *sql.DB, dataFile string) error {
	df, err := os.Open(dataFile)
	if err != nil {
		return err
	}

	p := parser.NewParser()
	if err := json.NewDecoder(df).Decode(p); err != nil {
		return err
	}

	//As types are added into the DB and assigned IDs, add the id to the map with package.Name
	//as the key in order to have a quick way to lookup types when inserting the implementers/implementees.
	typeRecordMap := map[string]int64{}

	err = checkDBStructure()
	if err != nil {
		log.Println("Database structure not found, creating...")
		err = createDBStructure()
	}

	for _, ct := range p.Types {
		var methodIDs []int64
		for _, method := range ct.Methods {
			res, err := insertMethodStatement.Exec(method.Name, method.PointerReceiver, method.Receiver, method.Parameters, method.ReturnValues)
			if err != nil {
				return err
			}
			id, err := res.LastInsertId()
			if err != nil {
				return err
			}
			methodIDs = append(methodIDs, id)
		}

		res, err := insertCustomTypeStatement.Exec(ct.Package, ct.Name, ct.Type, ct.Basetype, methodIDs)
		if err != nil {
			return err
		}
		id, err := res.LastInsertId()
		if err != nil {
			return err
		}
		typeRecordMap[fmt.Sprintf("%s.%s", ct.Package, ct.Name)] = id
	}

	for k, v := range p.InterfaceImplementers {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
		_, err := insertInterfaceImplementersStatement.Exec(k, typeIDs)
		if err != nil {
			return err
		}
	}

	for k, v := range p.TypeImplementees {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
		_, err := insertTypeImplementeeStatement.Exec(k, typeIDs)
		if err != nil {
			return err
		}
	}
	return nil
}

func checkDBStructure() error {
	res, err := db.Query("select table_name from information_schema.tables;")
	if err != nil {
		return nil, err
	}
	defer res.Close()

	foundTables := 0
	for res.Next() {
		if res.Err() != nil {
			return res.Err()
		}
		var a string
		res.Scan(&a)
		for _, table := range getExpectedTables() {
			if a == table {
				foundTables++
				break
			}
		}
	}
	if foundTables != len(getExpectedTables()) {
		return errors.New("unable to find all expected tables. Verify the database or load a new one")
	}
	return nil
}

func createDBStructure() error {
	dropTables()
	_, err := db.Exec("CREATE TABLE IF NOT EXISTS CUSTOM_TYPES (ID serial PRIMARY KEY, PACKAGE VARCHAR (255), NAME VARCHAR (255), TYPE INTEGER, BASETYPE VARCHAR (255), METHOD_IDS INTEGER[]);")
	if err != nil {
		return err
	}

	_, err = db.Exec("CREATE TABLE IF NOT EXISTS METHODS (ID serial PRIMARY KEY, NAME VARCHAR (255), POINTER_RECEIVER BOOLEAN, RECEIVER VARCHAR(255), PARAMETERS VARCHAR(255)[], RETURN_VALUES VARCHAR(255)[]);")
	if err != nil {
		return err
	}

	_, err = db.Exec("") //Interface_implementers
}
