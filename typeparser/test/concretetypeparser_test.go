package typeparser_test

import (
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func TestStructExtraction(t *testing.T) {
	tc := []struct {
		Name     string
		Filepath string
		Expected []model.ConcreteTypeRecord
	}{
		{
			Name:     "Extract single struct",
			Filepath: "../../testFiles/singleStruct.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "StructOne",
					BaseType: "struct",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
			},
		}, {
			Name:     "Extract multiple structs",
			Filepath: "../../testFiles/multipleStructs.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "StructOne",
					BaseType: "struct",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				}, {
					Package:  "test",
					Name:     "StructTwo",
					BaseType: "struct",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
			},
		}, {
			Name:     "unexported struct",
			Filepath: "../../testFiles/unexportedStruct.go",
			Expected: []model.ConcreteTypeRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			results, err := typeparser.ExtractConcreteTypes(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(results, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, results)
			}
		})
	}
}

func TestCustomTypeExtraction(t *testing.T) {
	tc := []struct {
		Name     string
		Filepath string
		Expected []model.ConcreteTypeRecord
	}{
		{
			Name:     "Extracting single custom type",
			Filepath: "../../testFiles/singleCustomType.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "CustomTypeOne",
					BaseType: "rune",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
			},
		}, {
			Name:     "Extracting multiple custom types",
			Filepath: "../../testFiles/multipleCustomTypes.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "CustomTypeOne",
					BaseType: "uintptr",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				}, {
					Package:  "test",
					Name:     "CustomTypeTwo",
					BaseType: "bool",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			results, err := typeparser.ExtractConcreteTypes(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(results, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, results)
			}
		})
	}
}
