package postgres

import (
	"database/sql"
	"errors"
	"fmt"

	"github.com/lib/pq"
	"gitlab.com/sean.manierre/typer-site/parser"
)

//CustomTypeRecord is a wrapper around parser.CustomType and includes a field for the id assigned by the database.
type CustomTypeRecord struct {
	ID int64             `json:"id"`
	CT parser.CustomType `json:"type"`
}

//MethodRecord is a wrapper around parser.Method and includes a field for the id assigned by the database.
type MethodRecord struct {
	ID int64         `json:"id"`
	M  parser.Method `json:"method"`
}

//InterfaceImplementersRecord contains the ID of an interface and a slice of all the IDs of the implementing types.
type InterfaceImplementersRecord struct {
	ID            int64   `json:"id"`
	InterfaceName string  `json:"interface_name"`
	Implementers  []int64 `json:"implementers"`
}

//TypeImplementeesRecord contains the ID of a concrete type and a slice of all the IDs of the interfaces it implements.
type TypeImplementeesRecord struct {
	ID           int64   `json:"id"`
	TypeName     string  `json:"type_name"`
	Implementees []int64 `json:"implementees"`
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
	selectAllMethodStatement                   *sql.Stmt
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
	selectAllMethodStatement, err = db.Prepare(selectAllMethodQuery)
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

//GetCustomTypes returns all the custom types from the database.
func GetCustomTypes() ([]CustomTypeRecord, error) {
	rows, err := selectAllCustomTypeStatement.Query()
	if err != nil {
		return nil, fmt.Errorf("error when executing selectAllCustomTypeStatement: %s", err.Error())
	}
	types := []CustomTypeRecord{}
	for rows.Next() {
		var ct CustomTypeRecord
		var methodIDs []int64
		err = rows.Scan(&ct.ID, &ct.CT.Package, &ct.CT.Name, &ct.CT.Type, &ct.CT.Basetype, pq.Array(&methodIDs))
		if err != nil {
			return nil, fmt.Errorf("error scanning CustomTypeRecord into struct: %s", err.Error())
		}
		for _, id := range methodIDs {
			mr, err := getMethodByID(id)
			if err != nil {
				return nil, err
			}
			ct.CT.Methods = append(ct.CT.Methods, mr.M)
		}
		types = append(types, ct)
	}
	return types, nil
}

func getMethodByID(id int64) (MethodRecord, error) {
	row := selectMethodByIDStatement.QueryRow(id)
	var mr MethodRecord
	if err := row.Scan(&mr.ID, &mr.M.Name, &mr.M.PointerReceiver, &mr.M.Receiver, pq.Array(&mr.M.Parameters), pq.Array(&mr.M.ReturnValues)); err != nil {
		return MethodRecord{}, fmt.Errorf("error when scanning method retreived by id into struct: %s", err.Error())
	}
	return mr, nil
}

//GetMethods returns all the methods from the database.
func GetMethods() ([]MethodRecord, error) {
	rows, err := selectAllMethodStatement.Query()
	if err != nil {
		return nil, err
	}
	methods := []MethodRecord{}
	for rows.Next() {
		var m MethodRecord
		err = rows.Scan(&m)
		if err != nil {
			return nil, fmt.Errorf("error when scanning method into struct: %s", err.Error())
		}
		methods = append(methods, m)
	}
	return methods, nil
}

//GetInterfaceImplementers returns a list of the IDs of all the interfaces along with the IDs of the types that implement them.
func GetInterfaceImplementers() ([]InterfaceImplementersRecord, error) {
	rows, err := selectAllInterfaceImplementersStatement.Query()
	if err != nil {
		return nil, err
	}
	ii := []InterfaceImplementersRecord{}
	for rows.Next() {
		var i InterfaceImplementersRecord
		err = rows.Scan(&i.ID, &i.InterfaceName, pq.Array(&i.Implementers))
		if err != nil {
			return nil, fmt.Errorf("error when scanning InterfaceImplementers into struct: %s", err.Error())
		}
		ii = append(ii, i)
	}
	return ii, nil
}

//GetTypeImplementees returns a list of the IDs of all the types along with the IDs of all the interfaces that they implement.
func GetTypeImplementees() ([]TypeImplementeesRecord, error) {
	rows, err := selectAllTypeImplementeesStatement.Query()
	if err != nil {
		return nil, err
	}
	ti := []TypeImplementeesRecord{}
	for rows.Next() {
		var t TypeImplementeesRecord
		err = rows.Scan(&t.ID, &t.TypeName, pq.Array(&t.Implementees))
		if err != nil {
			return nil, fmt.Errorf("error when scanning TypeImplementees into struct: %s", err.Error())
		}
		ti = append(ti, t)
	}
	return ti, nil
}
