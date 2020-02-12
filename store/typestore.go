package store

import (
	"fmt"
	"log"
	"reflect"
	"time"

	"github.com/lib/pq"
	"github.com/smanierre/typer-site/model"
	db "github.com/smanierre/typer-site/store/postgres"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []model.InterfaceRecord
	GetInterfaceById(id int) model.InterfaceRecord
	GetInterfaceByName(name string) model.InterfaceRecord
	GetConcreteTypes() []model.ConcreteTypeRecord
	GetConcreteTypeTypeByID(id int) model.ConcreteTypeRecord
	GetConcreteTypesByName(name string) []model.ConcreteTypeRecord
	GetImplementingIDs(id int) []int
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	interfaces            []model.InterfaceRecord
	concreteTypes         []model.ConcreteTypeRecord
	methods               []model.MethodRecord
	interfaceImplementers map[int][]int
	lastUpdated           time.Time
}

// NewStore returns an initialized TypeStore with types already retrieved from the database.
func NewStore() (TypeStore, error) {
	t := TypeStorePGImpl{concreteTypes: []model.ConcreteTypeRecord{}, interfaces: []model.InterfaceRecord{}, methods: []model.MethodRecord{}}
	err := t.getAndParseTypes()
	if err != nil {
		log.Printf("Error: %s\n", err)
	}
	err = t.getAndParseMethods()
	if err != nil {
		log.Printf("Error: %s\n", err)
	}
	t.resolveImplementations()
	t.lastUpdated = time.Now()
	return &t, nil
}

// GetInterfaces returns a slice of TypeRecords containing all the interfaces in the store.
func (t *TypeStorePGImpl) GetInterfaces() []model.InterfaceRecord {
	t.updateStore()
	var interfaces []model.ConcreteTypeRecord
	for _, v := range t.types {
		if v.BaseType == "interface" {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

// GetInterface returns a types.ConcreteTypeRecord matching the id if it exists and is an interface.
func (t *TypeStorePGImpl) GetInterface(id int) model.ConcreteTypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType == "interface" && v.ID == id {
			return v
		}
	}
	return model.ConcreteTypeRecord{}
}

// GetTypes returns a slice of TypeRecords containing all the structs in the store.
func (t *TypeStorePGImpl) GetTypes() []model.ConcreteTypeRecord {
	t.updateStore()
	var types []model.ConcreteTypeRecord
	for _, v := range t.types {
		if v.BaseType != "interface" {
			types = append(types, v)
		}
	}
	return types
}

// GetTypeByID returns a types.ConcreteTypeRecord matching the id if it exists and is a struct.
func (t *TypeStorePGImpl) GetTypeByID(id int) model.ConcreteTypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType != "interface" && v.ID == id {
			return v
		}
	}
	return model.ConcreteTypeRecord{}
}

//GetTypesByName returns a type with the given name as long as it isn't an interface
func (t *TypeStorePGImpl) GetTypesByName(name string) []model.ConcreteTypeRecord {
	t.updateStore()
	var types []model.ConcreteTypeRecord
	for _, v := range t.types {
		if v.BaseType == "struct" && v.Name == name {
			types = append(types, v)
		}
	}
	return types
}

//GetImplementingIDs returns the id of each type that implements the given interface
func (t *TypeStorePGImpl) GetImplementingIDs(id int) []int {
	val, ok := t.interfaceImplementers[id]
	if ok {
		return val
	}
	return nil
}

func (t *TypeStorePGImpl) updateStore() {
	if t.lastUpdated.Sub(time.Now()) < time.Second*-30 {
		log.Println("Updating TypeStore from database")
		err := t.getAndParseTypes()
		if err != nil {
			log.Printf("Error: %s\n", err)
		}
		err = t.getAndParseMethods()
		if err != nil {
			log.Printf("Error: %s\n", err)
		} else {
			t.lastUpdated = time.Now()
		}
	}
}

