package postgres

import (
	"database/sql"
	"log"

	//Postgres driver
	_ "github.com/lib/pq"
)

var db *sql.DB

func getExpectedTables() []string {
	return []string{"custom_types", "interface_implementers", "type_implementees"}
}

//InitDB takes in a json file with all the parsed types and returns a populated database.
//If a database already exists, it will be returned unless the overwrite flag is provided, then the new file will be loaded.
func InitDB(connstring string, jsonPath string, overwrite bool) (*sql.DB, error) {
	var err error
	db, err = sql.Open("postgres", connstring)
	if err != nil {
		return nil, err
	}
	if err := db.Ping(); err != nil {
		return nil, err
	}

	err = checkDBStructure()
	if err != nil {
		return err
	}

	if !overwrite {
		//Only prepare the statements if a new db isn't being loaded. If it is, it will be done while the db is getting loaded.
		err = prepareStatements()
		if err != nil {
			return nil, err
		}
	}

	if overwrite {
		//Delete any existing tables and load in the jsonFile
		err := loadDb(db, jsonPath)
		if err == nil {
			return db, nil
		}
		log.Printf("Unable to load new database with following error: %s\nAttempting to use previous db if valid.\n")
	}

	return db, nil
}
