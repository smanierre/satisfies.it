package postgres

import (
	"context"
	"fmt"
	"log"
	"strings"

	"github.com/jackc/pgx/v4"
)

func getExpectedTables() map[string]bool {
	return map[string]bool{
		"custom_types":           false,
		"concrete_types":         false,
		"methods":                false,
		"interface_implementers": false,
		"type_implementees":      false,
	}
}

//CheckDBStructure checks to make sure all the expected tables exist in the database before inserting or querying.
func CheckDBStructure() error {
	res, err := db.Query(context.Background(), "select table_name from information_schema.tables;")
	if err != nil {
		return err
	}
	defer res.Close()
	tables := getExpectedTables()
	for res.Next() {
		if res.Err() != nil {
			return res.Err()
		}
		var t string
		res.Scan(&t)
		for table := range tables {
			if t == table {
				tables[table] = true
				break
			}
		}
	}
	missing := false
	for t, f := range tables {
		if !f {
			log.Printf("Missing table: %s\n", t)
			missing = true
		}
	}
	if missing {
		return fmt.Errorf("error when checking database structure: missing expected tables")
	}
	return nil
}

//CreateStructure takes in a script as a string along with connection details for the database,
//and runs the script to create the database structure.
func CreateStructure(dbHost, dbPort, dbUser, dbPassword, script string) error {
	log.Println("Database not detected, creating.")
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, "postgres")
	tempDB, err := pgx.Connect(context.Background(), psqlInfo)
	if err != nil {
		return fmt.Errorf("error when connecting to database \"postgres\" when creating types database: %s", err.Error())
	}
	log.Println("Creating database types")
	_, err = tempDB.Exec(context.Background(), "CREATE DATABASE types")
	if err != nil {
		return fmt.Errorf("error when creating database types: %s", err.Error())
	}
	tempDB.Close(context.Background())
	psqlInfo = fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, "types")
	tempTypesDB, err := pgx.Connect(context.Background(), psqlInfo)
	if err != nil {
		return fmt.Errorf("error when connecting to types database to create structure: %s", err.Error())
	}
	log.Println("Creating types database structure")
	queries := strings.SplitAfter(script, ";")
	for _, q := range queries {
		_, err = tempTypesDB.Exec(context.Background(), strings.TrimSpace(q))
		if err != nil {
			return fmt.Errorf("error when creating types database structure: %s", err.Error())
		}
	}
	return nil
}
