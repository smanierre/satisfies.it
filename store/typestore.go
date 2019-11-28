package model

import (
	"time"
	"fmt"
	"log"

	db "github.com/smanierre/store/postgres"
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
	types []TypeRecord
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
	return t, nil
}

// GetInterfaces returns a slice of TypeRecords containing all the interfaces in the store.
func (t *TypeStorePGImpl) GetInterfaces() []TypeRecord {
	if time.
	var interfaces []TypeRecord
	for _, v := range t.types {
		if v.BaseType == "interface" {
			interfaces = append(interfaces, v)
		}
	}
	return interfaces
}

func getAndParseTypes() ([]TypeRecord, error) {
	rows, err := db.GetAllTypes()
	if err != nil {
		return nil, fmt.Errorf("unable to retrieve types from database: %s", err)
	}
	defer rows.Close()
	var types []TypeRecord
	var t TypeRecord
	for rows.Next() {
		if err := rows.Scan(&t); err != nil {
			return nil, fmt.Errorf("unable to parse row into TypeRecord: %s", err)
		}
		types = append(types, t)
	}
	return types, nil
}