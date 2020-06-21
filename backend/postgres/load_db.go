package postgres

import (
	"database/sql"
	"encoding/json"
<<<<<<< HEAD
	"fmt"
	"os"

	"github.com/lib/pq"
=======
	"errors"
	"fmt"
	"log"
	"os"

>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
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

<<<<<<< HEAD
	err = createDBStructure()
	if err != nil {
		return err
	}

	//Once the structure is created, prepare the statements.
	err = prepareStatements()
	if err != nil {
		return err
	}
	for _, ct := range p.Types {
		var methodIDs []int64
		for _, method := range ct.Methods {
			var lastInsertID int64
			row := insertMethodStatement.QueryRow(method.Name, method.PointerReceiver, method.Receiver, pq.Array(method.Parameters), pq.Array(method.ReturnValues))
			err := row.Scan(&lastInsertID)
			if err != nil {
				return err
			}
			methodIDs = append(methodIDs, lastInsertID)
		}
		var lastInsertID int64
		row := insertCustomTypeStatement.QueryRow(ct.Package, ct.Name, ct.Type, ct.Basetype, pq.Array(methodIDs))
		err := row.Scan(&lastInsertID)
		if err != nil {
			return err
		}
		typeRecordMap[fmt.Sprintf("%s.%s", ct.Package, ct.Name)] = lastInsertID
=======
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
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
	}

	for k, v := range p.InterfaceImplementers {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
<<<<<<< HEAD
		_, err := insertInterfaceImplementersStatement.Exec(k, pq.Array(typeIDs))
=======
		_, err := insertInterfaceImplementersStatement.Exec(k, typeIDs)
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
		if err != nil {
			return err
		}
	}

	for k, v := range p.TypeImplementees {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
<<<<<<< HEAD
		_, err := insertTypeImplementeeStatement.Exec(k, pq.Array(typeIDs))
=======
		_, err := insertTypeImplementeeStatement.Exec(k, typeIDs)
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
		if err != nil {
			return err
		}
	}
	return nil
}
<<<<<<< HEAD
=======

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
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
