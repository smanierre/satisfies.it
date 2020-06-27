package postgres

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"os"

	"github.com/lib/pq"
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
			log.Println("Inserting method: ", method.Name)
			var lastInsertID int64
			row := insertMethodStatement.QueryRow(method.Name, method.PointerReceiver, method.Receiver, pq.Array(method.Parameters), pq.Array(method.ReturnValues))
			err := row.Scan(&lastInsertID)
			if err != nil {
				return err
			}
			methodIDs = append(methodIDs, lastInsertID)
		}
		var lastInsertID int64
		log.Println("Inserting CustomType: ", ct.Package, ".", ct.Name)
		row := insertCustomTypeStatement.QueryRow(ct.Package, ct.Name, ct.Type, ct.Basetype, pq.Array(methodIDs))
		err := row.Scan(&lastInsertID)
		if err != nil {
			return err
		}
		typeRecordMap[fmt.Sprintf("%s.%s", ct.Package, ct.Name)] = lastInsertID
	}

	for k, v := range p.InterfaceImplementers {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
		log.Println("Inserting InterfaceImplementer record for interface with name: ", k)
		_, err := insertInterfaceImplementersStatement.Exec(k, pq.Array(typeIDs))
		if err != nil {
			return err
		}
	}

	for k, v := range p.TypeImplementees {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
		log.Println("Inserting TypeImplementee record for type with name: ", k)
		_, err := insertTypeImplementeeStatement.Exec(k, pq.Array(typeIDs))
		if err != nil {
			return err
		}
	}
	return nil
}
