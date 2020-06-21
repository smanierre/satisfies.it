package postgres

import (
	"database/sql"
<<<<<<< HEAD
	"fmt"
	"strings"
=======
	"log"
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e

	//Postgres driver
	_ "github.com/lib/pq"
)

var db *sql.DB

func getExpectedTables() []string {
<<<<<<< HEAD
	return []string{"custom_types", "methods", "interface_implementers", "type_implementees"}
=======
	return []string{"custom_types", "interface_implementers", "type_implementees"}
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
}

//InitDB takes in a json file with all the parsed types and returns a populated database.
//If a database already exists, it will be returned unless the overwrite flag is provided, then the new file will be loaded.
<<<<<<< HEAD
func InitDB(dbHost, dbPort, dbUser, dbPassword, dbName string, jsonPath string, overwrite bool) (*sql.DB, error) {
	var err error
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, dbName)
	db, err = sql.Open("postgres", psqlInfo)
=======
func InitDB(connstring string, jsonPath string, overwrite bool) (*sql.DB, error) {
	var err error
	db, err = sql.Open("postgres", connstring)
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
	if err != nil {
		return nil, err
	}
	if err := db.Ping(); err != nil {
<<<<<<< HEAD
		if strings.Contains(err.Error(), fmt.Sprintf("does not exist")) {
			//Database doesn't exist, create it.
			tempInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=postgres sslmode=disable", dbHost, dbPort, dbUser, dbPassword)
			tempDb, err := sql.Open("postgres", tempInfo)
			if err != nil {
				return nil, fmt.Errorf("unable to connect to database \"postgres\": %s", err.Error())
			}
			if err := tempDb.Ping(); err != nil {
				return nil, fmt.Errorf("unable to ping \"postgres\" database: %s", err.Error())
			}
			_, err = tempDb.Exec(createDatabaseQuery)
			if err != nil {
				return nil, fmt.Errorf("error creating database \"types\": %s", err.Error())
			}
			tempDb.Close()
			db, err = sql.Open("postgres", psqlInfo)
			if err != nil {
				return nil, fmt.Errorf("unable to connect to database \"types\" after creating: %s", err.Error())
			}
		} else {
			return nil, err
		}
	}

	if !overwrite {
		err = checkDBStructure()
		if err != nil {
			return nil, err
		}
=======
		return nil, err
	}

	err = checkDBStructure()
	if err != nil {
		return err
	}

	if !overwrite {
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
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
<<<<<<< HEAD
		return nil, fmt.Errorf("unable to load new database with following error: %s", err.Error())
=======
		log.Printf("Unable to load new database with following error: %s\nAttempting to use previous db if valid.\n")
>>>>>>> 393aa0287061df8cfbd62ece5571e7b7a53f1c0e
	}

	return db, nil
}
