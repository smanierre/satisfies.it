package postgres

import (
	"context"
	"fmt"
	"go/types"
	"log"
	"strings"

	"gitlab.com/sean.manierre/typer-site/util"
)

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

const (
	getCustomTypeCountQuery = "SELECT count(*) from custom_types;"

	insertCustomTypeQuery                 = "INSERT INTO custom_types(package, name) VALUES($1, $2) returning id;"
	selectAllCustomTypesQuery             = "SELECT * FROM custom_types;"
	selectCustomTypeByIDQuery             = "SELECT * FROM custom_types where id=$1;"
	selectCustomTypeByNameQuery           = "SELECT * FROM custom_types where name=$1;"
	selectCustomTypeByPackageAndNameQuery = "SELECT * FROM custom_types where package=$1 and name=$2;"

	selectAllInterfacesQuery             = "SELECT cut.id, cut.package, cut.name FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE ct.pointer IS NULL;"
	selectInterfaceByIDQuery             = "SELECT cut.id, cut.package, cut.name FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.id=$1 AND ct.pointer IS NULL;"
	selectInterfaceByNameQuery           = "SELECT cut.id, cut.package, cut.name FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.name=$1 AND ct.pointer IS NULL;"
	selectInterfaceByPackageAndNameQuery = "SELECT cut.id, cut.package, cut.name FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.package=$1 AND cut.name=$2 AND ct.pointer IS NULL;"

	insertConcreteTypeQuery                  = "INSERT INTO concrete_types(id, pointer, base_type) VALUES($1, $2, $3) returning id;"
	selectAllConcreteTypesQuery              = "SELECT cut.id, cut.package, cut.name, ct.pointer, ct.base_type FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE ct.pointer IS NOT NULL;"
	selectConcreteTypeByIDQuery              = "SELECT cut.id, cut.package, cut.name, ct.pointer, ct.base_type FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.id=$1;"
	selectConcreteTypesByNameQuery           = "SELECT cut.id, cut.package, cut.name, ct.pointer, ct.base_type FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.name=$1 AND ct.pointer IS NOT NULL;"
	selectConcreteTypesByPackageAndNameQuery = "SELECT cut.id, cut.package, cut.name, ct.pointer, ct.base_type FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE cut.package=$1 AND cut.name LIKE '%' ||$2 ||'%' AND ct.pointer IS NOT NULL;"

	insertMethodQuery           = "INSERT INTO methods(name, parameters, return_values, receiver_id) values($1, $2, $3, $4) RETURNING id;"
	selectAllMethodQuery        = "SELECT * FROM methods;"
	selectMethodByIDQuery       = "SELECT * FROM methods WHERE id=$1;"
	selectMethodByNameQuery     = "SELECT * FROM methods WHERE name=$1;"
	selectMethodByReceiverQuery = "SELECT * FROM methods WHERE receiver_id=$1;"

	insertInterfaceImplementersQuery              = "INSERT INTO interface_implementers(interface_id, implementer_id) values($1, $2);"
	selectAllInterfaceImplementersQuery           = "SELECT * FROM interface_implementers;"
	selectInterfaceImplementersByInterfaceIDQuery = "SELECT implementer_id FROM interface_implementers WHERE interface_id=$1;"

	insertTypeImplementeeQuery          = "INSERT INTO type_implementees(type_id, implementee_id) values($1, $2);"
	selectAllTypeImplementeesQuery      = "SELECT * FROM type_implementees;"
	selectTypeImplementeesByTypeIDQuery = "SELECT implementee_id FROM type_implementees WHERE type_id=$1;"
)

//GetCustomTypeCount returns the number of custom types in the database.
func GetCustomTypeCount() (int, error) {
	res := db.QueryRow(context.Background(), getCustomTypeCountQuery)
	var count int
	err := res.Scan(&count)
	if err != nil {
		return -1, fmt.Errorf("error when getting count of custom types from the database: %s", err.Error())
	}
	return count, nil
}

