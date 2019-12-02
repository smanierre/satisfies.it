package store

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"
	"reflect"
	"time"

	"github.com/smanierre/typer"
	db "github.com/smanierre/typer-site/store/postgres"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []TypeRecord
	GetInterface(id int) TypeRecord
	GetStructs() []TypeRecord
	GetStruct(id int) TypeRecord
}

// TypeRecord is the same as typer.Type, just with an ID added to it so multiple types with the same name can be distinguished from one another.
type TypeRecord struct {
	Package    string            `json:"Package"`
	Name       string            `json:"Name"`
	BaseType   string            `json:"BaseType"`
	Fields     map[string]string `json:"Fields"`
	Methods    []MethodRecord    `json:"Methods"`
	Signatures []string          `json:"Signatures"`
	ID         int               `json:"ID"`
}

// MethodRecord is a type to encapsulate typer.Method but also to let it have an ID
type MethodRecord struct {
	typer.Method
	ID int `json:"ID"`
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	types                 []TypeRecord
	interfaceImplementers map[int][]int
	lastUpdated           time.Time
}

// NewStore returns an initialized TypeStore with types already retrieved from the database.
func NewStore() (TypeStore, error) {
	t := TypeStorePGImpl{types: []TypeRecord{}}
	types, err := getAndParseTypes()
	if err != nil {
		log.Printf("Error: %s", err)
	}
	t.types = types
	t.resolveImplementations()
	t.lastUpdated = time.Now()
	return &t, nil
}

// GetInterfaces returns a slice of TypeRecords containing all the interfaces in the store.
func (t *TypeStorePGImpl) GetInterfaces() []TypeRecord {
	t.updateStore()
	var interfaces []TypeRecord
	for _, v := range t.types {
		if v.BaseType == "interface" {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

// GetInterface returns a TypeRecord matching the id if it exists and is an interface.
func (t *TypeStorePGImpl) GetInterface(id int) TypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType == "interface" && v.ID == id {
			return v
		}
	}
	return TypeRecord{}
}

// GetStructs returns a slice of TypeRecords containing all the structs in the store.
func (t *TypeStorePGImpl) GetStructs() []TypeRecord {
	t.updateStore()
	var structs []TypeRecord
	for _, v := range t.types {
		if v.BaseType == "struct" {
			structs = append(structs, v)
		}
	}
	return structs
}

// GetStruct returns a TypeRecord matching the id if it exists and is a struct.
func (t *TypeStorePGImpl) GetStruct(id int) TypeRecord {
	t.updateStore()
	for _, v := range t.types {
		if v.BaseType == "struct" && v.ID == id {
			return v
		}
	}
	return TypeRecord{}
}

func (t *TypeStorePGImpl) updateStore() {
	if t.lastUpdated.Sub(time.Now()) < time.Second*-30 {
		log.Println("Updating TypeStore from database")
		types, err := getAndParseTypes()
		if err != nil {
			log.Printf("Error: %s", err)
		} else {
			t.types = types
			t.lastUpdated = time.Now()
		}
	}
}

func getAndParseTypes() ([]TypeRecord, error) {
	rows, err := db.GetAllTypes()
	if err != nil {
		return nil, fmt.Errorf("unable to retrieve types from database: %s", err)
	}
	defer rows.Close()
	var types []TypeRecord
	var t TypeRecord
	var s string
	for rows.Next() {
		if err := rows.Scan(&t.ID, &t.Package, &t.Name, &t.BaseType, &s); err != nil {
			return nil, fmt.Errorf("unable to parse row into TypeRecord: %s", err)
		}
		b := bytes.NewBufferString(s)
		decoder := json.NewDecoder(b)
		decoder.Decode(&t.Fields)
		types = append(types, t)
	}
	return types, nil
}

func getAndParseMethods(types *[]TypeRecord) error {
	rows, err := db.GetAllMethods()
	if err != nil {
		return fmt.Errorf("unable to retrieve methods from database: %s", err)
	}
	defer rows.Close()
	// var methods []MethodRecord
	var m MethodRecord
	var typeIDHolder int
	for rows.Next() {
		if err := rows.Scan(&m.ID, &m.Package, &typeIDHolder, &m.Name, &m.Parameters, &m.ReturnValues); err != nil {
			return fmt.Errorf("unable to parse row into Method: %s", err)
		}
		for _, v := range *types {
			if v.ID == typeIDHolder {
				m.Receiver = fmt.Sprintf("%s.%s", v.Package, v.Name)
			}
		}
	}
	return nil
}

func (t *TypeStorePGImpl) resolveImplementations() {
	interfaces := t.GetInterfaces()
	structs := t.GetStructs()

	interfaceImplementers := map[int][]int{}

	for _, i := range interfaces {
		for _, s := range structs {
			for _, m := 
			if reflect.DeepEqual(i.Methods, s.Methods) {
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

func (m MethodRecord) Equals(record MethodRecord) bool {
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