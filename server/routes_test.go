package server

import (
	"bytes"
	"encoding/json"
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"net/http/httptest"
	"os"
	"reflect"
	"testing"

	"github.com/smanierre/typer"
	"github.com/smanierre/typer-site/model"
)

type TestTypeStore struct {
	types []typer.Type
}

func NewTestTypeStore() model.TypeStore {
	f, err := os.Open("../testFiles/types.json")
	if err != nil {
		log.Fatal(err.Error())
	}
	var types []typer.Type
	json.NewDecoder(f).Decode(&types)
	return &TestTypeStore{types}
}

func (t *TestTypeStore) GetAllTypes() []typer.Type {
	return t.types
}

func (t *TestTypeStore) GetType(s string) []typer.Type {
	var toReturn []typer.Type
	for _, v := range t.types {
		if v.Name == s {
			toReturn = append(toReturn, v)
		}
	}
	return toReturn
}

func (t *TestTypeStore) StoreTypes(types []typer.Type) []typer.Type {
	t.types = append(t.types, types...)
	return types
}

var s Server = NewServer(NewTestTypeStore())

func TestHandlers(t *testing.T) {
	tt := []struct {
		Name     string
		Path     string
		Function func(t *testing.T, path string)
	}{
		{
			Name:     "test get root",
			Path:     "/api/types",
			Function: handleRootGet,
		},
		{
			Name:     "test get type by name",
			Path:     "/api/types/sparseEntry",
			Function: handleGetTypeTest,
		},
		{
			Name:     "test post types",
			Path:     "/api/types",
			Function: handleRootPost,
		},
	}

	for _, tc := range tt {
		t.Run(tc.Name, func(t *testing.T) {
			tc.Function(t, tc.Path)
		})
	}

}

func handleRootGet(t *testing.T, path string) {
	expected := []typer.Type{
		{
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
		}, {
			Package:  "aims",
			Name:     "sparseEntry",
			BaseType: "struct",
			Fields: map[string]string{
				"Offset": "embedded",
			},
			Methods: []typer.Method{
				{
					Package:    "aims",
					Receiver:   "sparseEntry",
					Name:       "endOffset",
					Parameters: []string{},
					ReturnValues: []string{
						"int64",
					},
				},
			},

			Signatures: []string{},
		},
	}

	request, err := http.NewRequest(http.MethodGet, path, nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	processResponse(t, response.Body, expected)

}

func handleGetTypeTest(t *testing.T, path string) {
	expected := []typer.Type{
		{
			Package:  "aims",
			Name:     "sparseEntry",
			BaseType: "struct",
			Fields: map[string]string{
				"Offset": "embedded",
			},
			Methods: []typer.Method{
				{
					Package:    "aims",
					Receiver:   "sparseEntry",
					Name:       "endOffset",
					Parameters: []string{},
					ReturnValues: []string{
						"int64",
					},
				},
			},

			Signatures: []string{},
		},
	}
	request, err := http.NewRequest(http.MethodGet, path, nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()

	s.ServeHTTP(response, request)
	processResponse(t, response.Body, expected)
}

func handleRootPost(t *testing.T, path string) {
	expected := []typer.Type{
		{
			Package:  "main",
			Name:     "FirstInterface",
			BaseType: "interface",
			Fields:   map[string]string{},
			Methods:  []typer.Method{},
			Signatures: []string{
				"first()",
				"second(a int)",
				"Third(b bool) io.ReadWriter",
			},
		},
		{
			Package:  "main",
			Name:     "SecondInterface",
			BaseType: "interface",
			Fields:   map[string]string{},
			Methods:  []typer.Method{},
			Signatures: []string{
				"secondFirst(f float64)",
				"secondSecond(b bool) bool",
				"secondThird(a, b, c string, f float32) *io.Reader",
			},
		},
		{
			Package:  "main",
			Name:     "FirstStruct",
			BaseType: "struct",
			Fields: map[string]string{
				"FirstField":  "string",
				"SecondField": "float64",
				"ThirdField":  "*int",
			},
			Methods:    []typer.Method{},
			Signatures: []string{},
		},
		{
			Package:  "main",
			Name:     "SecondStruct",
			BaseType: "struct",
			Fields: map[string]string{
				"*FirstStruct":      "embedded",
				"SecondFirstField":  "string",
				"SecondSecondField": "int",
			},
			Methods:    []typer.Method{},
			Signatures: []string{},
		},
		{
			Package:    "main",
			Name:       "FirstCustomType",
			BaseType:   "float64",
			Fields:     map[string]string{},
			Methods:    []typer.Method{},
			Signatures: []string{},
		},
		{
			Package:    "main",
			Name:       "SecondCustomType",
			BaseType:   "string",
			Fields:     map[string]string{},
			Methods:    []typer.Method{},
			Signatures: []string{},
		},
	}
	testFile, err := os.Open("./../testFiles/withMultipleOfEach.go")
	if err != nil {
		t.Fatal(err.Error())
	}
	values := map[string]io.Reader{
		"files": testFile,
	}
	var b bytes.Buffer
	w := multipart.NewWriter(&b)
	for key, r := range values {
		var fw io.Writer
		if x, ok := r.(io.Closer); ok {
			defer x.Close()
		}
		if x, ok := r.(*os.File); ok {
			if fw, err = w.CreateFormFile(key, x.Name()); err != nil {
				t.Fatalf("Error creating form: %s\n", err.Error())
			}
		}
		if _, err = io.Copy(fw, r); err != nil {
			t.Fatalf("Error creating form: %s\n", err.Error())
		}
	}
	w.Close()

	request, err := http.NewRequest(http.MethodPost, path, &b)
	request.Header.Set("Content-Type", w.FormDataContentType())
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	processResponse(t, response.Body, expected)
}

func processResponse(t *testing.T, res io.Reader, expected interface{}) {
	t.Helper()
	decoder := json.NewDecoder(res)
	var got []typer.Type
	decoder.Decode(&got)
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}