//GetConcreteTypes returns all of the concrete types from the database.
func GetConcreteTypes() ([]ConcreteTypeRecord, error) {
	rows, err := db.Query(context.Background(), selectAllConcreteTypesQuery)
	defer rows.Close()
	if err != nil {
		return nil, fmt.Errorf("error when executing selectAllConcreteTypeQuery: %s", err.Error())
	}
	types := []ConcreteTypeRecord{}
	for rows.Next() {
		var ct ConcreteTypeRecord
		err = rows.Scan(&ct.ID, &ct.Package, &ct.Name, &ct.Pointer, &ct.BaseType)
		if err != nil {
			return nil, fmt.Errorf("error scanning ConcreteTypeRecord into struct: %s", err.Error())
		}
		types = append(types, ct)
	}
	return types, nil
}

//GetConcreteTypeByID returns a concrete type from the database that matches the provided ID.
func GetConcreteTypeByID(id int64) (ConcreteTypeRecord, error) {
	row := db.QueryRow(context.Background(), selectConcreteTypeByIDQuery, id)
	var ct ConcreteTypeRecord
	err := row.Scan(&ct.ID, &ct.Package, &ct.Name, &ct.Pointer, &ct.BaseType)
	if err != nil {
		return ConcreteTypeRecord{}, fmt.Errorf("error when retreiving concrete type by ID from database: %s", err.Error())
	}
	return ct, nil
}

//GetConcreteTypesByName returns all the types whose name matches or partially matches the given name query.
//If a package is specified in the name e.g. `io.Writer`, the results will be limited to that package.
func GetConcreteTypesByName(name string) ([]ConcreteTypeRecord, error) {
	pkg := false
	parts := strings.Split(name, ".")
	var pack, n string
	if len(parts) > 1 {
		pack = parts[0]
		n = parts[1]
		pkg = true
	} else {
		n = parts[0]
	}
	records := []ConcreteTypeRecord{}
	if pkg {
		rows, err := db.Query(context.Background(), selectConcreteTypesByPackageAndNameQuery, pack, name)
		if err != nil {
			return nil, fmt.Errorf("error when retreiving concrete types by package and name from the database: %s", err.Error())
		}
		for rows.Next() {
			var ct ConcreteTypeRecord
			err = rows.Scan(&ct.ID, &ct.Package, &ct.Name, &ct.Pointer, &ct.BaseType)
			if err != nil {
				return nil, fmt.Errorf("error when scanning concrete type into ConcreteTypeRecord struct: %s", err.Error())
			}
			records = append(records, ct)
		}
	} else {
		rows, err := db.Query(context.Background(), selectConcreteTypesByNameQuery, n)
		if err != nil {
			return nil, fmt.Errorf("error when retreiving concrete types by name from the database: %s", err.Error())
		}
		for rows.Next() {
			var ct ConcreteTypeRecord
			err = rows.Scan(&ct.ID, &ct.Package, &ct.Name, &ct.Pointer, &ct.BaseType)
			if err != nil {
				return nil, fmt.Errorf("error when scanning concrete type into ConcreteTypeRecord struct: %s", err.Error())
			}
			records = append(records, ct)
		}
	}
	return records, nil
}

//GetInterfaces returns all of the interfaces from the database.
func GetInterfaces() ([]InterfaceRecord, error) {
	rows, err := db.Query(context.Background(), selectAllInterfacesQuery)
	defer rows.Close()
	if err != nil {
		return nil, fmt.Errorf("error when executing selectAllInterfaceStatement: %s", err.Error())
	}
	interfaces := []InterfaceRecord{}
	for rows.Next() {
		var ir InterfaceRecord
		err := rows.Scan(&ir.ID, &ir.Package, &ir.Name)
		if err != nil {
			return nil, fmt.Errorf("error scanning InterfaceRecord into struct: %s", err.Error())
		}
		interfaces = append(interfaces, ir)
	}
	return interfaces, nil
}

//GetInterfaceByID returns an interface from the database that matches the provided ID.
func GetInterfaceByID(id int64) (InterfaceRecord, error) {
	row := db.QueryRow(context.Background(), selectInterfaceByIDQuery, id)
	var ir InterfaceRecord
	err := row.Scan(&ir.ID, &ir.Package, &ir.Name)
	if err != nil {
		return InterfaceRecord{}, fmt.Errorf("error when retreiving interface by ID from the database: %s", err.Error())
	}
	return ir, nil
}

