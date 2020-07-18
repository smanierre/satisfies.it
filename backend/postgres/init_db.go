package postgres

import (
	"context"
	"fmt"
	"strings"

	"github.com/jackc/pgx/v4"
	"github.com/jackc/pgx/v4/pgxpool"
)

var db *pgxpool.Pool

func getExpectedTables() []string {
	return []string{"custom_types", "methods", "interface_implementers", "type_implementees"}
}

//InitDB takes in a json file with all the parsed types and returns a populated database.
//If a database already exists, it will be returned unless the overwrite flag is provided, then the new file will be loaded.
func InitDB(dbHost, dbPort, dbUser, dbPassword, dbName string, jsonPath string, overwrite bool) (*pgxpool.Pool, error) {
	var err error
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, dbName)
	check, err := pgx.Connect(context.Background(), psqlInfo)
	if err != nil {
		return nil, err
	}
	if err := check.Ping(context.Background()); err != nil {
		if strings.Contains(err.Error(), fmt.Sprintf("does not exist")) {
			//Database doesn't exist, create it.
			tempInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=postgres sslmode=disable", dbHost, dbPort, dbUser, dbPassword)
			tempDb, err := pgx.Connect(context.Background(), tempInfo)
			if err != nil {
				return nil, fmt.Errorf("unable to connect to database \"postgres\": %s", err.Error())
			}
			if err := tempDb.Ping(context.Background()); err != nil {
				return nil, fmt.Errorf("unable to ping \"postgres\" database: %s", err.Error())
			}
			_, err = tempDb.Exec(context.Background(), createDatabaseQuery)
			if err != nil {
				return nil, fmt.Errorf("error creating database \"types\": %s", err.Error())
			}
			tempDb.Close(context.Background())
			db, err = pgxpool.Connect(context.Background(), psqlInfo)
			if err != nil {
				return nil, fmt.Errorf("unable to connect to database \"types\" after creating: %s", err.Error())
			}
		} else {
			return nil, err
		}
	}
	check.Close(context.Background())
	db, err = pgxpool.Connect(context.Background(), psqlInfo)
	if err != nil {
		return nil, err
	}
	if !overwrite {
		err = checkDBStructure()
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
		return nil, fmt.Errorf("unable to load new database with following error: %s", err.Error())
	}

	return db, nil
}
