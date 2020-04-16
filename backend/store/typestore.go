package store

import (
	"fmt"
	"log"
	"os"
	"reflect"
	"strconv"
	"strings"
	"time"

	"github.com/lib/pq"
	"github.com/smanierre/typer-site/model"
	db "github.com/smanierre/typer-site/store/postgres"
	"github.com/smanierre/typer-site/util"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []model.InterfaceRecord
	GetInterfaceByID(id int) model.InterfaceRecord
	GetInterfacesByName(name string) []model.InterfaceRecord
	GetConcreteTypes() []model.ConcreteTypeRecord
	GetConcreteTypeByID(id int) model.ConcreteTypeRecord
	GetConcreteTypesByName(name string) []model.ConcreteTypeRecord
	GetImplementingIDs(id int) []int
	GetImplementeeIDs(id int) []int
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	interfaces            []model.InterfaceRecord
	concreteTypes         []model.ConcreteTypeRecord
	methods               []model.MethodRecord
	interfaceImplementers map[int][]int
	typeImplementees      map[int][]int
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
	return t.interfaces
}

// GetInterfaceByID returns a types.ConcreteTypeRecord matching the id if it exists and is an interface.
func (t *TypeStorePGImpl) GetInterfaceByID(id int) model.InterfaceRecord {
	t.updateStore()
	for _, v := range t.interfaces {
		if v.ID == id {
			return v
		}
	}
	return model.InterfaceRecord{}
}

