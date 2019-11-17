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
	types []model.TypeRecord
}

func NewTestTypeStore() model.TypeStore {
	f, err := os.Open("../testFiles/types.json")
	if err != nil {
		log.Fatal(err.Error())
	}
	var types []model.TypeRecord
	json.NewDecoder(f).Decode(&types)
	return &TestTypeStore{types}
}

func (t *TestTypeStore) GetAllTypes() []model.TypeRecord {
	return t.types
}

func (t *TestTypeStore) GetType(id int) model.TypeRecord {
	for _, v := range t.types {
		if v.ID == id {
			return v
		}
	}
	return model.TypeRecord{}
}

func (t *TestTypeStore) StoreTypes(types []model.TypeRecord) []model.TypeRecord {
	t.types = append(t.types, types...)
	return types
}

func (t *TestTypeStore) RemoveType(id int) bool {
	for i, v := range t.types {
		if v.ID == id {
			t.types = append(t.types[:i], t.types[i+1:]...)
			return true
		}
	}
	return false
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
			Name:     "test get type by id",
			Path:     "/api/types/2",
			Function: handleGetTypeTest,
		},
		// { Posting isn't enabled yet so not going to test for now
		// 	Name:     "test post types",
		// 	Path:     "/api/types",
		// 	Function: handleRootPost,
		// },
	}

	for _, tc := range tt {
		t.Run(tc.Name, func(t *testing.T) {
			tc.Function(t, tc.Path)
		})
	}

}

func handleRootGet(t *testing.T, path string) {
	expected := []model.TypeRecord{
		{
			Type: typer.Type{Package: "aims",
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
		}, {
			Type: typer.Type{
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
			ID: 2,
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
	expected := model.TypeRecord{

		Type: typer.Type{
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
		ID: 2,
	}

	request, err := http.NewRequest(http.MethodGet, path, nil)
	if err != nil {
		t.Fatal(err.Error())
	}
	response := httptest.NewRecorder()
	s.ServeHTTP(response, request)
	decoder := json.NewDecoder(response.Body)
	var got model.TypeRecord
	decoder.Decode(&got)
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}

func handleRootPost(t *testing.T, path string) {
	expected := []model.TypeRecord{
		{
			Type: typer.Type{
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
			ID: 1,
		},
		{
			Type: typer.Type{
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
			ID: 2,
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
	var got []model.TypeRecord
	decoder.Decode(&got)
	if !reflect.DeepEqual(expected, got) {
		t.Errorf("Got: %+v\nExpected: %+v\n", got, expected)
	}
}
