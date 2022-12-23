package sqlite

import (
	"database/sql"
	"fmt"
	"go/types"
	"log"

	"gitlab.com/sean.manierre/typer-site/util"
)

type DB struct {
	db *sql.DB
}

//ReceiverType is an integer representing whether or not a method belongs to a concrete type or an interface.
type ReceiverType int

const (
	//ConcreteType is used to indicate a method belongs to a concrete type.
	ConcreteType ReceiverType = iota
	//Interface is used to indicate a method belongs to an interface.
	Interface
)

//ConcreteTypeRecord represents a concrete type that was parsed from a go file.
type ConcreteTypeRecord struct {
	ID       int64
	Package  string
	Name     string
	Pointer  bool
	BaseType string
}

//InterfaceRecord represents an interface that was parsed from a go file.
type InterfaceRecord struct {
	ID      int64
	Package string
	Name    string
}

//MethodRecord represents a method that was parsed from a go file.
type MethodRecord struct {
	ID           int64
	Name         string
	Parameters   []string
	ReturnValues []string
	ReceiverID   int64
}

func newDB(db *sql.DB) DB {
	return DB{
		db: db,
	}
}

func (d DB) GetInterfaces() ([]InterfaceRecord, error) {
	rows, err := d.db.Query(selectAllInterfacesQuery)
	if err != nil {
		return nil, fmt.Errorf("error when selecting all interfaces from database: %s", err.Error())
	}
	defer rows.Close()
	interfaces := []InterfaceRecord{}
	resultCount := 0
	for rows.Next() {
		resultCount++
		var ir InterfaceRecord
		err := rows.Scan(&ir.ID, &ir.Package, &ir.Name)
		if err != nil {
			return nil, fmt.Errorf("error scanning InterfaceRecord into struct: %s", err.Error())
		}
		interfaces = append(interfaces, ir)
	}
	return interfaces, nil
}

//GetInterfaceImplementersByInterfaceID returns the IDs of all the types that implement the interface of the given ID.
func (d DB) GetInterfaceImplementersByInterfaceID(id int64) ([]int64, error) {
	rows, err := d.db.Query(selectInterfaceImplementersByInterfaceIDQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when selecting interface implementers by interface id from database: %s", err.Error())
	}
	defer rows.Close()
	var ids []int64
	var i int64
	for rows.Next() {
		err := rows.Scan(&i)
		if err != nil {
			return nil, fmt.Errorf("error when scanning result into int64: %s", err.Error())
		}
		ids = append(ids, i)
	}
	return ids, nil
}

//GetTypeImplementeesByTypeID returns the IDs of all the interfaces that are implemented by the type of the given ID.
func (d DB) GetTypeImplementeesByTypeID(id int64) ([]int64, error) {
	rows, err := d.db.Query(selectTypeImplementeesByTypeIDQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when retreiving type implementees by type id from database: %s", err.Error())
	}
	defer rows.Close()
	var ids []int64
	var i int64
	for rows.Next() {
		err := rows.Scan(&i)
		if err != nil {
			return nil, fmt.Errorf("error when scanning TypeImplementees into int64 slice: %s", err.Error())
		}
		ids = append(ids, i)
	}
	return ids, nil
}

//GetConcreteTypes returns all of the concrete types from the database.
func (d DB) GetConcreteTypes() ([]ConcreteTypeRecord, error) {
	rows, err := d.db.Query(selectAllConcreteTypesQuery)
	if err != nil {
		return nil, fmt.Errorf("error when executing selectAllConcreteTypeQuery: %s", err.Error())
	}
	defer rows.Close()
	types := []ConcreteTypeRecord{}
	resultCount := 0
	for rows.Next() {
		resultCount++
		var ct ConcreteTypeRecord
		err = rows.Scan(&ct.ID, &ct.Package, &ct.Name, &ct.Pointer, &ct.BaseType)
		if err != nil {
			return nil, fmt.Errorf("error scanning ConcreteTypeRecord into struct: %s", err.Error())
		}
		types = append(types, ct)
	}
	return types, nil
}

