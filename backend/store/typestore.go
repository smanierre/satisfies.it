package store

import (
	"fmt"
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
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	customTypes           []db.CustomTypeRecord
	interfaces            []db.CustomTypeRecord
	concreteTypes         []db.CustomTypeRecord
	interfaceImplementers map[string][]int64
	typeImplementees      map[string][]int64
}

// NewStore returns an initialized TypeStore with types already retrieved from the database.
func NewStore() (TypeStore, error) {
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
		if ii.ID == 4465 {
			fmt.Println(ii.Implementers)
		}
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