func (t *TypeStorePGImpl) getAndParseTypes() error {
	rows, err := db.GetAllConcreteTypes()
	if err != nil {
		return fmt.Errorf("unable to retrieve types from database: %s", err)
	}
	defer rows.Close()
	var typeList []model.ConcreteTypeRecord
	var ty model.ConcreteTypeRecord
	for rows.Next() {
		// If this isn'y here to reset t, the methods just keep on stacking up.
		ty = model.ConcreteTypeRecord{}
		if err := rows.Scan(&ty.ID, &ty.Package, &ty.Name, &ty.BaseType); err != nil {
			return fmt.Errorf("unable to parse row into model.ConcreteTypeRecord: %s", err)
		}
		typeList = append(typeList, ty)
	}
	t.concreteTypes = typeList

	rows, err = db.GetAllInterfaces()
	if err != nil {
		return fmt.Errorf("unabel to retrieve interfaces from database: %s", err)
	}
	defer rows.Close()
	var interfaceList []model.InterfaceRecord
	var in model.InterfaceRecord
	for rows.Next() {
		in = model.InterfaceRecord{}
		if err = rows.Scan(&in.ID, &in.Package, &in.Name, &in.Implementable); err != nil {
			return fmt.Errorf("unable to parse row into model.InterfaceRecord: %s", err)
		}
		interfaceList = append(interfaceList, in)
	}
	t.interfaces = interfaceList
	return nil
}

func (t *TypeStorePGImpl) getAndParseMethods() error {
	rows, err := db.GetAllMethods()
	if err != nil {
		return fmt.Errorf("unable to retrieve methods from database: %s", err)
	}
	defer rows.Close()
	var methods []model.MethodRecord
	var m model.MethodRecord
	for rows.Next() {
		if err := rows.Scan(&m.ID, &m.Package, &m.Name, pq.Array(&m.Parameters), pq.Array(&m.ReturnValues), &m.ReceiverName, &m.ReceiverID); err != nil {
			return fmt.Errorf("unable to parse row into Method: %s", err)
		}
		methods = append(methods, m)
	}
	for i, s := range t.concreteTypes {
		for _, m := range methods {
			if m.ReceiverID == s.ID {
				t.concreteTypes[i].Methods = append(t.concreteTypes[i].Methods, m)
			}
		}
	}
	return nil
}

// TODO: Get this to work so that every type doesn't implement every interface. Also get methods on interfaces to work right.
func (t *TypeStorePGImpl) resolveImplementations() {
	interfaces := t.GetInterfaces()
	structs := t.GetTypes()

	interfaceImplementers := map[int][]int{}

	for _, i := range interfaces {
		for _, s := range structs {
			// check if type s satisfies interface i
			if i.checkIfImplements(s) {
				_, ok := interfaceImplementers[i.ID]
				if !ok {
					interfaceImplementers[i.ID] = []int{s.ID}
				}
				interfaceImplementers[i.ID] = append(interfaceImplementers[i.ID], s.ID)
			}
		}
	}
	t.interfaceImplementers = interfaceImplementers
}

func (iface model.ConcreteTypeRecord) checkIfImplements(typ model.ConcreteTypeRecord) bool {
	for _, m := range typ.Methods {
		for i, im := range iface.Methods {
			if m.Equals(im) {
				iface.Methods = append(iface.Methods[:i], iface.Methods[i+1:]...)
			}
		}
	}
	if len(iface.Methods) == 0 {
		return true
	}
	return false
}

// Equals checks if the provided types.MethodRecord equals the one being called on. This method ignores ID and Package since those are irrelevant to interface implementation.
func (m model.MethodRecord) Equals(record model.MethodRecord) bool {
	if m.Receiver != record.Receiver {
		return false
	}
	if m.Name != record.Name {
		return false
	}
	if !reflect.DeepEqual(m.Parameters, record.Parameters) {
		return false
	}
	if !reflect.DeepEqual(m.ReturnValues, record.ReturnValues) {
		return false
	}
	return true
}
