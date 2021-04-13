package store

import (
	"fmt"
	"go/types"
	"log"
	"strings"

	"gitlab.com/sean.manierre/typer-site/parser"
	db "gitlab.com/sean.manierre/typer-site/postgres"
	"gitlab.com/sean.manierre/typer-site/util"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() ([]Interface, error)
	GetInterfaceByID(int64) (Interface, error)
	GetInterfacesByName(string) ([]Interface, error)
	GetConcreteTypes() ([]ConcreteType, error)
	GetConcreteTypeByID(int64) (ConcreteType, error)
	GetConcreteTypesByName(string) ([]ConcreteType, error)
	GetImplementingIDs(int64) ([]int64, error)
	GetImplementeeIDs(int64) ([]int64, error)
	InsertParsedProject(*parser.Parser) error
}

//Interface represents an interface and all of its methods.
type Interface struct {
	ID      int64
	Package string
	Name    string
	Methods []Method
}

//ConcreteType represents a concrete type and all of its methods.
type ConcreteType struct {
	ID       int64
	Package  string
	Name     string
	Pointer  bool
	BaseType string
	Methods  []Method
}

//Method represents a method belonging to either an interface or a concrete type
type Method struct {
	ID           int64
	Name         string
	Parameters   []string
	ReturnValues []string
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	interfaces    []Interface
	concreteTypes []ConcreteType
	methods       []Method
	validCache    bool
}

// New returns a new TypeStore that can query the database.
func New() TypeStore {
	return &TypeStorePGImpl{
		interfaces:    []Interface{},
		concreteTypes: []ConcreteType{},
		methods:       []Method{},
		validCache:    false,
	}
}

// GetInterfaces returns a slice of Interfaces containing all the interfaces in the database.
func (t *TypeStorePGImpl) GetInterfaces() ([]Interface, error) {
	t.refreshCache()
	if len(t.interfaces) == 0 {
		return nil, fmt.Errorf("error: no interfaces in the typestore cache")
	}
	return t.interfaces, nil
}

// GetInterfaceByID returns an Interface whose ID matches supplied ID.
func (t *TypeStorePGImpl) GetInterfaceByID(id int64) (Interface, error) {
	t.refreshCache()
	for _, i := range t.interfaces {
		if i.ID == id {
			return i, nil
		}
	}
	return Interface{}, fmt.Errorf("interface not found")
}

//GetInterfacesByName returns a list of interfaces with the given name. If the package is included
//e.g. `io.Writer`, the results are limited to the specified package.
func (t *TypeStorePGImpl) GetInterfacesByName(name string) ([]Interface, error) {
	t.refreshCache()
	matches := []Interface{}
	nameParts, err := splitPackageName(name)
	if err != nil {
		return nil, fmt.Errorf("error when splitting type name: %s", err.Error())
	}
	//No package specified, only match on interface name
	if len(nameParts) == 1 {
		for _, i := range t.interfaces {
			if strings.Contains(i.Name, nameParts[0]) {
				matches = append(matches, i)
			}
		}
		//Package was specified, limit results to just the package
	} else if len(nameParts) == 2 {
		for _, i := range t.interfaces {
			if i.Package == nameParts[0] {
				if strings.Contains(i.Name, nameParts[1]) {
					matches = append(matches, i)
				}
			}
		}
	}
	return matches, nil
}

// GetConcreteTypes returns a slice of ConcreteTypes containing all the concrete types in the database.
func (t *TypeStorePGImpl) GetConcreteTypes() ([]ConcreteType, error) {
	t.refreshCache()
	if len(t.concreteTypes) == 0 {
		return nil, fmt.Errorf("error: no interfaces in the typestore cache")
	}
	return t.concreteTypes, nil
}

// GetConcreteTypeByID returns a ConcreteType matching the id if it exists.
func (t *TypeStorePGImpl) GetConcreteTypeByID(id int64) (ConcreteType, error) {
	t.refreshCache()
	for _, ct := range t.concreteTypes {
		if ct.ID == id {
			return ct, nil
		}
	}
	return ConcreteType{}, fmt.Errorf("interface not found")
}

//GetConcreteTypesByName returns a type with the given name. If the package is specified e.g. `io.Writer`, the results
//are limited to the specified package.
func (t *TypeStorePGImpl) GetConcreteTypesByName(name string) ([]ConcreteType, error) {
	t.refreshCache()
	matches := []ConcreteType{}
	nameParts, err := splitPackageName(name)
	if err != nil {
		return nil, fmt.Errorf("error when splitting type name: %s", err.Error())
	}
	//No package specified, only match on type name
	if len(nameParts) == 1 {
		for _, ct := range t.concreteTypes {
			if strings.Contains(ct.Name, nameParts[0]) {
				matches = append(matches, ct)
			}
		}
		//Package was specified, limit results to just the package
	} else if len(nameParts) == 2 {
		for _, ct := range t.concreteTypes {
			if ct.Package == nameParts[0] {
				if strings.Contains(ct.Name, nameParts[1]) {
					matches = append(matches, ct)
				}
			}
		}
	}
	return matches, nil
}

