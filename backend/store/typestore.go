package store

import (
	"fmt"
	"log"
	"strings"

	"gitlab.com/sean.manierre/typer-site/parser"
	db "gitlab.com/sean.manierre/typer-site/postgres"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []db.CustomTypeRecord
	GetInterfaceByID(int) db.CustomTypeRecord
	GetInterfacesByName(string) []db.CustomTypeRecord
	GetConcreteTypes() []db.CustomTypeRecord
	GetConcreteTypeByID(int) db.CustomTypeRecord
	GetConcreteTypesByName(string) []db.CustomTypeRecord
	GetImplementingIDs(int) []int
	GetImplementeeIDs(int) []int
	InsertParsedProject(*parser.Parser) error
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	customTypes           []db.CustomTypeRecord
	interfaces            []db.CustomTypeRecord
	concreteTypes         []db.CustomTypeRecord
	interfaceImplementers map[string][]int64
	typeImplementees      map[string][]int64
}

// New returns an initialized TypeStore with types already retrieved from the database.
func New() (TypeStore, error) {
	t := TypeStorePGImpl{
		concreteTypes:         []db.CustomTypeRecord{},
		interfaces:            []db.CustomTypeRecord{},
		customTypes:           []db.CustomTypeRecord{},
		interfaceImplementers: map[string][]int64{},
		typeImplementees:      map[string][]int64{},
	}
	err := t.populateStore()
	if err != nil {
		return nil, err
	}
	return &t, nil
}

func (t *TypeStorePGImpl) populateStore() error {
	types, err := db.GetCustomTypes()
	if err != nil {
		return err
	}
	t.customTypes = types
	interfaces := []db.CustomTypeRecord{}
	concreteTypes := []db.CustomTypeRecord{}
	for _, t := range types {
		if t.CT.Type == parser.Interface {
			interfaces = append(interfaces, t)
			continue
		}
		concreteTypes = append(concreteTypes, t)
	}
	t.interfaces = interfaces
	t.concreteTypes = concreteTypes

	interfaceImplementers, err := db.GetInterfaceImplementers()
	if err != nil {
		return err
	}
	for _, ii := range interfaceImplementers {
		t.interfaceImplementers[ii.InterfaceName] = ii.Implementers
	}

	typeImplementees, err := db.GetTypeImplementees()
	if err != nil {
		return err
	}
	for _, ti := range typeImplementees {
		t.typeImplementees[ti.TypeName] = ti.Implementees
	}

	return nil
}

// GetInterfaces returns a slice of TypeRecords containing all the interfaces in the store.
func (t *TypeStorePGImpl) GetInterfaces() []db.CustomTypeRecord {
	return t.interfaces
}

// GetInterfaceByID returns a types.ConcreteTypeRecord matching the id if it exists and is an interface.
func (t *TypeStorePGImpl) GetInterfaceByID(id int) db.CustomTypeRecord {
	for _, v := range t.interfaces {
		if v.ID == int64(id) {
			return v
		}
	}
	return db.CustomTypeRecord{}
}

