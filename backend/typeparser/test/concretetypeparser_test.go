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
			p := typeparser.NewParser()
			err := p.ParseFile(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(p.ConcreteTypes, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, p.ConcreteTypes)
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
		}, {
			Name:     "Extracting multiple complex custom types",
			Filepath: "../../testFiles/multipleComplexCustomTypes.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "TypeOne",
					BaseType: "map[string]func(int) (error, *io.Writer)",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
				{
					Package:  "test",
					Name:     "TypeTwo",
					BaseType: "*io.ReadWriter",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				}, {
					Package:  "test",
					Name:     "TypeThree",
					BaseType: "func(interface{})",
					Methods:  []model.MethodRecord{},
					ID:       -1,
				},
			},
		},
	}
	//TODO: Add tests for more of the concrete types that were missing beforehand
	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			p := typeparser.NewParser()
			err := p.ParseFile(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(p.ConcreteTypes, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, p.ConcreteTypes)
			}
		})
	}
}
