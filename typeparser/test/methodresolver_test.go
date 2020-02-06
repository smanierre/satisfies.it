package typeparser_test

import (
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func TestResolveMethods(t *testing.T) {
	tc := []struct {
		Name     string
		FilePath string
		Expected []model.ConcreteTypeRecord
	}{
		{
			Name:     "Single method on a single type",
			FilePath: "../../testFiles/resolveSingleMethod.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "TypeOne",
					BaseType: "struct",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"int", "int"},
							ReturnValues: []string{"error"},
							ReceiverName: "TypeOne",
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					ID: -1,
				},
			},
		}, {
			Name:     "Single method on a pointer receiver",
			FilePath: "../../testFiles/resolveSinglePointerMethod.go",
			Expected: []model.ConcreteTypeRecord{
				{
					Package:  "test",
					Name:     "TypeOne",
					BaseType: "struct",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"io.Writer", "*int"},
							ReturnValues: []string{},
							ReceiverName: "*TypeOne",
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					ID: -1,
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			p := typeparser.NewParser()
			err := p.ParseFile(tt.FilePath)
			if err != nil {
				t.Errorf("%s", err.Error())
			}
			p.ResolveMethods()
			if !reflect.DeepEqual(p.ConcreteTypes, tt.Expected) {
				t.Errorf("Expected: %+v got: %+v\n", tt.Expected, p.ConcreteTypes)
			}
			if len(p.Methods) != 0 {
				t.Errorf("Expected all methods to be resolved: %d methods remaining\n", len(p.Methods))
			}
		})
	}
}