//GetMethodsByParentID retrieves all the methods that belong to a concrete type or interface.
func (d DB) GetMethodsByParentID(id int64) ([]MethodRecord, error) {
	rows, err := d.db.Query(selectMethodByReceiverQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when querying database for method by parent id: %s", err.Error())
	}
	methods := []MethodRecord{}
	var mr MethodRecord
	for rows.Next() {
		err = rows.Scan(&mr.ID, &mr.Name, &mr.ReceiverID)
		if err != nil {
			return nil, fmt.Errorf("error when scanning method into struct: %s", err.Error())
		}

		parameterRows, err := d.db.Query(selectMethodParametersByMethodIdQuery, mr.ID)
		if err != nil {
			return nil, fmt.Errorf("error when querying for parameters of method with id %d: %s", mr.ID, err.Error())
		}
		defer parameterRows.Close()
		parameters := []string{}
		var tempParameter string
		for parameterRows.Next() {
			err = parameterRows.Scan(&tempParameter)
			if err != nil {
				return nil, fmt.Errorf("error when scanning method_parameter row into struct: %s", err.Error())
			}
			parameters = append(parameters, tempParameter)
		}
		mr.Parameters = parameters

		returnValueRows, err := d.db.Query(selectMethodReturnValuesByMethodIdQuery, mr.ID)
		if err != nil {
			return nil, fmt.Errorf("error when querying for parameters of method with id %d: %s", mr.ID, err.Error())
		}
		defer returnValueRows.Close()
		returnValues := []string{}
		var tempReturnValue string
		for returnValueRows.Next() {
			err = returnValueRows.Scan(&tempReturnValue)
			if err != nil {
				return nil, fmt.Errorf("error when scanning method_return_value row into struct: %s", err.Error())
			}
			returnValues = append(returnValues, tempReturnValue)
		}
		mr.ReturnValues = returnValues

		methods = append(methods, mr)
	}
	return methods, nil
}

//GetMethods returns all the methods from the database.
func (d DB) GetMethods() ([]MethodRecord, error) {
	rows, err := d.db.Query(selectAllMethodsQuery)
	if err != nil {
		return nil, err
	}
	methods := []MethodRecord{}
	for rows.Next() {
		var m MethodRecord
		err = rows.Scan(&m.ID, &m.Name, &m.ReceiverID)
		if err != nil {
			return nil, fmt.Errorf("error when scanning method into struct: %s", err.Error())
		}

		parameterRows, err := d.db.Query(selectMethodParametersByMethodIdQuery, m.ID)
		if err != nil {
			return nil, fmt.Errorf("error when querying for parameters of method with id %d: %s", m.ID, err.Error())
		}
		defer parameterRows.Close()
		parameters := []string{}
		var tempParameter string
		for parameterRows.Next() {
			err = parameterRows.Scan(&tempParameter)
			if err != nil {
				return nil, fmt.Errorf("error when scanning method_parameter row into struct: %s", err.Error())
			}
			parameters = append(parameters, tempParameter)
		}
		m.Parameters = parameters

		returnValueRows, err := d.db.Query(selectMethodReturnValuesByMethodIdQuery, m.ID)
		if err != nil {
			return nil, fmt.Errorf("error when querying for parameters of method with id %d: %s", m.ID, err.Error())
		}
		defer returnValueRows.Close()
		returnValues := []string{}
		var tempReturnValue string
		for returnValueRows.Next() {
			err = returnValueRows.Scan(&tempReturnValue)
			if err != nil {
				return nil, fmt.Errorf("error when scanning method_return_value row into struct: %s", err.Error())
			}
			returnValues = append(returnValues, tempReturnValue)
		}
		m.ReturnValues = returnValues

		methods = append(methods, m)
	}
	return methods, nil
}

//InsertConcreteType inserts a concrete type into the database and returns the ID of the inserted type. If the underlying type of the
//provided types.Type is an interface, an error will be returned.
func (d DB) InsertConcreteType(ct types.Type) (int64, error) {
	if types.IsInterface(ct.Underlying()) {
		return -1, fmt.Errorf("unable to insert interface type as a concrete type")
	}
	var ctr ConcreteTypeRecord
	switch ct := ct.(type) {
	case *types.Named:
		ctr.Package = ct.Obj().Pkg().Name()
		ctr.Name = ct.Obj().Name()
		ctr.Pointer = false
		baseType, err := util.GetBaseType(ct)
		if err != nil {
			log.Printf("Unknown basetype for type: %v\n", ct)
			ctr.BaseType = ""
		}
		ctr.BaseType = baseType
	case *types.Pointer:
		tn := ct.Elem().(*types.Named)
		ctr.Package = tn.Obj().Pkg().Name()
		ctr.Name = tn.Obj().Name()
		ctr.Pointer = true
		baseType, err := util.GetBaseType(tn)
		if err != nil {
			log.Printf("Unknown basetype for pointer type: %v\n", tn)
			ctr.BaseType = ""
		}
		ctr.BaseType = baseType
	}
	row := d.db.QueryRow(insertCustomTypeQuery, ctr.Package, ctr.Name)
	var customTypeID int64
	err := row.Scan(&customTypeID)
	if err != nil {
		return -1, fmt.Errorf("error when scanning returned id into int64: %s", err.Error())
	}
	row = d.db.QueryRow(insertConcreteTypeQuery, customTypeID, ctr.Pointer, ctr.BaseType)
	var insertedID int64
	err = row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	return insertedID, nil
}

