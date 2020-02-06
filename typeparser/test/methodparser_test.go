package typeparser_test

import (
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func TestMethodExtraction(t *testing.T) {
	tc := []struct {
		Name     string
		Filepath string
		Expected []model.MethodRecord
	}{
		{
			Name:     "Extract single method",
			Filepath: "../../testFiles/singleTypeMethod.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "MethodOne",
					Parameters:   []string{},
					ReturnValues: []string{},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Extract multiple methods on one type",
			Filepath: "../../testFiles/multipleMethodsOneType.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "MethodOne",
					Parameters:   []string{},
					ReturnValues: []string{},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				}, {
					Package:      "test",
					Name:         "MethodTwo",
					Parameters:   []string{},
					ReturnValues: []string{},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Extract methods from different types",
			Filepath: "../../testFiles/multipleMethodsMultipleTypes.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "FirstMethodOne",
					Parameters:   []string{},
					ReturnValues: []string{},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				}, {
					Package:      "test",
					Name:         "SecondMethodOne",
					Parameters:   []string{},
					ReturnValues: []string{},
					ReceiverName: "TypeTwo",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Extract methods with parameters",
			Filepath: "../../testFiles/methodsWithParameters.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "MethodOne",
					Parameters:   []string{"int", "io.Writer"},
					ReturnValues: []string{},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Extract methods with return values",
			Filepath: "../../testFiles/methodsWithReturnValues.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "MethodOne",
					Parameters:   []string{},
					ReturnValues: []string{"error", "int"},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Extract methods with parameters and return values",
			Filepath: "../../testFiles/methodsWithParamsAndReturn.go",
			Expected: []model.MethodRecord{
				{
					Package:      "test",
					Name:         "MethodOne",
					Parameters:   []string{"int", "int", "int"},
					ReturnValues: []string{"interface{}", "string", "error"},
					ReceiverName: "TypeOne",
					ReceiverID:   -1,
					ID:           -1,
				},
			},
		}, {
			Name:     "Unexported methods",
			Filepath: "../../testFiles/unexportedMethods.go",
			Expected: []model.MethodRecord{},
		}, {
			Name:     "Exported method on unexported type",
			Filepath: "../../testFiles/exportedMethodUnexportedType.go",
			Expected: []model.MethodRecord{},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			p := typeparser.NewParser()
			err := p.ParseFile(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(p.Methods, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, p.Methods)
			}
		})
	}
}
