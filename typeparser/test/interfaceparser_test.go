package typeparser_test

import (
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func TestExtractInterfaces(t *testing.T) {
	tc := []struct {
		Name     string
		Filepath string
		Expected []model.InterfaceRecord
	}{
		{
			Name:     "With unexported functions",
			Filepath: "../../testFiles/unexported.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "Unexported",
					Methods: []model.MethodRecord{},
					ID:      -1,
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			results, err := typeparser.ExtractInterfaces(tt.Filepath)
			if err != nil {
				t.Errorf("%s\n", err.Error())
			}
			if !reflect.DeepEqual(results, tt.Expected) {
				t.Errorf("got: %+v wanted: %+v\n", results, tt.Expected)
			}
		})
	}
}
