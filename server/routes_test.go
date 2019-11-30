package server

import (
	"encoding/json"
	"log"
	"net/http"
	"net/http/httptest"
	"os"
	"reflect"
	"testing"

	"github.com/smanierre/typer"
	"github.com/smanierre/typer-site/store"
)

var s = NewServer(NewTypeStore("./../testFiles/types.json"))

// InMemoryTypestore is a placeholder typestore until a database is setup
type InMemoryTypestore struct {
	Sequence int                `json:"Sequence"`
	Types    []store.TypeRecord `json:"Types"`
	dbFile   *os.File
}

// NewTypeStore returns a new, initialized typestore
func NewTypeStore(path string) store.TypeStore {
	store, err := os.OpenFile(path, os.O_CREATE|os.O_RDWR, 777)
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
func (i *InMemoryTypestore) GetInterface(id int) store.TypeRecord {
	for _, v := range i.Types {
		if v.ID == id && v.BaseType == "interface" {
			return v
		}
	}
	return store.TypeRecord{}
}

// GetInterfaces returns all the interfaces stored in the "db"
func (i *InMemoryTypestore) GetInterfaces() []store.TypeRecord {
	var toReturn []store.TypeRecord
	for _, v := range i.Types {
		if v.BaseType == "interface" {
			toReturn = append(toReturn, v)
		}
	}
	return toReturn
}

func (i *InMemoryTypestore) GetStructs() []store.TypeRecord {
	var toReturn []store.TypeRecord
	for _, v := range i.Types {
		if v.BaseType == "struct" {
			toReturn = append(toReturn, v)
		}
	}
	return toReturn
}

func (i *InMemoryTypestore) GetStruct(id int) store.TypeRecord {
	for _, v := range i.Types {
		if v.ID == id && v.BaseType == "struct" {
			return v
		}
	}
	return store.TypeRecord{}
}

func TestGetInterface(t *testing.T) {
	expected := store.TypeRecord{
		Package:  "builtin",
		BaseType: "interface",
		Name:     "error",
		Fields:   map[string]string{},
		Methods:  []store.MethodRecord{},
		Signatures: []string{
			"Error() string",
		},
		ID: 3,
	}
	request, err := http.NewRequest(http.MethodGet, "/api/interface/3", nil)
	if err != nil {
		t.Fatal(err.Error())
	}

	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	var got store.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}

func TestGetInterfaces(t *testing.T) {
	expected := []store.TypeRecord{
		{

			Package:  "builtin",
			BaseType: "interface",
			Name:     "error",
			Fields:   map[string]string{},
			Methods:  []store.MethodRecord{},
			Signatures: []string{
				"Error() string",
			},
			ID: 3,
		},
		{
			Package:  "test",
			BaseType: "interface",
			Name:     "TestInterface",
			Fields:   map[string]string{},
			Methods:  []store.MethodRecord{},
			Signatures: []string{
				"TestMethod() int",
			},
			ID: 4,
		},
	}

	request, err := http.NewRequest(http.MethodGet, "/api/interface", nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	var got []store.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}

func TestGetStruct(t *testing.T) {
	expected := store.TypeRecord{
		Package:  "aims",
		Name:     "Header",
		BaseType: "struct",
		Fields:   map[string]string{},
		Methods: []store.MethodRecord{
			{
				ID: 1,
				Method: typer.Method{
					Package:    "aims",
					Receiver:   "*Header",
					Name:       "FileInfo",
					Parameters: []string{},
					ReturnValues: []string{
						"os.FileInfo",
					},
				},
			},
		},
		Signatures: []string{},
		ID:         1,
	}
	request, err := http.NewRequest(http.MethodGet, "/api/struct/1", nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	var got store.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}