//GetInterfacesByName returns all interfaces that have a name that fully or partially matches the query. If a package
//name is provied in the query e.g. `io.Writer`, the results will be limited to interfaces from the specified package.
func GetInterfacesByName(name string) ([]InterfaceRecord, error) {
	pkg := false
	parts := strings.Split(name, ".")
	var pack, n string
	if len(parts) > 1 {
		pack = parts[0]
		n = parts[1]
		pkg = true
	} else {
		n = parts[0]
	}
	records := []InterfaceRecord{}
	if pkg {
		rows, err := db.Query(context.Background(), selectInterfaceByPackageAndNameQuery, pack, n)
		if err != nil {
			return nil, fmt.Errorf("error when retreiving interfaces by package and name from the database: %s", err.Error())
		}
		for rows.Next() {
			var ir InterfaceRecord
			err = rows.Scan(&ir.ID, &ir.Package, &ir.Name)
			if err != nil {
				return nil, fmt.Errorf("error when scanning interface into InterfaceRecord struct: %s", err.Error())
			}
			records = append(records, ir)
		}
	} else {
		rows, err := db.Query(context.Background(), selectInterfaceByNameQuery, n)
		if err != nil {
			return nil, fmt.Errorf("error when retreiving interfaces by name from the database: %s", err.Error())
		}
		for rows.Next() {
			var ir InterfaceRecord
			err = rows.Scan(&ir.ID, &ir.Package, &ir.Name)
			if err != nil {
				return nil, fmt.Errorf("error when scanning interface into InterfaceRecord struct: %s", err.Error())
			}
			records = append(records, ir)
		}
	}
	return records, nil
}

//GetMethodsByParentID retrieves all the methods that belong to a concrete type or interface.
func GetMethodsByParentID(id int64) ([]MethodRecord, error) {
	rows, err := db.Query(context.Background(), selectMethodByReceiverQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when querying database for method by parent id: %s", err.Error())
	}
	methods := []MethodRecord{}
	var mr MethodRecord
	for rows.Next() {
		err = rows.Scan(&mr.ID, &mr.Name, &mr.Parameters, &mr.ReturnValues, &mr.ReceiverID)
		if err != nil {
			return nil, fmt.Errorf("error when scanning method into struct: %s", err.Error())
		}
		methods = append(methods, mr)
	}
	return methods, nil
}

