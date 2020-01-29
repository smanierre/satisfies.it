package typeparser_test

import (
	"reflect"
	"testing"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func TestExtractedInterfaceParameters(t *testing.T) {
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
		}, {
			Name:     "multiple parameters of varying types",
			Filepath: "../../testFiles/multipleParameters.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "MultipleParameters",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"[][]*int", "int", "io.Writer", "interface{}", "*int"},
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
			Name:     "map of builtin types",
			Filepath: "../../testFiles/builtinMapTypes.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "BuiltinMap",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"map[string]int"},
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
			Name:     "map of custom types",
			Filepath: "../../testFiles/customMap.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomMap",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"map[io.Writer]io.Writer"},
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
			Name:     "builtin variadic parameters",
			Filepath: "../../testFiles/builtinVariadic.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "BuiltinVariadic",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"...int"},
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
			Name:     "custom variadic parameters",
			Filepath: "../../testFiles/customVariadic.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "CustomVariadic",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"...io.Writer"},
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
			Name:     "interface variadic parameters",
			Filepath: "../../testFiles/interfaceVariadic.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "InterfaceVariadic",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"...interface{}"},
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

func TestExtractedInterfaceReturnValues(t *testing.T) {

	tc := []struct {
		Name     string
		Filepath string
		Expected []model.InterfaceRecord
	}{
		{
			Name:     "With custom type return value",
			Filepath: "../../testFiles/returnCustomType.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnCustomType",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "with builtin return value",
			Filepath: "../../testFiles/returnBuiltinType.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnBuiltinType",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With built in pointer type return value",
			Filepath: "../../testFiles/returnBuiltinPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnBuiltinPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom pointer type return value",
			Filepath: "../../testFiles/returnCustomPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnCustomPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With builtin slice return value",
			Filepath: "../../testFiles/returnBuiltinSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnBuiltinSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[]int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With builtin pointer slice return value",
			Filepath: "../../testFiles/returnBuiltinPointerSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnBuiltinPointerSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[]*int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom type pointer slice return value",
			Filepath: "../../testFiles/returnCustomPointerSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnCustomPointerSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[]*io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With custom type slice return value",
			Filepath: "../../testFiles/returnCustomSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnCustomSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[]io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of builtin pointers return value",
			Filepath: "../../testFiles/returnPointerSliceBuiltinPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnPointerSliceBuiltinPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*[]*int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of custom pointers return value",
			Filepath: "../../testFiles/returnPointerSliceCustomPointer.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnPointerSliceCustomPointer",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*[]*io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of builtin types return type",
			Filepath: "../../testFiles/returnPointerSliceBuiltin.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnPointerSliceBuiltin",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*[]int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With pointer to slice of custom types return value",
			Filepath: "../../testFiles/returnPointerSliceCustomType.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnPointerSliceCustomType",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"*[]io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "With empty interface return value",
			Filepath: "../../testFiles/returnEmptyInterface.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnEmptyInterface",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"interface{}"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of builtin types return value",
			Filepath: "../../testFiles/return2dBuiltinSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnTwoDBuiltinSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[][]int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of custom types return value",
			Filepath: "../../testFiles/return2dCustomTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnTwoDCustomTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[][]io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of pointers to custom types return value",
			Filepath: "../../testFiles/return2dPointerCustomTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnTwoDPointerCustomTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[][]*io.Writer"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "2d slice of builtin pointer types",
			Filepath: "../../testFiles/return2dPointerBuiltinTypeSlice.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnTwoDPointerBuiltinTypeSlice",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[][]*int"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				},
			},
		}, {
			Name:     "multiple return values of varying types",
			Filepath: "../../testFiles/returnMultiple.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "ReturnMultiple",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{},
							ReturnValues: []string{"[][]*int", "int", "io.Writer", "interface{}", "*int"},
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

func TestMiscellaneousInterfaceCases(t *testing.T) {
	tc := []struct {
		Name     string
		Filepath string
		Expected []model.InterfaceRecord
	}{
		{
			Name:     "Multiple Empty interfaces",
			Filepath: "../../testFiles/multipleEmptyInterfaces.go",
			Expected: []model.InterfaceRecord{
				{
					Package:       "test",
					Name:          "InterfaceOne",
					Methods:       []model.MethodRecord{},
					Implementable: true,
					ID:            -1,
				}, {
					Package:       "test",
					Name:          "InterfaceTwo",
					Methods:       []model.MethodRecord{},
					Implementable: true,
					ID:            -1,
				},
			},
		},
		{
			Name:     "Multiple non-empty interfaces",
			Filepath: "../../testFiles/multipleNonEmptyInterfaces.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "InterfaceOne",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"int", "io.Writer"},
							ReturnValues: []string{"[][]*int", "string"},
							ReceiverID:   -1,
							ID:           -1,
						}, {
							Package:      "test",
							Name:         "MethodTwo",
							Parameters:   []string{},
							ReturnValues: []string{"string"},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: true,
					ID:            -1,
				}, {
					Package: "test",
					Name:    "InterfaceTwo",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "MethodOne",
							Parameters:   []string{"interface{}", "*int"},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
					},
					Implementable: false,
					ID:            -1,
				},
			},
		}, {
			Name:     "embeded interfaces",
			Filepath: "../../testFiles/embeddedInterfaces.go",
			Expected: []model.InterfaceRecord{
				{
					Package: "test",
					Name:    "WithEmbedded",
					Methods: []model.MethodRecord{
						{
							Package:      "test",
							Name:         "io.Reader",
							Parameters:   []string{},
							ReturnValues: []string{},
							ReceiverID:   -1,
							ID:           -1,
						},
						{
							Package:      "test",
							Name:         "io.Writer",
							Parameters:   []string{},
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
