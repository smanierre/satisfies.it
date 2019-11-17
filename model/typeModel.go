package model

import (
	"encoding/json"
	"log"
	"os"

	"github.com/smanierre/typer"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetAllTypes() []TypeRecord
	GetType(id int) TypeRecord
	StoreTypes([]TypeRecord) []TypeRecord
	RemoveType(id int) bool
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

// GetAllTypes gets all types
func (i *InMemoryTypestore) GetAllTypes() []TypeRecord {
	return i.Types
}

//GetType gets a specific type
func (i *InMemoryTypestore) GetType(id int) TypeRecord {
	for _, v := range i.Types {
		if v.ID == id {
			return v
		}
	}
	return TypeRecord{}
}

//StoreTypes stores specific types
func (i *InMemoryTypestore) StoreTypes(types []TypeRecord) []TypeRecord {
	i.Types = append(i.Types, types...)
	i.dbFile.Truncate(0)
	i.dbFile.Seek(0, 0)
	json.NewEncoder(i.dbFile).Encode(i)
	return types
}

// RemoveType removes a specific type
func (i *InMemoryTypestore) RemoveType(id int) bool {
	for index, v := range i.Types {
		if v.ID == id {
			i.Types = append(i.Types[:index], i.Types[index+1:]...)
			i.dbFile.Truncate(0)
			i.dbFile.Seek(0, 0)
			json.NewEncoder(i.dbFile).Encode(i)
			return true
		}
	}
	return false
}
