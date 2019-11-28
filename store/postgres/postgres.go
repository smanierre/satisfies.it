package postgres

import (
	"database/sql"
	"fmt"
	
	// Driver for postgres
	_ "github.com/lib/pq"
)

const (
	typeInsertQuery       = `INSERT INTO types(id, package, name, base_type, fields) VALUES($1, $2, $3, $4, $5) RETURNING id;`
	typeSelectAllQuery    = `SELECT * FROM types;`
	typeSelectByIDQuery   = `SELECT * FROM types WHERE id=$1;`
	methodInsertQuery     = `INSERT INTO methods(id, package, method_receiver_id, method_name, parameters, return_values) VALUES($1, $2, $3, $4, $5, $6);`
	methodSelectAllQuery  = `SELECT * FROM methods;`
	methodSelectByIQueryD = `SELECT * FROM methods WHERE id=$1;`
)

var db *sql.DB
var createStatement *sql.Stmt
var selectAllStatement *sql.Stmt
var selectByIDStatement *sql.Stmt

func init() {
	db, err := sql.Open("postgres", "192.168.0.106")
	if err != nil {
		panic(err)
	}
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	createStatement, err = db.Prepare(typeInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllStatement, err = db.Prepare(typeSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectByIDStatement, err = db.Prepare(typeSelectByIDQuery)
	if err != nil {
		panic(err)
	}
}

// CreateType takes a TypeRecord and inserts it into the database, returning an error if not successful.
func CreateType(id int, packageName, name, baseType, fields string) (int, error) {
	res, err := createStatement.Exec(id, packageName, name, baseType, fields)
	if err != nil {
		return -1, fmt.Errorf("error when executing sqlstatement: %s", err)
	}
	lastID, err := res.LastInsertId()
	if err != nil {
		return -1, fmt.Errorf("unable to get id of last inserted row: %s", err)
	}
	return int(lastID), nil
}

// GetAllTypes returns *sql.Rows that contains all the types in the database.
func GetAllTypes() (*sql.Rows, error) {
	rows, err := selectAllStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetTypeByID returns a *sql.Row with the given ID.
func GetTypeByID(id int) *sql.Row {
	return selectByIDStatement.QueryRow(id)

}
