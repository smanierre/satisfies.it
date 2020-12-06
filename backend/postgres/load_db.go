package postgres

import (
	"encoding/json"
	"fmt"
	"log"
	"os"

	"github.com/jackc/pgx/v4/pgxpool"
	"gitlab.com/sean.manierre/typer-site/parser"
)

func loadDb(db *pgxpool.Pool, dataFile string) error {
	df, err := os.Open(dataFile)
	if err != nil {
		return err
	}

	p := parser.New()
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

	for _, ct := range p.Types {
		var methodIDs []int64
		for _, method := range ct.Methods {
			log.Printf("Inserting method: %s\n", method.Name)
			lastInsertID, err := InsertMethod(method)
			if err != nil {
				return err
			}
			methodIDs = append(methodIDs, lastInsertID)
		}
		log.Printf("Inserting CustomType: %s.%s\n", ct.Package, ct.Name)
		lastInsertID, err := InsertCustomType(ct, methodIDs)
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
		log.Printf("Inserting InterfaceImplementer record for interface with name: %s\n", k)
		_, err := InsertInterfaceImplementers(k, typeIDs)
		if err != nil {
			return err
		}
	}

	for k, v := range p.TypeImplementees {
		var typeIDs []int64
		for _, t := range v {
			typeIDs = append(typeIDs, typeRecordMap[fmt.Sprintf("%s.%s", t.Package, t.Name)])
		}
		log.Printf("Inserting TypeImplementee record for type with name: %s\n", k)
		_, err := InsertTypeImplementee(k, typeIDs)
		if err != nil {
			return err
		}
	}
	return nil
}
