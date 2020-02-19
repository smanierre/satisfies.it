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
	concreteTypeInsertQuery       = `INSERT INTO CONCRETE_TYPES(package, name, basetype) VALUES($1, $2, $3) RETURNING id;`
	concreteTypeSelectAllQuery    = `SELECT * FROM CONCRETE_TYPES;`
	concreteTypeSelectByIDQuery   = `SELECT * FROM CONCRETE_TYPES WHERE id=$1;`
	interfaceInsertQuery          = `INSERT INTO INTERFACES(package, name, implementable) VALUES($1, $2, $3) RETURNING id;`
	interfaceSelectAllQuery       = `SELECT * FROM INTERFACES;`
	interfaceSelectByIDQuery      = `SELECT * FROM INTERFACES WHERE id=$1;`
	concreteMethodInsertQuery     = `INSERT INTO CONCRETE_METHODS(package, name, parameters, return_values, receiver_name, receiver_ID) VALUES($1, $2, $3, $4, $5, $6) RETURNING id;`
	concreteMethodSelectAllQuery  = `SELECT * FROM CONCRETE_METHODS;`
	concreteMethodSelectByIQuery  = `SELECT * FROM CONCRETE_METHODS WHERE id=$1;`
	interfaceMethodInsertQuery    = `INSERT INTO INTERFACE_METHODS(package, name, parameters, return_values, receiver_name, receiver_ID) VALUES($1, $2, $3, $4, $5, $6) RETURNING id;`
	interfaceMethodSelectAllQuery = `SELECT * FROM INTERFACE_METHODS;`
	interfaceMethodSelectByIQuery = `SELECT * FROM INTERFACE_METHODS WHERE id=$1;`
)

var db *sql.DB
var createTypeStatement *sql.Stmt
var selectAllTypeStatement *sql.Stmt
var selectTypeByIDStatement *sql.Stmt
var createInterfaceStatement *sql.Stmt
var selectAllInterfaceStatement *sql.Stmt
var selectInterfaceByIDStatement *sql.Stmt
var createConcreteMethodStatement *sql.Stmt
var selectAllConcreteMethodStatement *sql.Stmt
var selectConcreteMethodByIDStatement *sql.Stmt
var createInterfaceMethodStatement *sql.Stmt
var selectAllInterfaceMethodStatement *sql.Stmt
var selectInterfaceMethodByIDStatement *sql.Stmt

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
	createConcreteMethodStatement, err = db.Prepare(concreteMethodInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllConcreteMethodStatement, err = db.Prepare(concreteMethodSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectConcreteMethodByIDStatement, err = db.Prepare(concreteMethodSelectByIQuery)
	if err != nil {
		panic(err)
	}
	createInterfaceMethodStatement, err = db.Prepare(interfaceMethodInsertQuery)
	if err != nil {
		panic(err)
	}
	selectAllInterfaceMethodStatement, err = db.Prepare(interfaceMethodSelectAllQuery)
	if err != nil {
		panic(err)
	}
	selectInterfaceMethodByIDStatement, err = db.Prepare(interfaceMethodSelectByIQuery)
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

// CreateConcreteMethod takes the fields from a Method (sans ID) and inserts it into the database, returning an error if not successful.
func CreateConcreteMethod(packageName string, name string, parameters []string, returnValues []string, receiverName string, receiverID int) int {
	res := createConcreteMethodStatement.QueryRow(packageName, name, pq.Array(parameters), pq.Array(returnValues), receiverName, receiverID)
	var id int
	res.Scan(&id)
	return id
}

// GetAllConcreteMethods returns all the *sql.Rows of the method table in the database.
func GetAllConcreteMethods() (*sql.Rows, error) {
	rows, err := selectAllConcreteMethodStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetConcreteMethodByID returns a *sql.Row with the given ID.
func GetConcreteMethodByID(id int) *sql.Row {
	return selectConcreteMethodByIDStatement.QueryRow(id)
}

// CreateInterfaceMethod takes the fields from a Method (sans ID) and inserts it into the database, returning an error if not successful.
func CreateInterfaceMethod(packageName string, name string, parameters []string, returnValues []string, receiverName string, receiverID int) int {
	res := createInterfaceMethodStatement.QueryRow(packageName, name, pq.Array(parameters), pq.Array(returnValues), receiverName, receiverID)
	var id int
	res.Scan(&id)
	return id
}

// GetAllInterfaceMethods returns all the *sql.Rows of the interface_method table in the database.
func GetAllInterfaceMethods() (*sql.Rows, error) {
	rows, err := selectAllInterfaceMethodStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("unable to execute query: %s", err)
	}
	return rows, nil
}

// GetInterfaceMethodByID returns a *sql.Row with the given ID.
func GetInterfaceMethodByID(id int) *sql.Row {
	return selectInterfaceMethodByIDStatement.QueryRow(id)
}