//InsertMethod inserts a method into the database and returns the ID of the inserted method. If inserting a CustomType,
//all methods should be inserted first as their IDs are referenced by the type. If an error is returned, the id returned is -1.
func (d DB) InsertMethod(m *types.Func, ownerID int64) (int64, error) {
	var mr MethodRecord
	mr.Name = m.Name()
	s, ok := m.Type().(*types.Signature)
	if !ok {
		return -1, fmt.Errorf("error when casting Type method result on %v to *types.Signature", m)
	}
	mr.Parameters = []string{}
	for i := 0; i < s.Params().Len(); i++ {
		mr.Parameters = append(mr.Parameters, s.Params().At(i).Type().String())
	}
	mr.ReturnValues = []string{}
	for i := 0; i < s.Results().Len(); i++ {
		mr.ReturnValues = append(mr.ReturnValues, s.Results().At(i).Type().String())
	}
	row := d.db.QueryRow(insertMethodQuery, mr.Name, ownerID)
	var insertedID int64
	err := row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	if len(mr.Parameters) > 0 {
		for i, v := range mr.Parameters {
			_, err := d.db.Exec(insertMethodParameterQuery, insertedID, i, v)
			if err != nil {
				return -1, fmt.Errorf("error when attempting to insert method parameter into database: %s", err.Error())
			}
		}
	}
	if len(mr.ReturnValues) > 0 {
		for i, v := range mr.ReturnValues {
			_, err := d.db.Exec(insertMethodReturnValueQuery, insertedID, i, v)
			if err != nil {
				return -1, fmt.Errorf("error when attempting to insert method return value into databaes: %s", err.Error())
			}
		}
	}
	return insertedID, nil
}

//InsertInterface inserts a interface into the database and returns the ID of the inserted type. If the underlying type of the
//provided types.Type isn't an interface, an error will be returned.
func (d DB) InsertInterface(ct types.Type) (int64, error) {
	if !types.IsInterface(ct.Underlying()) {
		return -1, fmt.Errorf("unable to insert non-interface type as an interface")
	}
	var ir InterfaceRecord
	tn, ok := ct.(*types.Named)
	if !ok {
		return -1, fmt.Errorf("unable to cast type: %v to *types.Named", ct)
	}
	ir.Package = tn.Obj().Pkg().Name()
	ir.Name = tn.Obj().Name()
	row := d.db.QueryRow(insertCustomTypeQuery, ir.Package, ir.Name)
	var insertedID int64
	err := row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	return insertedID, nil
}

//InsertInterfaceImplementers inserts the interface id and the id of the type that implements it.
//This is a map style table so there will be multiple entries for each interface.
func (d DB) InsertInterfaceImplementers(interfaceID, implementingID int64) error {
	_, err := d.db.Exec(insertInterfaceImplementersQuery, interfaceID, implementingID)
	if err != nil {
		return err
	}
	return nil
}

//InsertTypeImplementee inserts the concrete type id and the id of the interface it implements.
//This is a map style table so there will be multiple entries for each interface.
func (d DB) InsertTypeImplementee(typeID, implementeeID int64) error {
	_, err := d.db.Exec(insertTypeImplementeeQuery, typeID, implementeeID)
	if err != nil {
		return err
	}
	return nil
}

//GetCustomTypeCount returns the number of custom types in the database.
func (d DB) GetCustomTypeCount() (int, error) {
	res := d.db.QueryRow(getCustomTypeCountQuery)
	var count int
	err := res.Scan(&count)
	if err != nil {
		return -1, fmt.Errorf("error when getting count of custom types from the database: %s", err.Error())
	}
	return count, nil
}