//GetMethods returns all the methods from the database.
func GetMethods() ([]MethodRecord, error) {
	rows, err := db.Query(context.Background(), selectAllMethodQuery)
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

//GetInterfaceImplementers returns a map with the key being the ID of the interface, and the value being the IDs of the types that implement it.
func GetInterfaceImplementers() (map[int64][]int64, error) {
	rows, err := db.Query(context.Background(), selectAllInterfaceImplementersQuery)
	if err != nil {
		return nil, err
	}
	ii := map[int64][]int64{}
	for rows.Next() {
		var interfaceID, typeID int64

		err = rows.Scan(&interfaceID, &typeID)
		if err != nil {
			return nil, fmt.Errorf("error when scanning InterfaceImplementers into int64s: %s", err.Error())
		}
		if _, ok := ii[interfaceID]; ok {
			ii[interfaceID] = append(ii[interfaceID], typeID)
		} else {
			ii[interfaceID] = []int64{typeID}
		}
	}
	return ii, nil
}

//GetInterfaceImplementersByInterfaceID returns the IDs of all the types that implement the interface of the given ID.
func GetInterfaceImplementersByInterfaceID(id int64) ([]int64, error) {
	rows, err := db.Query(context.Background(), selectInterfaceImplementersByInterfaceIDQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when selecting interface implementers by interface id from database: %s", err.Error())
	}
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

//GetTypeImplementees returns a list of the IDs of all the types along with the IDs of all the interfaces that they implement.
func GetTypeImplementees() (map[int64][]int64, error) {
	rows, err := db.Query(context.Background(), selectAllTypeImplementeesQuery)
	if err != nil {
		return nil, err
	}
	ti := map[int64][]int64{}
	for rows.Next() {
		var typeID, interfaceID int64
		err = rows.Scan(&typeID, &interfaceID)
		if err != nil {
			return nil, fmt.Errorf("error when scanning TypeImplementees into int64s: %s", err.Error())
		}
		if _, ok := ti[typeID]; !ok {
			ti[typeID] = append(ti[typeID], interfaceID)
		} else {
			ti[typeID] = []int64{interfaceID}
		}
	}
	return ti, nil
}

//GetTypeImplementeesByTypeID returns the IDs of all the interfaces that are implemented by the type of the given ID.
func GetTypeImplementeesByTypeID(id int64) ([]int64, error) {
	rows, err := db.Query(context.Background(), selectTypeImplementeesByTypeIDQuery, id)
	if err != nil {
		return nil, fmt.Errorf("error when retreiving type implementees by type id from database: %s", err.Error())
	}
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

//InsertConcreteType inserts a concrete type into the database and returns the ID of the inserted type. If the underlying type of the
//provided types.Type is an interface, an error will be returned.
func InsertConcreteType(ct types.Type) (int64, error) {
	if types.IsInterface(ct.Underlying()) {
		return -1, fmt.Errorf("unable to insert interface type as a concrete type")
	}
	var ctr ConcreteTypeRecord
	switch ct.(type) {
	case *types.Named:
		tn := ct.(*types.Named)
		ctr.Package = tn.Obj().Pkg().Name()
		ctr.Name = tn.Obj().Name()
		ctr.Pointer = false
		baseType, err := util.GetBaseType(tn)
		if err != nil {
			log.Printf("Unknown basetype for type: %v\n", tn)
			ctr.BaseType = ""
		}
		ctr.BaseType = baseType
	case *types.Pointer:
		tn := ct.(*types.Pointer).Elem().(*types.Named)
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
	row := db.QueryRow(context.Background(), insertCustomTypeQuery, ctr.Package, ctr.Name)
	var customTypeID int64
	err := row.Scan(&customTypeID)
	if err != nil {
		return -1, fmt.Errorf("error when scanning returned id into int64: %s", err.Error())
	}
	row = db.QueryRow(context.Background(), insertConcreteTypeQuery, customTypeID, ctr.Pointer, ctr.BaseType)
	var insertedID int64
	err = row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	return insertedID, nil
}

//InsertInterface inserts a interface into the database and returns the ID of the inserted type. If the underlying type of the
//provided types.Type isn't an interface, an error will be returned.
func InsertInterface(ct types.Type) (int64, error) {
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
	row := db.QueryRow(context.Background(), insertCustomTypeQuery, ir.Package, ir.Name)
	var insertedID int64
	err := row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	return insertedID, nil
}

//InsertMethod inserts a method into the database and returns the ID of the inserted method. If inserting a CustomType,
//all methods should be inserted first as their IDs are referenced by the type. If an error is returned, the id returned is -1.
func InsertMethod(m *types.Func, ownerID int64) (int64, error) {
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
	row := db.QueryRow(context.Background(), insertMethodQuery, mr.Name, mr.Parameters, mr.ReturnValues, ownerID)
	var insertedID int64
	err := row.Scan(&insertedID)
	if err != nil {
		return -1, err
	}
	return insertedID, nil
}

//InsertInterfaceImplementers inserts the interface id and the id of the type that implements it.
//This is a map style table so there will be multiple entries for each interface.
func InsertInterfaceImplementers(interfaceID, implementingID int64) error {
	_, err := db.Exec(context.Background(), insertInterfaceImplementersQuery, interfaceID, implementingID)
	if err != nil {
		return err
	}
	return nil
}

//InsertTypeImplementee inserts the concrete type id and the id of the interface it implements.
//This is a map style table so there will be multiple entries for each interface.
func InsertTypeImplementee(typeID, implementeeID int64) error {
	_, err := db.Exec(context.Background(), insertTypeImplementeeQuery, typeID, implementeeID)
	if err != nil {
		return err
	}
	return nil
}
