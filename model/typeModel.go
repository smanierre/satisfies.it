package model

import (
	"encoding/json"
	"log"
	"os"

	"github.com/smanierre/typer"
)

type TypeStore interface {
	GetAllTypes() []TypeRecord
	GetType(id int) TypeRecord
	StoreTypes([]TypeRecord) []TypeRecord
	RemoveType(id int) bool
}

type TypeRecord struct {
	typer.Type
	Id int `json: "Id"`
}

type InMemoryTypestore struct {
	Sequence int          `json:"Sequence"`
	Types    []TypeRecord `json: "Types"`
	dbFile   *os.File
}

func NewTypeStore() TypeStore {
	store, err := os.OpenFile("/home/seanmanierre/Projects/typer-site/model/db.json", os.O_CREATE|os.O_RDWR, 777)
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

func (i *InMemoryTypestore) GetAllTypes() []TypeRecord {
	return i.Types
}

func (i *InMemoryTypestore) GetType(id int) TypeRecord {
	for _, v := range i.Types {
		if v.Id == id {
			return v
		}
	}
	return TypeRecord{}
}

func (i *InMemoryTypestore) StoreTypes(types []TypeRecord) []TypeRecord {
	i.Types = append(i.Types, types...)
	i.dbFile.Truncate(0)
	i.dbFile.Seek(0, 0)
	json.NewEncoder(i.dbFile).Encode(i)
	return types
}

func (i *InMemoryTypestore) RemoveType(id int) bool {
	for index, v := range i.Types {
		if v.Id == id {
			i.Types = append(i.Types[:index], i.Types[index+1:]...)
			i.dbFile.Truncate(0)
			i.dbFile.Seek(0, 0)
			json.NewEncoder(i.dbFile).Encode(i)
			return true
		}
	}
	return false
}
