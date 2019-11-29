package store

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"
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
	typer.Type
	ID int `json:"ID"`
}

// TypeStorePGImpl is a TypeStore implementation that uses a Postgres database
type TypeStorePGImpl struct {
	types       []TypeRecord
	lastUpdated time.Time
}

// NewStore returns an initialized TypeStore with types already retrieved from the database.
func NewStore() (TypeStore, error) {
	t := TypeStorePGImpl{types: []TypeRecord{}}
	types, err := getAndParseTypes()
	if err != nil {
		log.Printf("Error: %s", err)
	}
	t.types = types
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
