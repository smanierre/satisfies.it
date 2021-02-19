package postgres

import (
	"context"
	"fmt"
)

func getExpectedTables() []string {
	return []string{"custom_types", "concrete_types", "methods", "interface_implementers", "type_implementees"}
}

//CheckStructure ensures that all the expected tables are present in the databaes and returns an error
//if the expected tables are not found.
func CheckStructure() error {
	if db == nil {
		return fmt.Errorf("database not yet initialized")
	}
	res, err := db.Query(context.Background(), "select table_name from information_schema.tables;")
	if err != nil {
		return fmt.Errorf("unable to retrieve list of tables from database: %s", err.Error())
	}
	foundTables := 0
	for res.Next() {
		if res.Err() != nil {
			if err != nil {
				return fmt.Errorf("error when reading query result: %s", err.Error())
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
	}
	if foundTables != len(getExpectedTables()) {
		return fmt.Errorf("error: database missing expected tables")
	}
	return nil
}
