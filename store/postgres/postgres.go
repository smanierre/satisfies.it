package postgres

import (
	"database/sql"
	"fmt"

	// Driver for postgres
	_ "github.com/lib/pq"
)

const (
	typeInsertQuery      = `INSERT INTO types(package, name, basetype, fields) VALUES($1, $2, $3, $4) RETURNING id;`
	typeSelectAllQuery   = `SELECT * FROM types;`
	typeSelectByIDQuery  = `SELECT * FROM types WHERE id=$1;`
	methodInsertQuery    = `INSERT INTO methods(package, method_receiver_id, method_name, parameters, return_values) VALUES($1, $2, $3, $4, $5) RETURNING id;`
	methodSelectAllQuery = `SELECT * FROM methods;`
	methodSelectByIQuery = `SELECT * FROM methods WHERE id=$1;`
)

var db *sql.DB
var createTypeStatement *sql.Stmt
var selectAllTypeStatement *sql.Stmt
var selectTypeByIDStatement *sql.Stmt
var createMethodStatement *sql.Stmt
var selectAllMethodStatement *sql.Stmt
var selectMethodByIDStatement *sql.Stmt

// InitDB connects to the database and sets up the prepared statements needed. This must be called before making a store or interacting with the database.
func InitDB() {
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable", "localhost", "5432", "postgres", "testpass", "types")
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	createTypeStatement, err = db.Prepare(typeInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllTypeStatement, err = db.Prepare(typeSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectTypeByIDStatement, err = db.Prepare(typeSelectByIDQuery)
	if err != nil {
		panic(err)
	}
	createMethodStatement, err = db.Prepare(methodInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllMethodStatement, err = db.Prepare(methodSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectMethodByIDStatement, err = db.Prepare(methodSelectByIQuery)
	if err != nil {
		panic(err)
	}
}

// CreateType takes the fields from a TypeRecord (sans ID) and inserts it into the database, returning an error if not successful.
func CreateType(packageName, name, baseType, fields string) (int, error) {
	res, err := createTypeStatement.Exec(packageName, name, baseType, fields)
	if err != nil {
		return -1, fmt.Errorf("unable to execute sql statement: %s", err)
	}
	lastID, err := res.LastInsertId()
	if err != nil {
		return -1, fmt.Errorf("unable to get id of last inserted row: %s", err)
	}
	return int(lastID), nil
}

// GetAllTypes returns *sql.Rows that contains all the types in the database.
func GetAllTypes() (*sql.Rows, error) {
	rows, err := selectAllTypeStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetTypeByID returns a *sql.Row with the given ID.
func GetTypeByID(id int) *sql.Row {
	return selectTypeByIDStatement.QueryRow(id)
}

// CreateMethod takes the fields from a Method (sans ID) and inserts it into the database, returning an error if not successful.
func CreateMethod(packageName string, receiverID int, name string, parameters, returnValues []string) (int, error) {
	res, err := createMethodStatement.Exec(packageName, receiverID, name, parameters, returnValues)
	if err != nil {
		return -1, fmt.Errorf("unable to execute sql statement: %s", err)
	}
	lastID, err := res.LastInsertId()
	if err != nil {
		return -1, fmt.Errorf("unable to get id of last inserted row: %s", err)
	}
	return int(lastID), nil
}

// GetAllMethods returns all the *sql.Rows of the method table in the database.
func GetAllMethods() (*sql.Rows, error) {
	rows, err := selectAllMethodStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetMethodByID returns a *sql.Row with the given ID.
func GetMethodByID(id int) *sql.Row {
	return selectMethodByIDStatement.QueryRow(id)
}
