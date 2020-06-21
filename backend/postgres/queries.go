package postgres

import (
	"database/sql"
	"errors"

	"gitlab.com/sean.manierre/typer-site/parser"
)

type customTypeRecord struct {
	ID int64
	CT parser.CustomType
}

type methodRecord struct {
	ID int64
	M  parser.Method
}

type interfaceImplementersRecord struct {
	ID            int64
	InterfaceName string
	Implementers  []parser.CustomType
}

type typeImplementeesRecord struct {
	ID           int64
	TypeName     string
	Implementees []parser.CustomType
}

const (
	insertCustomTypeQuery       = "INSERT INTO CUSTOM_TYPES(package, name, type, basetype, method_ids) values($1, $2, $3, $4, $5) RETURNING id;"
	selectAllCustomTypeQuery    = "SELECT * FROM CUSTOM_TYPES;"
	selectCustomTypeByIDQuery   = "SELECT * FROM CUSTOM_TYPES WHERE ID=$1;"
	selectCustomTypeByNameQuery = "SELECT * FROM CUSTOM_TYPES WHERE NAME=$1;"

	insertMethodQuery       = "INSERT INTO METHODS(name, pointer_receiver, receiver, parameters, return_values) values($1, $2, $3, $4, $5) RETURNING id;"
	selectAllMethodQuery    = "SELECT * FROM METHODS;"
	selectMethodByIDQuery   = "SELECT * FROM METHODS WHERE ID=$1;"
	selectMethodByNameQuery = "SELECT * FROM METHODS WHERE NAME=$1;"

	insertInterfaceImplementersQuery       = "INSERT INTO INTERFACE_IMPLEMENTERS(interface_name, implementers) values($1, $2) RETURNING id;"
	selectAllInterfaceImplementersQuery    = "SELECT * FROM INTERFACE_IMPLEMENTERS;"
	selectInterfaceImplementersByNameQuery = "SELECT * FROM INTERFACE_IMPLEMENTERS WHERE INTERFACE_NAME=$1;"

	insertTypeImplementeeQuery        = "INSERT INTO TYPE_IMPLEMENTEES(type_name, implementees) values($1, $2) RETURNING id;"
	selectAllTypeImplementeesQuery    = "SELECT * FROM TYPE_IMPLEMENTEES;"
	selectTypeImplementeesByNameQuery = "SELECT * FROM TYPE_IMPLEMENTEES WHERE TYPE_NAME=$1;"

	createDatabaseQuery = "CREATE DATABASE types;"
)

var (
	insertCustomTypeStatement                  *sql.Stmt
	selectAllCustomTypeStatement               *sql.Stmt
	selectCustomTypeByIDStatement              *sql.Stmt
	selectCustomTypeByNameStatement            *sql.Stmt
	insertMethodStatement                      *sql.Stmt
	selectedAllMethodStatement                 *sql.Stmt
	selectMethodByIDStatement                  *sql.Stmt
	selectMethodByNameStatement                *sql.Stmt
	insertInterfaceImplementersStatement       *sql.Stmt
	selectAllInterfaceImplementersStatement    *sql.Stmt
	selectInterfaceImplementersByNameStatement *sql.Stmt
	insertTypeImplementeeStatement             *sql.Stmt
	selectAllTypeImplementeesStatement         *sql.Stmt
	selectTypeImplementeesByNameStatement      *sql.Stmt
)

func prepareStatements() error {
	var err error
	insertCustomTypeStatement, err = db.Prepare(insertCustomTypeQuery)
	if err != nil {
		return err
	}
	selectAllCustomTypeStatement, err = db.Prepare(selectAllCustomTypeQuery)
	if err != nil {
		return err
	}
	selectCustomTypeByIDStatement, err = db.Prepare(selectCustomTypeByIDQuery)
	if err != nil {
		return err
	}
	selectCustomTypeByNameStatement, err = db.Prepare(selectCustomTypeByNameQuery)
	if err != nil {
		return err
	}
	insertMethodStatement, err = db.Prepare(insertMethodQuery)
	if err != nil {
		return err
	}
	selectedAllMethodStatement, err = db.Prepare(selectAllMethodQuery)
	if err != nil {
		return err
	}
	selectMethodByIDStatement, err = db.Prepare(selectMethodByIDQuery)
	if err != nil {
		return err
	}
	selectMethodByNameStatement, err = db.Prepare(selectMethodByNameQuery)
	if err != nil {
		return err
	}
	insertInterfaceImplementersStatement, err = db.Prepare(insertInterfaceImplementersQuery)
	if err != nil {
		return err
	}
	selectAllInterfaceImplementersStatement, err = db.Prepare(selectAllInterfaceImplementersQuery)
	if err != nil {
		return err
	}
	selectInterfaceImplementersByNameStatement, err = db.Prepare(selectInterfaceImplementersByNameQuery)
	if err != nil {
		return err
	}
	insertTypeImplementeeStatement, err = db.Prepare(insertTypeImplementeeQuery)
	if err != nil {
		return err
	}
	selectAllTypeImplementeesStatement, err = db.Prepare(selectAllTypeImplementeesQuery)
	if err != nil {
		return err
	}
	selectTypeImplementeesByNameStatement, err = db.Prepare(selectTypeImplementeesByNameQuery)
	if err != nil {
		return err
	}
	return nil
}

func dropTables() error {
	_, err := db.Exec("DROP TABLE IF EXISTS public.CUSTOM_TYPES CASCADE;")
	if err != nil {
		return err
	}
	_, err = db.Exec("DROP TABLE IF EXISTS public.METHODS;")
	if err != nil {
		return err
	}
	_, err = db.Exec("DROP TABLE IF EXISTS public.INTERFACE_IMPLEMENTERS CASCADE;")
	if err != nil {
		return err
	}
	_, err = db.Exec("DROP TABLE IF EXISTS public.TYPE_IMPLEMENTEES CASCADE;")
	if err != nil {
		return err
	}
	return nil
}

func checkDBStructure() error {
	res, err := db.Query("select table_name from information_schema.tables;")
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

func createDBStructure() error {
	err := dropTables()
	if err != nil {
		return err
	}
	_, err = db.Exec("CREATE TABLE IF NOT EXISTS CUSTOM_TYPES (ID serial PRIMARY KEY, PACKAGE VARCHAR (255), NAME VARCHAR (255), TYPE INTEGER, BASETYPE VARCHAR (255), METHOD_IDS INTEGER[]);")
	if err != nil {
		return err
	}

	_, err = db.Exec("CREATE TABLE IF NOT EXISTS METHODS (ID serial PRIMARY KEY, NAME VARCHAR (255), POINTER_RECEIVER BOOLEAN, RECEIVER VARCHAR(255), PARAMETERS VARCHAR(255)[], RETURN_VALUES VARCHAR(255)[]);")
	if err != nil {
		return err
	}

	_, err = db.Exec("CREATE TABLE IF NOT EXISTS INTERFACE_IMPLEMENTERS (ID serial PRIMARY KEY, INTERFACE_NAME VARCHAR(255), IMPLEMENTERS INTEGER[]);")
	if err != nil {
		return err
	}

	_, err = db.Exec("CREATE TABLE IF NOT EXISTS TYPE_IMPLEMENTEES (ID serial PRIMARY KEY, TYPE_NAME VARCHAR(255), IMPLEMENTEES INTEGER[]);")
	return nil
}
