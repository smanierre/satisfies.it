package server

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
)

type StubTypeStore struct{}

var concreteTypes []model.ConcreteTypeRecord = []model.ConcreteTypeRecord{
	{
		Name:     "Test",
		BaseType: "struct",
		ID:       1,
		Methods:  []model.MethodRecord{},
		Package:  "test",
	},
	{
		Name:     "Test2",
		BaseType: "int",
		ID:       2,
		Methods:  []model.MethodRecord{},
		Package:  "test",
	},
	{
		Name:     "Test",
		BaseType: "int",
		ID:       3,
		Methods:  []model.MethodRecord{},
		Package:  "test",
	},
}

var interfaces []model.InterfaceRecord = []model.InterfaceRecord{
	{
		Name:          "InterfaceOne",
		ID:            1,
		Implementable: true,
		Methods: []model.MethodRecord{
			{
				Name:         "MethodOne",
				ID:           1,
				Package:      "test",
				Parameters:   []string{"int"},
				ReturnValues: []string{},
				ReceiverID:   1,
				ReceiverName: "",
			},
		},
		Package: "test",
	}, {
		Name:          "InterfaceTwo",
		ID:            2,
		Implementable: true,
		Methods: []model.MethodRecord{
			{
				Name:         "MethodOne",
				ID:           2,
				Package:      "test",
				Parameters:   []string{},
				ReturnValues: []string{"error"},
				ReceiverID:   2,
				ReceiverName: "",
			},
			{
				Name:         "MethodTwo",
				ID:           3,
				Package:      "test",
				Parameters:   []string{"*int", "*io.Writer"},
				ReturnValues: []string{},
				ReceiverID:   2,
				ReceiverName: "",
			},
		},
	}, {
		Name:          "InterfaceTwo",
		ID:            3,
		Implementable: true,
		Package:       "test",
		Methods:       []model.MethodRecord{},
	},
}

//GetConcreteTypeByID is just a placeholder method
func (s StubTypeStore) GetConcreteTypeByID(id int) model.ConcreteTypeRecord {
	for _, ct := range concreteTypes {
		if ct.ID == id {
			return ct
		}
	}
	return model.ConcreteTypeRecord{}
}

//GetConcreteTypes is just a placeholder method
func (s StubTypeStore) GetConcreteTypes() []model.ConcreteTypeRecord {
	return concreteTypes
}

//GetConcreteTypesByName is just a placeholder method
func (s StubTypeStore) GetConcreteTypesByName(name string) []model.ConcreteTypeRecord {
	toReturn := []model.ConcreteTypeRecord{}
	for _, ct := range concreteTypes {
		if ct.Name == name {
			toReturn = append(toReturn, ct)
		}
	}
	return toReturn
}

//GetImplementingIDs is just a placeholder method
func (s StubTypeStore) GetImplementingIDs(id int) []int {
	iface := s.GetInterfaceByID(id)
	ids := []int{}
	if len(iface.Methods) == 0 {
		for _, ct := range concreteTypes {
			ids = append(ids, ct.ID)
		}
		return ids
	}
	return nil
}

//GetInterfaceByID is just a placehoder method
func (s StubTypeStore) GetInterfaceByID(id int) model.InterfaceRecord {
	for _, in := range interfaces {
		if in.ID == id {
			return in
		}
	}
	return model.InterfaceRecord{}
}

//GetInterfaces is just a placeholder method
func (s StubTypeStore) GetInterfaces() []model.InterfaceRecord {
	return interfaces
}

//GetImplementeeIDs is just a placehoder method
func (s StubTypeStore) GetImplementeeIDs(id int) []int {
	return []int{}
}

//GetInterfacesByName is just a placeholder method
func (s StubTypeStore) GetInterfacesByName(name string) []model.InterfaceRecord {
	matches := []model.InterfaceRecord{}
	for _, i := range interfaces {
		if i.Name == name {
			matches = append(matches, i)
		}
	}
	return matches
}

var srv Server = NewServer(StubTypeStore{})