//GetInterfacesByName returns a list of interfaces with the given name. Note, don't include the package in the name e.g. Writer, not io.Writer
func (t *TypeStorePGImpl) GetInterfacesByName(name string) []db.CustomTypeRecord {
	var interfaces []db.CustomTypeRecord
	pkg := false
	if strings.Index(name, ".") != -1 {
		pkg = true
	}
	for _, v := range t.interfaces {
		interfaceName := strings.ToLower(v.CT.Name)
		if pkg {
			interfaceName = fmt.Sprintf("%s.%s", strings.ToLower(v.CT.Package), interfaceName)
		}
		if strings.Contains(strings.ToLower(interfaceName), strings.ToLower(name)) {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

// GetConcreteTypes returns a slice of TypeRecords containing all the structs in the store.
func (t *TypeStorePGImpl) GetConcreteTypes() []db.CustomTypeRecord {
	return t.concreteTypes
}

// GetConcreteTypeByID returns a types.ConcreteTypeRecord matching the id if it exists and is a struct.
func (t *TypeStorePGImpl) GetConcreteTypeByID(id int) db.CustomTypeRecord {
	for _, v := range t.concreteTypes {
		if v.ID == int64(id) {
			return v
		}
	}
	return db.CustomTypeRecord{}
}

//GetConcreteTypesByName returns a type with the given name as long as it isn't an interface
func (t *TypeStorePGImpl) GetConcreteTypesByName(name string) []db.CustomTypeRecord {
	var types []db.CustomTypeRecord
	pkg := false
	if strings.Index(name, ".") != -1 {
		pkg = true
	}
	for _, v := range t.concreteTypes {
		typeName := strings.ToLower(v.CT.Name)
		if pkg {
			typeName = fmt.Sprintf("%s.%s", strings.ToLower(v.CT.Package), typeName)
		}
		if strings.Contains(typeName, strings.ToLower(name)) {
			types = append(types, v)
		}
	}
	return types
}

//GetImplementingIDs returns the id of each type that implements the given interface.
func (t *TypeStorePGImpl) GetImplementingIDs(id int) []int {
	iface := t.GetInterfaceByID(id)
	val, ok := t.interfaceImplementers[fmt.Sprintf("%s.%s", iface.CT.Package, iface.CT.Name)]
	if ok {
		ids := []int{}
		for _, id := range val {
			ids = append(ids, int(id))
		}
		return ids
	}
	return nil
}

//GetImplementeeIDs returns the id of each interface that is implemented by the given type.
func (t *TypeStorePGImpl) GetImplementeeIDs(id int) []int {
	ct := t.GetConcreteTypeByID(id)
	val, ok := t.typeImplementees[fmt.Sprintf("%s.%s", ct.CT.Package, ct.CT.Name)]
	if ok {
		ids := []int{}
		for _, id := range val {
			ids = append(ids, int(id))
		}
		return ids
	}
	return nil
}

//InsertParsedProject takes a type that was parsed from a file and inserts it into the database.
//This method will take care of inserting all the methods first and resolving any types that
//implement it or interfaces it implements.
func (t *TypeStorePGImpl) InsertParsedProject(p *parser.Parser) error {
	//Insert custom types and methods
	for _, ct := range p.Types {
		var methodIDs []int64
		for _, m := range ct.Methods {
			id, err := db.InsertMethod(m)
			if err != nil {
				return fmt.Errorf("typestore.go-InsertCustomType unable to insert method: %s", err.Error())
			}
			methodIDs = append(methodIDs, id)
		}
		_, err := db.InsertCustomType(ct, methodIDs)
		if err != nil {
			return fmt.Errorf("typestore.go-InsertCustomType unable to insert custom type: %s", err.Error())
		}
	}

	//The store is used when inserting the implementers and implementees so it needs to be up to date
	//with the types and methods that were just inserted.
	log.Println("Updating typestore")
	err := t.populateStore()
	if err != nil {
		return fmt.Errorf("typestore.go-InsertCustomType unable to update typestore: %s", err.Error())
	}

	//Insert interface implementers
	var implementingIDs []int64
	for name, implementers := range p.InterfaceImplementers {
		implementingIDs = []int64{}
		//TODO: Make this less shitty
		for _, i := range implementers {
			for _, ct := range t.customTypes {
				if ct.CT.Package == i.Package && ct.CT.Name == i.Name {
					implementingIDs = append(implementingIDs, ct.ID)
					break
				}
			}
		}
		_, err := db.InsertInterfaceImplementers(name, implementingIDs)
		if err != nil {
			return err
		}
	}

	//Insert interface implementees
	for name, implementees := range p.TypeImplementees {
		implementingIDs = []int64{}
		//TODO: Also make this less shitty
		for _, ct := range implementees {
			for _, i := range t.interfaces {
				if ct.Package == i.CT.Package && ct.Name == i.CT.Name {
					implementingIDs = append(implementingIDs, i.ID)
					break
				}
			}
		}
		_, err := db.InsertTypeImplementee(name, implementingIDs)
		if err != nil {
			return err
		}
	}
	//Update the store after inserting into the database.
	err = t.populateStore()
	if err != nil {
		return err
	}
	return nil
}
