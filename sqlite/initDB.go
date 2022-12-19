package sqlite

import (
	"database/sql"
	"fmt"
	"log"
)

func getExpectedTables() map[string]bool {
	return map[string]bool{
		"custom_types":           false,
		"concrete_types":         false,
		"methods":                false,
		"interface_implementers": false,
		"type_implementees":      false,
		"method_parameters":      false,
		"method_return_values":   false,
	}
}

func InitializeDB() (*sql.DB, error) {
	db, err := sql.Open("sqlite3", "./types.db")
	if err != nil {
		return nil, fmt.Errorf("error when attempting to open database: %s", err.Error())
	}
	err = db.Ping()
	if err != nil {
		return nil, fmt.Errorf("error when attempting to ping database: %s", err.Error())
	}

	err = checkStructure(db)
	if err != nil {
		return nil, fmt.Errorf("error when checking database structure: %s", err.Error())
	}
	return db, nil
}

func checkStructure(db *sql.DB) error {
	//Get list of tables from the database
	log.Println("Checking table structure with query: 'select name from sqlite_schema where type='table' and name not like 'sqlite_%';'")
	rows, err := db.Query("select name from sqlite_schema where type='table' and name not like 'sqlite_%';")
	if err != nil {
		return fmt.Errorf("error when attempting to get list of tables from the database: %s", err.Error())
	}
	defer rows.Close()

	tables := getExpectedTables()
	var value string

	//Loop through all the returned tables and check to see if the needed tables exist
	for rows.Next() {
		rows.Scan(&value)
		for k := range tables {
			if value == k {
				tables[k] = true
			}
		}
	}

	//Create any tables that don't yet exist
	for k, v := range tables {
		if !v {
			log.Printf("Creating table: %s\n", k)
			_, err := db.Exec(createTablesQueries[k])
			if err != nil {
				return fmt.Errorf("error when creating %s table: %s", k, err.Error())
			}
		}
	}
	return nil
}
