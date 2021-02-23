package postgres

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/jackc/pgx/v4"
)

func getExpectedTables() []string {
	return []string{"custom_types", "concrete_types", "methods", "interface_implementers", "type_implementees"}
}

//CheckDBStructure checks to make sure all the expected tables exist in the database before inserting or querying.
func CheckDBStructure() error {
	res, err := db.Query(context.Background(), "select table_name from information_schema.tables;")
	if err != nil {
		return err
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
	_, err = tempTypesDB.Exec(context.Background(), script)
	if err != nil {
		return fmt.Errorf("error when creating types database structure: %s", err.Error())
	}
	return nil
}
