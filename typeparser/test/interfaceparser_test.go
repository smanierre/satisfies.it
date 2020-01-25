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
					Package:       "test",
					Name:          "Unexported",
					Methods:       []model.MethodRecord{},
					Implementable: false,
					ID:            -1,
				},
			},
		}, {
			Name:     "With single method",
			Filepath: "../../testFiles/singleMethod.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "SingleMethod",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"int", "string"},
							ReturnValues: []string{"string", "error"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom type parameter",
			Filepath: "../../testFiles/customTypeParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomTypeParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With built in pointer type parameter",
			Filepath: "../../testFiles/builtinPointerParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "BuiltinPointerParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*int", "string"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom pointer type parameter",
			Filepath: "../../testFiles/customPointerParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomPointerParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*io.Writer", "int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With slice parameter",
			Filepath: "../../testFiles/sliceParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "SliceParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[]int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With builtin pointer slice parameter",
			Filepath: "../../testFiles/builtinPointerSliceParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "BuiltinPointerSliceParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[]*int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom type pointer slice parameter",
			Filepath: "../../testFiles/customPointerSliceParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomPointerSliceParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[]*io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom type slice parameter",
			Filepath: "../../testFiles/customSliceParameter.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomSliceParameter",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[]io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of builtin pointers",
			Filepath: "../../testFiles/pointerSliceBuiltinPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "PointerSliceBuiltinPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*[]*int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of custom pointers",
			Filepath: "../../testFiles/pointerSliceCustomPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "PointerSliceCustomPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*[]*io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of builtin types",
			Filepath: "../../testFiles/pointerSliceBuiltin.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "PointerSliceBuiltin",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*[]int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of custom types",
			Filepath: "../../testFiles/pointerSliceCustomType.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "PointerSliceCustomType",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"*[]io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With empty interface parameter",
			Filepath: "../../testFiles/emptyInterface.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "EmptyInterface",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"interface{}"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of builtin types",
			Filepath: "../../testFiles/2dBuiltinSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "TwoDBuiltinSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[][]int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of custom types",
			Filepath: "../../testFiles/2dCustomTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "TwoDCustomTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[][]io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of pointers to custom types",
			Filepath: "../../testFiles/2dPointerCustomTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "TwoDPointerCustomTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[][]*io.Writer"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of builtin types",
			Filepath: "../../testFiles/2dPointerBuiltinTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "TwoDPointerBuiltinTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[][]*int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
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