func TestGetConcreteTypeById(t *testing.T) {
	tc := []struct {
		Name             string
		Method           string
		Endpoint         string
		ExpectedStatus   int
		ExpectedResponse model.ConcreteTypeRecord
	}{
		{
			Name:           "get known type",
			Method:         http.MethodGet,
			Endpoint:       "/api/type/1",
			ExpectedStatus: 200,
			ExpectedResponse: model.ConcreteTypeRecord{
				Name:     "Test",
				BaseType: "struct",
				ID:       1,
				Methods:  []model.MethodRecord{},
				Package:  "test",
			},
		}, {
			Name:             "get missing type",
			Method:           http.MethodGet,
			Endpoint:         "/api/type/999",
			ExpectedStatus:   404,
			ExpectedResponse: model.ConcreteTypeRecord{},
		}, {
			Name:             "post method",
			Method:           http.MethodPost,
			Endpoint:         "/api/type/1",
			ExpectedStatus:   405,
			ExpectedResponse: model.ConcreteTypeRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := model.ConcreteTypeRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetConcreteTypesByName(t *testing.T) {
	tc := []struct {
		Name             string
		Method           string
		Endpoint         string
		ExpectedStatus   int
		ExpectedResponse []model.ConcreteTypeRecord
	}{
		{
			Name:           "unique type name",
			Endpoint:       "/api/type/Test2",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.ConcreteTypeRecord{
				{Name: "Test2", BaseType: "int", ID: 2, Methods: []model.MethodRecord{}, Package: "test"},
			},
		}, {
			Name:           "non unique type name",
			Endpoint:       "/api/type/Test",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.ConcreteTypeRecord{
				{
					Name:     "Test",
					BaseType: "struct",
					ID:       1,
					Methods:  []model.MethodRecord{},
					Package:  "test",
				}, {
					Name:     "Test",
					BaseType: "int",
					ID:       3,
					Methods:  []model.MethodRecord{},
					Package:  "test",
				},
			},
		}, {
			Name:             "post method",
			Endpoint:         "/api/type/Test",
			Method:           http.MethodPost,
			ExpectedStatus:   405,
			ExpectedResponse: []model.ConcreteTypeRecord{},
		}, {
			Name:             "non-existant type",
			Endpoint:         "/api/type/NotHere",
			Method:           http.MethodGet,
			ExpectedStatus:   404,
			ExpectedResponse: []model.ConcreteTypeRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := []model.ConcreteTypeRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetConcreteTypes(t *testing.T) {
	tc := []struct {
		Name             string
		Method           string
		Endpoint         string
		ExpectedStatus   int
		ExpectedResponse []model.ConcreteTypeRecord
	}{
		{
			Name:           "get method",
			Endpoint:       "/api/type",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.ConcreteTypeRecord{
				{
					Name:     "Test",
					BaseType: "struct",
					ID:       1,
					Methods:  []model.MethodRecord{},
					Package:  "test",
				},
				{
					Name:     "Test2",
					BaseType: "int",
					ID:       2,
					Methods:  []model.MethodRecord{},
					Package:  "test",
				},
				{
					Name:     "Test",
					BaseType: "int",
					ID:       3,
					Methods:  []model.MethodRecord{},
					Package:  "test",
				},
			},
		}, {
			Name:             "delete method",
			Endpoint:         "/api/type",
			Method:           http.MethodDelete,
			ExpectedStatus:   405,
			ExpectedResponse: []model.ConcreteTypeRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := []model.ConcreteTypeRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetInterfaceByID(t *testing.T) {
	tc := []struct {
		Name             string
		Endpoint         string
		Method           string
		ExpectedStatus   int
		ExpectedResponse model.InterfaceRecord
	}{
		{
			Name:           "get known interface",
			Endpoint:       "/api/interface/1",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: model.InterfaceRecord{
				Name:          "InterfaceOne",
				ID:            1,
				Implementable: true,
				Methods: []model.MethodRecord{
					{
						Name:         "MethodOne",
						ID:           1,
						Package:      "test",
						Parameters:   []string{"int"},
						ReturnValues: []string{},
						ReceiverID:   1,
						ReceiverName: "",
					},
				},
				Package: "test",
			},
		}, {
			Name:             "get missing interface",
			Endpoint:         "/api/interface/999",
			Method:           http.MethodGet,
			ExpectedStatus:   404,
			ExpectedResponse: model.InterfaceRecord{},
		}, {
			Name:             "put method",
			Endpoint:         "/api/interface/1",
			Method:           http.MethodPut,
			ExpectedStatus:   405,
			ExpectedResponse: model.InterfaceRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := model.InterfaceRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetInterfaces(t *testing.T) {
	tc := []struct {
		Name             string
		Endpoint         string
		Method           string
		ExpectedStatus   int
		ExpectedResponse []model.InterfaceRecord
	}{
		{
			Name:           "get method",
			Endpoint:       "/api/interface",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.InterfaceRecord{
				{
					Name:          "InterfaceOne",
					ID:            1,
					Implementable: true,
					Methods: []model.MethodRecord{
						{
							Name:         "MethodOne",
							ID:           1,
							Package:      "test",
							Parameters:   []string{"int"},
							ReturnValues: []string{},
							ReceiverID:   1,
							ReceiverName: "",
						},
					},
					Package: "test",
				}, {
					Name:          "InterfaceTwo",
					ID:            2,
					Implementable: true,
					Methods: []model.MethodRecord{
						{
							Name:         "MethodOne",
							ID:           2,
							Package:      "test",
							Parameters:   []string{},
							ReturnValues: []string{"error"},
							ReceiverID:   2,
							ReceiverName: "",
						},
						{
							Name:         "MethodTwo",
							ID:           3,
							Package:      "test",
							Parameters:   []string{"*int", "*io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   2,
							ReceiverName: "",
						},
					},
				}, {
					Name:          "InterfaceTwo",
					ID:            3,
					Implementable: true,
					Package:       "test",
					Methods:       []model.MethodRecord{},
				},
			},
		}, {
			Name:             "post method",
			Endpoint:         "/api/interface",
			Method:           http.MethodPost,
			ExpectedStatus:   405,
			ExpectedResponse: []model.InterfaceRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := []model.InterfaceRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetInterfacesByName(t *testing.T) {
	tc := []struct {
		Name             string
		Endpoint         string
		Method           string
		ExpectedStatus   int
		ExpectedResponse []model.InterfaceRecord
	}{
		{
			Name:           "unique interface",
			Endpoint:       "/api/interface/InterfaceOne",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.InterfaceRecord{
				{
					Name:          "InterfaceOne",
					ID:            1,
					Implementable: true,
					Methods: []model.MethodRecord{
						{
							Name:         "MethodOne",
							ID:           1,
							Package:      "test",
							Parameters:   []string{"int"},
							ReturnValues: []string{},
							ReceiverID:   1,
							ReceiverName: "",
						},
					},
					Package: "test",
				},
			},
		}, {
			Name:           "non-unique interface",
			Endpoint:       "/api/interface/InterfaceTwo",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: []model.InterfaceRecord{
				{
					Name:          "InterfaceTwo",
					ID:            2,
					Implementable: true,
					Methods: []model.MethodRecord{
						{
							Name:         "MethodOne",
							ID:           2,
							Package:      "test",
							Parameters:   []string{},
							ReturnValues: []string{"error"},
							ReceiverID:   2,
							ReceiverName: "",
						},
						{
							Name:         "MethodTwo",
							ID:           3,
							Package:      "test",
							Parameters:   []string{"*int", "*io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   2,
							ReceiverName: "",
						},
					},
				}, {
					Name:          "InterfaceTwo",
					ID:            3,
					Implementable: true,
					Package:       "test",
					Methods:       []model.MethodRecord{},
				},
			},
		}, {
			Name:             "missing interface",
			Endpoint:         "/api/interface/NotHere",
			Method:           http.MethodGet,
			ExpectedStatus:   404,
			ExpectedResponse: []model.InterfaceRecord{},
		}, {
			Name:             "bad method",
			Endpoint:         "/api/interface/InterfaceOne",
			Method:           http.MethodPatch,
			ExpectedStatus:   405,
			ExpectedResponse: []model.InterfaceRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := []model.InterfaceRecord{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestGetImplementingIDs(t *testing.T) {
	tc := []struct {
		Name             string
		Endpoint         string
		Method           string
		ExpectedStatus   int
		ExpectedResponse struct {
			Interface    model.InterfaceRecord
			Implementers []model.ConcreteTypeRecord
		}
	}{
		{
			Name:           "With no Implementers",
			Endpoint:       "/api/implementers/1",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: struct {
				Interface    model.InterfaceRecord
				Implementers []model.ConcreteTypeRecord
			}{Interface: model.InterfaceRecord{
				Name:          "InterfaceOne",
				ID:            1,
				Implementable: true,
				Methods: []model.MethodRecord{
					{
						Name:         "MethodOne",
						ID:           1,
						Package:      "test",
						Parameters:   []string{"int"},
						ReturnValues: []string{},
						ReceiverID:   1,
						ReceiverName: "",
					},
				},
				Package: "test",
			}, Implementers: []model.ConcreteTypeRecord{}},
		}, {
			Name:           "multiple implementers",
			Endpoint:       "/api/implementers/3",
			Method:         http.MethodGet,
			ExpectedStatus: 200,
			ExpectedResponse: struct {
				Interface    model.InterfaceRecord
				Implementers []model.ConcreteTypeRecord
			}{
				Interface: model.InterfaceRecord{
					Name:          "InterfaceTwo",
					ID:            3,
					Implementable: true,
					Package:       "test",
					Methods:       []model.MethodRecord{},
				},
				Implementers: concreteTypes,
			},
		}, {
			Name:           "bad method",
			Endpoint:       "/api/implementers/1",
			Method:         http.MethodTrace,
			ExpectedStatus: 405,
			ExpectedResponse: struct {
				Interface    model.InterfaceRecord
				Implementers []model.ConcreteTypeRecord
			}{},
		}, {
			Name:           "bad interface id",
			Endpoint:       "/api/implementers/Writer",
			Method:         http.MethodGet,
			ExpectedStatus: 400,
			ExpectedResponse: struct {
				Interface    model.InterfaceRecord
				Implementers []model.ConcreteTypeRecord
			}{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			req := httptest.NewRequest(tt.Method, tt.Endpoint, nil)
			res := httptest.NewRecorder()
			srv.ServeHTTP(res, req)
			if res.Code != tt.ExpectedStatus {
				t.Errorf("Expected status code %d, got %d", tt.ExpectedStatus, res.Code)
			}
			record := struct {
				Interface    model.InterfaceRecord
				Implementers []model.ConcreteTypeRecord
			}{}
			json.NewDecoder(res.Body).Decode(&record)
			if !reflect.DeepEqual(record, tt.ExpectedResponse) {
				t.Errorf("Expected %+v, got %+v\n", tt.ExpectedResponse, record)
			}
		})
	}
}

func TestIntentional404(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/api/itnerface/1", nil)
	res := httptest.NewRecorder()
	srv.ServeHTTP(res, req)
	if res.Code != 404 {
		t.Errorf("Expected 404, got %d\n", res.Code)
	}
}
