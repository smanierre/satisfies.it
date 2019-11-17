package model

import (
	"encoding/json"
	"log"
	"os"

	"github.com/smanierre/typer"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() []TypeRecord
	GetInterface(id int) TypeRecord
}

// TypeRecord is the same as typer.Type, just with an ID added to it so multiple types with the same name can be distinguished from one another.
type TypeRecord struct {
	typer.Type
	ID int `json:"ID"`
}

// InMemoryTypestore is a placeholder typestore until a database is setup
type InMemoryTypestore struct {
	Sequence int          `json:"Sequence"`
	Types    []TypeRecord `json:"Types"`
	dbFile   *os.File
}

// NewTypeStore returns a new, initialized typestore
func NewTypeStore() TypeStore {
	store, err := os.OpenFile("/home/sean/Projects/typer-site/model/db.json", os.O_CREATE|os.O_RDWR, 777)
	if err != nil {
		log.Fatal(err.Error())
	}
	t := &InMemoryTypestore{}
	decoder := json.NewDecoder(store)
	decoder.Decode(t)
	t.dbFile = store
	if t.Sequence < 1 {
		t.Sequence = 1
	}
	return t
}

// GetInterface returns the interface(in the form of a TypeRecord) with a given id, if one doesn't exist, it returns an empty TypeRecord
func (i *InMemoryTypestore) GetInterface(id int) TypeRecord {
	for _, v := range i.Types {
		if v.ID == id && v.BaseType == "interface" {
			return v
		}
	}
	return TypeRecord{}
}

// GetInterfaces returns all the interfaces stored in the "db"
func (i *InMemoryTypestore) GetInterfaces() []TypeRecord {
	var toReturn []TypeRecord
	for _, v := range i.Types {
		if v.BaseType == "interface" {
			toReturn = append(toReturn, v)
		}
	}
	return toReturn
}