//GetImplementingIDs returns the id of each type that implements the given interface.
func (t *TypeStorePGImpl) GetImplementingIDs(id int64) ([]int64, error) {
	t.refreshCache()
	ids, err := db.GetInterfaceImplementersByInterfaceID(id)
	if err != nil {
		return nil, fmt.Errorf("error when retreiving implementer IDs from database: %s", err.Error())
	}
	return ids, nil
}

//GetImplementeeIDs returns the id of each interface that is implemented by the given type.
func (t *TypeStorePGImpl) GetImplementeeIDs(id int64) ([]int64, error) {
	t.refreshCache()
	ids, err := db.GetTypeImplementeesByTypeID(id)
	if err != nil {
		return nil, fmt.Errorf("error when retreiving implentee IDs from database: %s", err.Error())
	}
	return ids, nil
}

//InsertParsedProject takes a type that was parsed from a file and inserts it into the database.
//This method will take care of inserting all the methods first and resolving any types that
//implement it or interfaces it implements.
func (t *TypeStorePGImpl) InsertParsedProject(p *parser.Parser) error {
	//Insert concrete types and methods
	for _, ct := range p.ConcreteTypes {
		id, err := db.InsertConcreteType(ct)
		if err != nil {
			return fmt.Errorf("error when inserting custom type into the database: %s", err.Error())
		}
		var tn *types.Named
		switch ct.(type) {
		case *types.Named:
			tn = ct.(*types.Named)
		case *types.Pointer:
			tn = ct.(*types.Pointer).Elem().(*types.Named)
		}
		for i := 0; i < tn.NumMethods(); i++ {
			method := tn.Method(i)
			//Skip any unexported methods as they aren't relevant to what is being done with this project.
			if !util.StartsWithUppercase(method.Name()) {
				continue
			}
			_, err := db.InsertMethod(method, id)
			if err != nil {
				return fmt.Errorf("error when inserting concrete type method into database: %s", err.Error())
			}
		}
	}
	//Insert interfaces and methods
	for _, i := range p.Interfaces {
		id, err := db.InsertInterface(i)
		if err != nil {
			return fmt.Errorf("error when inserting interface into the database: %s", err.Error())
		}
		ti, ok := i.Underlying().(*types.Interface)
		if !ok {
			return fmt.Errorf("error when casting underlying type of %v to *types.Interface", i)
		}
		for j := 0; j < ti.NumMethods(); j++ {
			method := ti.Method(j)
			//Skip any unexported methods as they aren't relevant to what is being done with this project.
			if !util.StartsWithUppercase(method.Name()) {
				continue
			}
			_, err := db.InsertMethod(ti.Method(j), id)
			if err != nil {
				return fmt.Errorf("error when inserting interface method into database: %s", err.Error())
			}
		}
	}
	//Get all concrete types and interfaces so we have the IDs on hand without hitting the database
	//a lot for inserting the implementer implementee mappings.
	concreteTypes, err := db.GetConcreteTypes()
	if err != nil {
		return fmt.Errorf("error when retrieving all concrete types from the database: %s", err.Error())
	}
	interfaces, err := db.GetInterfaces()
	if err != nil {
		return fmt.Errorf("error when retrieving all interfaces from the database: %s", err.Error())
	}
	//Insert interface implementers
	for iface, implementers := range p.Implementers {
		tn, ok := iface.(*types.Named)
		if !ok {
			return fmt.Errorf("error when casting %v to *types.Named for interface being implemented", iface)
		}
		var ifaceID int64
		//Get the ID for the interface
		for _, i := range interfaces {
			if tn.Obj().Pkg().Name() == i.Package && tn.Obj().Name() == i.Name {
				ifaceID = i.ID
				break
			}
		}
		//Get the ID for each implementing type
		var typeID int64
		for _, implementer := range implementers {
			var tn *types.Named
			switch implementer.(type) {
			case *types.Named:
				tn = implementer.(*types.Named)
			case *types.Pointer:
				tn = implementer.(*types.Pointer).Elem().(*types.Named)
			default:
				return fmt.Errorf("error: %v does not have an underlying type of *types.Named or *types.Pointer", implementer)
			}
			for _, typ := range concreteTypes {
				if tn.Obj().Pkg().Name() == typ.Package && tn.Obj().Name() == typ.Name {
					typeID = typ.ID
					break
				}
			}
			err := db.InsertInterfaceImplementers(ifaceID, typeID)
			if err != nil {
				return fmt.Errorf("error when inserting interface implementers into db: %s", err.Error())
			}
		}
	}

	//Insert interface implementees
	for typ, implementees := range p.Implementees {
		var tn *types.Named
		switch typ.(type) {
		case *types.Named:
			tn = typ.(*types.Named)
		case *types.Pointer:
			tn = typ.(*types.Pointer).Elem().(*types.Named)
		default:
			return fmt.Errorf("error: %v does not have an underlying type of *types.Named or *types.Pointer", typ)
		}
		var typeID int64
		//Get the ID for the type
		for _, ct := range concreteTypes {
			if tn.Obj().Pkg().Name() == ct.Package && tn.Obj().Name() == ct.Name {
				typeID = ct.ID
				break
			}
		}
		//Get the ID for each implemented interface
		var ifaceID int64
		for _, implementee := range implementees {
			tn, ok := implementee.(*types.Named)
			if !ok {
				return fmt.Errorf("error when casting %v to *types.Named", implementee)
			}
			for _, i := range interfaces {
				if tn.Obj().Pkg().Name() == i.Package && tn.Obj().Name() == i.Name {
					ifaceID = i.ID
					break
				}
			}
			err := db.InsertTypeImplementee(typeID, ifaceID)
			if err != nil {
				return fmt.Errorf("error when inserting interface implementers into db: %s", err.Error())
			}
		}
	}
	t.validCache = false
	return nil
}

