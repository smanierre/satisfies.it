package server

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"reflect"
	"testing"

	"github.com/smanierre/typer"
	"github.com/smanierre/typer-site/model"
)

var s Server = NewServer(model.NewTypeStore("./../testFiles/types.json"))

func TestGetInterface(t *testing.T) {
	expected := model.TypeRecord{
		Type: typer.Type{
			Package:  "builtin",
			BaseType: "interface",
			Name:     "error",
			Fields:   map[string]string{},
			Methods:  []typer.Method{},
			Signatures: []string{
				"Error() string",
			},
		},
		ID: 3,
	}
	request, err := http.NewRequest(http.MethodGet, "/api/interface/3", nil)
	if err != nil {
		t.Fatal(err.Error())
	}

	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	var got model.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}

func TestGetInterfaces(t *testing.T) {
	expected := []model.TypeRecord{
		{
			Type: typer.Type{
				Package:  "builtin",
				BaseType: "interface",
				Name:     "error",
				Fields:   map[string]string{},
				Methods:  []typer.Method{},
				Signatures: []string{
					"Error() string",
				},
			},
			ID: 3,
		},
		{
			Type: typer.Type{
				Package:  "test",
				BaseType: "interface",
				Name:     "TestInterface",
				Fields:   map[string]string{},
				Methods:  []typer.Method{},
				Signatures: []string{
					"TestMethod() int",
				},
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
	var got []model.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}

func TestGetStruct(t *testing.T) {
	expected := model.TypeRecord{
		Type: typer.Type{
			Package:  "aims",
			Name:     "Header",
			BaseType: "struct",
			Fields:   map[string]string{},
			Methods: []typer.Method{
				{
					Package:    "aims",
					Receiver:   "*Header",
					Name:       "FileInfo",
					Parameters: []string{},
					ReturnValues: []string{
						"os.FileInfo",
					},
				},
			},
			Signatures: []string{},
		},
		ID: 1,
	}
	request, err := http.NewRequest(http.MethodGet, "/api/struct/1", nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	var got model.TypeRecord
	err = json.NewDecoder(response.Body).Decode(&got)
	if err != nil {
		t.Errorf("unable to deserialize json: %s\n", err.Error())
	}
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}
