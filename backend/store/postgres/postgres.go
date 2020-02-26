package postgres

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"os/exec"
	"time"

	// Driver for postgres
	"github.com/lib/pq"
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
	var err error
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=postgres sslmode=disable",
		os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"))
	db, err = sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	for i := 0; i < 5; i++ {
		err = nil
		err = db.Ping()
		if err == nil {
			break
		}
		log.Printf("Unable to connect to database retrying in 3 seconds: %s\n", err.Error())
		time.Sleep(time.Second * 3)
		if i == 5 {
			panic(err)
		}
	}
	log.Println("Successfully connected to database")

	log.Println("Checking for database structure")
	databases, err := db.Query("SELECT datname from pg_database where datistemplate=false;")
	if err != nil {
		panic(err)
	}
	checkDatabaseStructure(databases)
	db.Close()
	//TODO: How to use all the databases
	psqlInfo = fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=types_1_13_8 sslmode=disable",
		os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"))
	db, err = sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	for i := 0; i < 5; i++ {
		err = nil
		err = db.Ping()
		if err == nil {
			break
		}
		log.Printf("Unable to connect to database retrying in 3 seconds: %s\n", err.Error())
		time.Sleep(time.Second * 3)
		if i == 5 {
			panic(err)
		}
	}
	log.Println("Successfully connected to database")

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

func checkDatabaseStructure(rows *sql.Rows) {
	expectedDatabases := map[string]bool{"types_1_9_7": false, "types_1_10_8": false, "types_1_11_13": false, "types_1_12_17": false, "types_1_13_8": false}
	var tempDB *sql.DB
	var err error
	for rows.Next() {
		var d string
		if err := rows.Scan(&d); err != nil {
			log.Println(err)
		}
		if _, ok := expectedDatabases[d]; ok {
			log.Printf("Found database: %s\n", d)
			expectedDatabases[d] = true
			expectedTables := map[string]bool{"concrete_types": false, "concrete_methods": false, "interfaces": false, "interface_methods": false}
			log.Printf("Connecting to database: %s\n", d)
			tempDB, err = sql.Open("postgres", fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
				os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), d))
			if err != nil {
				panic(err)
			}
			err = tempDB.Ping()
			if err != nil {
				panic(err)
			}
			log.Printf("Connected to database: %s\n", d)
			tables, err := tempDB.Query("SELECT table_name from information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE';")
			if err != nil {
				panic(err)
			}
			for tables.Next() {
				var s string
				if err := tables.Scan(&s); err != nil {
					log.Println(err)
				} else {
					_, ok := expectedTables[s]
					if ok {
						expectedTables[s] = true
					}
				}
			}
			missingTables := 0
			for table, found := range expectedTables {
				if !found {
					log.Println("Missing table " + table)
					missingTables++
					if err != nil {
						panic(err)
					}
					continue
				}
				log.Println("Found table " + table)
			}
			if missingTables > 1 {
				log.Println("Missing tables, repopulating database.")
				for table := range expectedTables {
					query := fmt.Sprintf("DROP TABLE %s CASCADE;", table)
					tempDB.Exec(query)
				}
				fileFlag := fmt.Sprintf("./store/postgres/db_data/%s.sql", d)
				databaseFlag := fmt.Sprintf("%s", d)
				sqlCommand := exec.Command("psql", "-U", os.Getenv("DB_USER"), "-d", databaseFlag, "-f", fileFlag)
				fmt.Println(sqlCommand.String())
				err = sqlCommand.Run()
				if err != nil {
					log.Println(err)
				}
			}
			tempDB.Close()
		}
	}
	for database, exists := range expectedDatabases {
		if !exists {
			log.Printf("Missing database: %s, creating and populating\n", database)
			createDBQuery := fmt.Sprintf("CREATE DATABASE %s;", database)
			_, err := db.Query(createDBQuery)
			if err != nil {
				panic(err)
			}
			log.Printf("Connecting to database: %s\n", database)
			tempDB, err = sql.Open("postgres", fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
				os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), database))
			if err != nil {
				panic(err)
			}
			err = tempDB.Ping()
			if err != nil {
				panic(err)
			}
			log.Printf("Connected to database: %s\n", database)
			fileFlag := fmt.Sprintf("./store/postgres/db_data/%s.sql", database)
			populateDBCmd := exec.Command("psql", "-h", os.Getenv("DB_HOST"), "-p", os.Getenv("DB_PORT"), "-U", os.Getenv("DB_USER"), "-d", database, "-f", fileFlag)
			err = populateDBCmd.Run()
			if err != nil {
				log.Println(err)
			}
			tempDB.Close()
		}
	}
}
