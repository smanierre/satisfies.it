package typer

import (
	"os"
	"reflect"
	"testing"
)

func TestParse(t *testing.T) {
	tc := []struct {
		Name                  string
		FilePath              string
		ExpectedInterfaces    []Interface
		ExpectedConcreteTypes []ConcreteType
	}{
		{Name: "parsing a file with no types", FilePath: "testFiles/noTypes.go", ExpectedInterfaces: []Interface{}, ExpectedConcreteTypes: []ConcreteType{}},
		{
			Name:     "parsing a file with one interface",
			FilePath: "testFiles/withSingleInterface.go",
			ExpectedInterfaces: []Interface{
				{
					Package:  "main",
					Name:     "Test",
					BaseType: "interface",
					Methods: []Method{
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SigOne",
							Parameters:   []string{"io.Reader"},
							ReturnValues: []string{},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SigTwo",
							Parameters:   []string{},
							ReturnValues: []string{"int"},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SigThree",
							Parameters:   []string{"string"},
							ReturnValues: []string{"bool"},
						},
					},
				},
			},
			ExpectedConcreteTypes: []ConcreteType{},
		},
		{
			Name:               "parsing a file with one struct",
			FilePath:           "testFiles/withSingleStruct.go",
			ExpectedInterfaces: []Interface{},
			ExpectedConcreteTypes: []ConcreteType{
				{
					Package:  "main",
					Name:     "Test",
					BaseType: "struct",
					Fields: map[string]string{
						"FieldOne":  "string",
						"FieldTwo":  "int",
						"io.Reader": "embedded",
					},
					Methods: []Method{},
				},
			},
		},
		{
			Name:                  "parsing a file with one custom type",
			FilePath:              "testFiles/withSingleCustomType.go",
			ExpectedInterfaces:    []Interface{},
			ExpectedConcreteTypes: []ConcreteType{{Package: "main", Name: "CustomType", BaseType: "bool", Fields: map[string]string{}, Methods: []Method{}}},
		},
		{
			Name:     "parsing a file with multiple of each",
			FilePath: "testFiles/withMultipleOfEach.go",
			ExpectedInterfaces: []Interface{
				{
					Package:  "main",
					Name:     "FirstInterface",
					BaseType: "interface",
					Methods: []Method{
						{
							Package:      "main",
							Receiver:     "",
							Name:         "First",
							Parameters:   []string{},
							ReturnValues: []string{},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "second",
							Parameters:   []string{"int"},
							ReturnValues: []string{},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "Third",
							Parameters:   []string{"bool"},
							ReturnValues: []string{"io.ReadWriter"},
						},
					},
				},
				{
					Package:  "main",
					Name:     "SecondInterface",
					BaseType: "interface",
					Methods: []Method{
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SecondFirst",
							Parameters:   []string{"float64"},
							ReturnValues: []string{},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SecondSecond",
							Parameters:   []string{"bool"},
							ReturnValues: []string{"bool"},
						},
						{
							Package:      "main",
							Receiver:     "",
							Name:         "SecondThird",
							Parameters:   []string{"string", "string", "string", "float32"},
							ReturnValues: []string{"*io.Reader"},
						},
					},
				},
			},
			ExpectedConcreteTypes: []ConcreteType{
				{
					Package:  "main",
					Name:     "FirstStruct",
					BaseType: "struct",
					Fields: map[string]string{
						"FirstField":  "string",
						"SecondField": "float64",
						"ThirdField":  "*int",
					},
					Methods: []Method{},
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
					Methods: []Method{},
				},
				{
					Package:  "main",
					Name:     "FirstCustomType",
					BaseType: "float64",
					Fields:   map[string]string{},
					Methods:  []Method{},
				},
				{
					Package:  "main",
					Name:     "SecondCustomType",
					BaseType: "string",
					Fields:   map[string]string{},
					Methods:  []Method{},
				},
			},
		},
		{
			Name:               "parsing a file with methods on structs and custom types",
			FilePath:           "testFiles/withMultipleMethods.go",
			ExpectedInterfaces: []Interface{},
			ExpectedConcreteTypes: []ConcreteType{
				{
					Package:  "test",
					Name:     "S",
					BaseType: "struct",
					Fields: map[string]string{
						"FieldOne":   "string",
						"io.Reader":  "embedded",
						"FieldThree": "int",
					},
					Methods: []Method{
						{
							Package:      "test",
							Receiver:     "*S",
							Name:         "MethodOne",
							Parameters:   []string{"string", "string", "string"},
							ReturnValues: []string{"*int"},
						},
						{
							Package:      "test",
							Receiver:     "*S",
							Name:         "MethodTwo",
							Parameters:   []string{},
							ReturnValues: []string{},
						},
					},
				},
				{
					Package:  "test",
					Name:     "Custom",
					BaseType: "bool",
					Fields:   map[string]string{},
					Methods: []Method{
						{
							Package:      "test",
							Receiver:     "Custom",
							Name:         "SomethingElse",
							Parameters:   []string{},
							ReturnValues: []string{"bool", "error", "interface{}"},
						},
					},
				},
			},
		},
		{
			Name:               "parsing a file with nameless parameters and receivers",
			FilePath:           "testFiles/withNamelessParams.go",
			ExpectedInterfaces: []Interface{},
			ExpectedConcreteTypes: []ConcreteType{
				{
					Package:  "test",
					Name:     "Custom",
					BaseType: "struct",
					Fields:   map[string]string{},
					Methods: []Method{
						{
							Package:      "test",
							Receiver:     "Custom",
							Name:         "MethodOne",
							Parameters:   []string{"io.Writer", "int", "*string"},
							ReturnValues: []string{"io.Writer", "error"},
						},
					},
				},
			},
		},
		{
			Name:               "parsing a file with methods that have functions as arguments, or return functions",
			FilePath:           "testFiles/methodsWithFunctionArguments.go",
			ExpectedInterfaces: []Interface{},
			ExpectedConcreteTypes: []ConcreteType{
				{
					Package:  "test",
					Name:     "TestType",
					BaseType: "int",
					Fields:   map[string]string{},
					Methods: []Method{
						{
							Package:      "test",
							Receiver:     "TestType",
							Name:         "MethodOne",
							Parameters:   []string{"func(int, *io.Writer)", "int"},
							ReturnValues: []string{},
						},
						{
							Package:      "test",
							Receiver:     "TestType",
							Name:         "MethodTwo",
							Parameters:   []string{"func() (int, *io.Writer), func(string, string, string) bool"},
							ReturnValues: []string{"func(int, string)"},
						},
					},
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			file, err := os.Open(tt.FilePath)
			defer file.Close()
			if err != nil {
				t.Fatalf("unable to open file: %v", err)
			}

			typer := NewTyper()
			err = typer.Parse(file)
			if err != nil {
				t.Fatalf("unable to parse file: %v", err)
			}
			typer.ResolveMethods()

			gotInterfaces := typer.GetInterfaces()
			gotConcreteTypes := typer.GetConcreteTypes()

			if !reflect.DeepEqual(gotInterfaces, tt.ExpectedInterfaces) {
				t.Errorf("got Interfaces: %+v, wanted Interfaces: %+v", gotInterfaces, tt.ExpectedInterfaces)
			}
			if !reflect.DeepEqual(gotConcreteTypes, tt.ExpectedConcreteTypes) {
				t.Errorf("got ConcreteTypes: %+v, wanted ConcreteTypes: %+v", gotConcreteTypes, tt.ExpectedConcreteTypes)
			}
		})
	}

	t.Run("parsing an invalid file", func(t *testing.T) {
		file, err := os.Open("testFiles/invalid.go")
		defer file.Close()
		if err != nil {
			t.Fatalf("unable to open file: %v", err)
		}

		typer := NewTyper()
		err = typer.Parse(file)
		if err.Error() != "unable to parse file, no package name" {
			t.Errorf("invalid error returned when parsing file without a package name")
		}
	})
}