//GetInterfacesByName returns a list of interfaces with the given name. Note, don't include the package in the name e.g. Writer, not io.Writer
func (t *TypeStorePGImpl) GetInterfacesByName(name string) []model.InterfaceRecord {
	t.updateStore()
	var interfaces []model.InterfaceRecord
	for _, v := range t.interfaces {
		if strings.Contains(strings.ToLower(v.Name), strings.ToLower(name)) {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

// GetConcreteTypes returns a slice of TypeRecords containing all the structs in the store.
func (t *TypeStorePGImpl) GetConcreteTypes() []model.ConcreteTypeRecord {
	t.updateStore()
	return t.concreteTypes
}

// GetTypeByID returns a types.ConcreteTypeRecord matching the id if it exists and is a struct.
func (t *TypeStorePGImpl) GetTypeByID(id int) model.ConcreteTypeRecord {
	t.updateStore()
	for _, v := range t.concreteTypes {
		if v.ID == id {
			return v
		}
	}
	return model.ConcreteTypeRecord{}
}

//GetConcreteTypesByName returns a type with the given name as long as it isn't an interface
func (t *TypeStorePGImpl) GetConcreteTypesByName(name string) []model.ConcreteTypeRecord {
	t.updateStore()
	var types []model.ConcreteTypeRecord
	for _, v := range t.concreteTypes {
		if strings.Contains(strings.ToLower(v.Name), strings.ToLower(name)) {
			types = append(types, v)
		}
	}
	return types
}

//GetConcreteTypeByID returns the given concrete type for the id or an empty typerecord if it doesn't exist
func (t *TypeStorePGImpl) GetConcreteTypeByID(id int) model.ConcreteTypeRecord {
	t.updateStore()
	for _, ct := range t.concreteTypes {
		if ct.ID == id {
			return ct
		}
	}
	return model.ConcreteTypeRecord{}
}

//GetImplementingIDs returns the id of each type that implements the given interface
func (t *TypeStorePGImpl) GetImplementingIDs(id int) []int {
	val, ok := t.interfaceImplementers[id]
	if ok {
		return val
	}
	return nil
}

func (t *TypeStorePGImpl) GetImplementeeIDs(id int) []int {
	val, ok := t.typeImplementees[id]
	if ok {
		return val
	}
	return nil
}

func (t *TypeStorePGImpl) updateStore() {
	rate, err := strconv.Atoi(os.Getenv("DATABASE_REFRESH_RATE"))
	if err != nil {
		log.Println("unable to read database refresh rate from environment, defaulting to 9999 seconds")
		rate = 9999
	}
	rateDuration := time.Duration(rate)
	if t.lastUpdated.Sub(time.Now()) < time.Second*-rateDuration {
		log.Println("Updating TypeStore from database")
		err := t.getAndParseTypes()
		if err != nil {
			log.Printf("Error updating store: %s\n", err)
		}
		err = t.getAndParseMethods()
		if err != nil {
			log.Printf("Error updating store: %s\n", err)
		} else {
			t.lastUpdated = time.Now()
		}
		t.resolveImplementations()
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
		return fmt.Errorf("unable to retrieve interfaces from database: %s", err)
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
	rows, err := db.GetAllConcreteMethods()
	if err != nil {
		return fmt.Errorf("unable to retrieve concrete methods from database: %s", err.Error())
	}
	defer rows.Close()
	var methods []model.MethodRecord
	var m model.MethodRecord
	for rows.Next() {
		if err := rows.Scan(&m.ID, &m.Package, &m.Name, pq.Array(&m.Parameters), pq.Array(&m.ReturnValues), &m.ReceiverName, &m.ReceiverID); err != nil {
			return fmt.Errorf("unable to parse concrete method row into Method: %s", err.Error())
		}
		methods = append(methods, m)
	}
	for i, ct := range t.concreteTypes {
		for _, m := range methods {
			if m.ReceiverID == ct.ID {
				t.concreteTypes[i].Methods = append(t.concreteTypes[i].Methods, m)
			}
		}
	}
	rows, err = db.GetAllInterfaceMethods()
	if err != nil {
		return fmt.Errorf("unable to retreive interface methods from database: %s", err.Error())
	}
	defer rows.Close()
	methods = []model.MethodRecord{}
	m = model.MethodRecord{}
	for rows.Next() {
		if err = rows.Scan(&m.ID, &m.Package, &m.Name, pq.Array(&m.Parameters), pq.Array(&m.ReturnValues), &m.ReceiverName, &m.ReceiverID); err != nil {
			return fmt.Errorf("unable to parse interface method row into MethodRecord: %s", err.Error())
		}
		methods = append(methods, m)
	}
	for i, iface := range t.interfaces {
		for _, m := range methods {
			if m.ReceiverID == iface.ID {
				t.interfaces[i].Methods = append(t.interfaces[i].Methods, m)
			}
		}
	}
	return nil
}

func (t *TypeStorePGImpl) resolveImplementations() {
	//Resolve interface implementers
	interfaceImplementers := map[int][]int{}
	implementingIds := []int{}
	for _, i := range t.interfaces {
		for _, ct := range t.concreteTypes {
			// check if type s satisfies interface i
			if doesImplement(i, ct) {
				if !util.Contains(implementingIds, ct.ID) {
					implementingIds = append(implementingIds, ct.ID)
				}
			}
		}
		interfaceImplementers[i.ID] = implementingIds
		implementingIds = []int{}
	}
	t.interfaceImplementers = interfaceImplementers

	//Piggy back of the work done above to resolve type implementees
	typeImplementees := map[int][]int{}
	for iface, typeIDs := range interfaceImplementers {
		for _, id := range typeIDs {
			idList, ok := typeImplementees[id]
			if ok {
				typeImplementees[id] = append(idList, iface)
				continue
			}
			typeImplementees[id] = []int{iface}
		}
	}
	t.typeImplementees = typeImplementees
}

func doesImplement(iface model.InterfaceRecord, ct model.ConcreteTypeRecord) bool {
	matchingMethods := 0
	for _, m := range ct.Methods {
		for _, im := range iface.Methods {
			if isEqual(im, m) {
				matchingMethods++
			}
		}
	}
	if len(iface.Methods) == matchingMethods {
		return true
	}
	return false
}

// Equals checks if the provided types.MethodRecord equals the one being called on. This method ignores ID and Package since those are irrelevant to interface implementation.
func isEqual(m1, m2 model.MethodRecord) bool {
	if m1.Name != m2.Name {
		return false
	}
	if !reflect.DeepEqual(m1.Parameters, m2.Parameters) {
		return false
	}
	if !reflect.DeepEqual(m1.ReturnValues, m2.ReturnValues) {
		return false
	}
	return true
}