func getMethodsofParent(parentID int64, parentType db.ReceiverType) ([]Method, error) {
	methods, err := db.GetMethodsByParentID(parentID)
	if err != nil {
		return nil, fmt.Errorf("error when retreiving methods by parent id from database: %s", err.Error())
	}
	ms := []Method{}
	for _, m := range methods {
		ms = append(ms, Method{
			ID:           m.ID,
			Name:         m.Name,
			Parameters:   m.Parameters,
			ReturnValues: m.ReturnValues,
		})
	}
	return ms, nil
}

func (t *TypeStorePGImpl) refreshCache() {
	if t.validCache {
		return
	}
	log.Println("Cache is invalid, refreshing.")
	interfaces, err := db.GetInterfaces()
	if err != nil {
		log.Println("Error refreshing cache:", err.Error())
	}
	for _, i := range interfaces {
		methods, err := getMethodsofParent(i.ID, db.Interface)
		if err != nil {
			log.Println("Error refreshing cache:", err.Error())
		}
		t.interfaces = append(t.interfaces, Interface{
			ID:      i.ID,
			Package: i.Package,
			Name:    i.Name,
			Methods: methods,
		})
	}

	types, err := db.GetConcreteTypes()
	if err != nil {
		log.Println("Error refreshing cache:", err.Error())
	}
	for _, ct := range types {
		methods, err := getMethodsofParent(ct.ID, db.ConcreteType)
		if err != nil {
			log.Println("Error refreshing cache:", err.Error())
		}
		t.concreteTypes = append(t.concreteTypes, ConcreteType{
			ID:       ct.ID,
			Package:  ct.Package,
			Name:     ct.Name,
			Pointer:  ct.Pointer,
			BaseType: ct.BaseType,
			Methods:  methods,
		})
	}

	methods, err := db.GetMethods()
	if err != nil {
		log.Println("Error refreshing cache:", err.Error())
	}
	for _, m := range methods {
		t.methods = append(t.methods, Method{
			ID:           m.ID,
			Name:         m.Name,
			Parameters:   m.Parameters,
			ReturnValues: m.ReturnValues,
		})
	}
	t.validCache = true
}

func splitPackageName(name string) ([]string, error) {
	if strings.Contains(name, ".") {
		parts := strings.Split(name, ".")
		//If it's more than 2, there are more than 2 "."'s, which is invalid for a name.
		if len(parts) != 2 {
			return nil, fmt.Errorf("error: %s is not a valid type name. Cannot have more than one \".\"", name)
		}
		//Make sure neither of the items are empty, if so it means the name starts or stops with a ".", which is invalid.
		if len(parts[0]) == 0 || len(parts[1]) == 0 {
			return nil, fmt.Errorf("error: %s is not a valid name. Cannot start or end with a \".\"", name)
		}
		return parts, nil
	}
	return []string{name}, nil
}
