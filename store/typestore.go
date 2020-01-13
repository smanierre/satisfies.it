package store

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"reflect"
	"time"

	"github.com/lib/pq"
	db "github.com/smanierre/typer-site/store/postgres"
	"github.com/smanierre/typer-site/store/types"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []types.InterfaceRecord
	GetInterface(id int) types.InterfaceRecord
	GetTypes() []types.ConcreteTypeRecord
	GetTypeByID(id int) types.ConcreteTypeRecord
	GetTypesByName(name string) []types.ConcreteTypeRecord
	GetImplementingIDs(id int) []int
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	interfaces            []types.InterfaceRecord
	concreteTypes         []types.ConcreteTypeRecord
	methods               []types.MethodRecord
	interfaceImplementers map[int][]int
	lastUpdated           time.Time
}

// NewStore returns an initialized TypeStore with types already retrieved from the database.
func NewStore() (TypeStore, error) {
	t := TypeStorePGImpl{concreteTypes: []types.ConcreteTypeRecord{}, interfaces: []types.InterfaceRecord{}}
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
func (t *TypeStorePGImpl) GetInterfaces() []types.InterfaceRecord {
	t.updateStore()
	var interfaces []types.ConcreteTypeRecord
	for _, v := range t.types {
		if v.BaseType == "interface" {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

// GetInterface returns a types.ConcreteTypeRecord matching the id if it exists and is an interface.
func (t *TypeStorePGImpl) GetInterface(id int) types.ConcreteTypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType == "interface" && v.ID == id {
			return v
		}
	}
	return types.ConcreteTypeRecord{}
}

// GetTypes returns a slice of TypeRecords containing all the structs in the store.
func (t *TypeStorePGImpl) GetTypes() []types.ConcreteTypeRecord {
	t.updateStore()
	var types []types.ConcreteTypeRecord
	for _, v := range t.types {
		if v.BaseType != "interface" {
			types = append(types, v)
		}
	}
	return types
}

// GetTypeByID returns a types.ConcreteTypeRecord matching the id if it exists and is a struct.
func (t *TypeStorePGImpl) GetTypeByID(id int) types.ConcreteTypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType != "interface" && v.ID == id {
			return v
		}
	}
	return types.ConcreteTypeRecord{}
}

//GetTypesByName returns a type with the given name as long as it isn't an interface
func (t *TypeStorePGImpl) GetTypesByName(name string) []types.ConcreteTypeRecord {
	t.updateStore()
	var types []types.ConcreteTypeRecord
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
	rows, err := db.GetAllTypes()
	if err != nil {
		return fmt.Errorf("unable to retrieve types from database: %s", err)
	}
	defer rows.Close()
	var typeList []types.ConcreteTypeRecord
	var ty types.ConcreteTypeRecord
	var s sql.NullString
	for rows.Next() {
		// If this isn'y here to reset t, the methods just keep on stacking up.
		ty = types.ConcreteTypeRecord{}
		if err := rows.Scan(&ty.ID, &ty.Package, &ty.Name, &ty.BaseType, &s); err != nil {
			return fmt.Errorf("unable to parse row into types.ConcreteTypeRecord: %s", err)
		}
		if s.Valid {
			b := bytes.NewBufferString(s.String)
			decoder := json.NewDecoder(b)
			decoder.Decode(&ty.Fields)
		}
		typeList = append(typeList, ty)
	}
	t.types = typeList
	return nil
}

func (t *TypeStorePGImpl) getAndParseMethods() error {
	rows, err := db.GetAllMethods()
	if err != nil {
		return fmt.Errorf("unable to retrieve methods from database: %s", err)
	}
	defer rows.Close()
	var methods []types.MethodRecord
	var m types.MethodRecord
	var typeIDHolder int
	for rows.Next() {
		if err := rows.Scan(&m.ID, &m.Package, &typeIDHolder, &m.Name, pq.Array(&m.Parameters), pq.Array(&m.ReturnValues)); err != nil {
			return fmt.Errorf("unable to parse row into Method: %s", err)
		}
		m.ReceiverID = typeIDHolder
		for _, v := range t.types {
			if v.ID == typeIDHolder {
				m.Receiver = fmt.Sprintf("%s.%s", v.Package, v.Name)
			}
		}
		methods = append(methods, m)
	}
	for i, s := range t.types {
		for _, m := range methods {
			if m.ReceiverID == s.ID {
				t.types[i].Methods = append(t.types[i].Methods, m)
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

func (iface types.ConcreteTypeRecord) checkIfImplements(typ types.ConcreteTypeRecord) bool {
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
func (m types.MethodRecord) Equals(record types.MethodRecord) bool {
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
