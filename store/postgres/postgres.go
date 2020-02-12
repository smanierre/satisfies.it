package postgres

import (
	"database/sql"
	"fmt"
	"os"

	// Driver for postgres
	"github.com/lib/pq"
	_ "github.com/lib/pq"
)

const (
	concreteTypeInsertQuery     = `INSERT INTO CONCRETE_TYPES(package, name, basetype) VALUES($1, $2, $3) RETURNING id;`
	concreteTypeSelectAllQuery  = `SELECT * FROM CONCRETE_TYPES;`
	concreteTypeSelectByIDQuery = `SELECT * FROM CONCRETE_TYPES WHERE id=$1;`
	interfaceInsertQuery        = `INSERT INTO INTERFACES(package, name, implementable) VALUES($1, $2, $3) RETURNING id;`
	interfaceSelectAllQuery     = `SELECT * FROM INTERFACES;`
	interfaceSelectByIDQuery    = `SELECT * FROM INTERFACES WHERE id=$1;`
	methodInsertQuery           = `INSERT INTO METHODS(package, name, parameters, return_values, receiver_name, receiver_ID) VALUES($1, $2, $3, $4, $5, $6) RETURNING id;`
	methodSelectAllQuery        = `SELECT * FROM METHODS;`
	methodSelectByIQuery        = `SELECT * FROM METHODS WHERE id=$1;`
)

var db *sql.DB
var createTypeStatement *sql.Stmt
var selectAllTypeStatement *sql.Stmt
var selectTypeByIDStatement *sql.Stmt
var createInterfaceStatement *sql.Stmt
var selectAllInterfaceStatement *sql.Stmt
var selectInterfaceByIDStatement *sql.Stmt
var createMethodStatement *sql.Stmt
var selectAllMethodStatement *sql.Stmt
var selectMethodByIDStatement *sql.Stmt

// InitDB connects to the database and sets up the prepared statements needed. This must be called before making a store or interacting with the database.
func InitDB() {
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), os.Getenv("DB_NAME"))
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	createTypeStatement, err = db.Prepare(concreteTypeInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllTypeStatement, err = db.Prepare(concreteTypeSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectTypeByIDStatement, err = db.Prepare(concreteTypeSelectByIDQuery)
	if err != nil {
		panic(err)
	}
	createInterfaceStatement, err = db.Prepare(interfaceInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllInterfaceStatement, err = db.Prepare(interfaceSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectInterfaceByIDStatement, err = db.Prepare(interfaceSelectByIDQuery)
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

// CreateConcreteType takes the fields from a ConcreteTypeRecord (sans ID) and inserts it into the database, returning an error if not successful.
func CreateConcreteType(packageName, name, baseType string) int {
	res := createTypeStatement.QueryRow(packageName, name, baseType)
	var id int
	res.Scan(&id)
	return id
}

// GetAllConcreteTypes returns *sql.Rows that contains all the concrete types in the database.
func GetAllConcreteTypes() (*sql.Rows, error) {
	rows, err := selectAllTypeStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetConcreteTypeByID returns a *sql.Row with the given ID.
func GetConcreteTypeByID(id int) *sql.Row {
	return selectTypeByIDStatement.QueryRow(id)
}

//CreateInterface takes the fields from an InterfaceRecord (sans ID) and returns the ID of the created record, or an error if not successful.
func CreateInterface(packageName string, name string, implementable bool) int {
	res := createInterfaceStatement.QueryRow(packageName, name, implementable)
	var id int
	res.Scan(&id)
	return id
}

//GetAllInterfaces returns *sql.Rows that contain all the Interfaces from the database
func GetAllInterfaces() (*sql.Rows, error) {
	rows, err := selectAllInterfaceStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

//GetInterfaceByID returns a *sql.Row with the given ID.
func GetInterfaceByID(id int) *sql.Row {
	return selectInterfaceByIDStatement.QueryRow(id)
}

// CreateMethod takes the fields from a Method (sans ID) and inserts it into the database, returning an error if not successful.
func CreateMethod(packageName string, name string, parameters []string, returnValues []string, receiverName string, receiverID int) int {
	res := createMethodStatement.QueryRow(packageName, name, pq.Array(parameters), pq.Array(returnValues), receiverName, receiverID)
	var id int
	res.Scan(&id)
	return id
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
