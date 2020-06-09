package parser

import (
	"reflect"
	"testing"
)

func TestParse(t *testing.T) {
	tc := []struct {
		Name            string
		Filepath        string
		ExpectedTypes   []CustomType
		ExpectedMethods []Method
	}{
		{
			Name:     "Testfile",
			Filepath: "../testFiles/parseTest.go",
			ExpectedTypes: []CustomType{
				{
					Name:     "Interface",
					Basetype: "interface",
					Type:     Interface,
					Package:  "testFiles",
					Methods: []Method{
						{
							Name:            "MethodOne",
							Receiver:        "",
							PointerReceiver: false,
							Parameters:      []string{"string", "*io.Writer"},
							ReturnValues:    []string{},
						},
						{
							Name:            "MethodTwo",
							Receiver:        "",
							PointerReceiver: false,
							Parameters:      []string{},
							ReturnValues:    []string{"int"},
						},
						{
							Name:            "MethodThree",
							Receiver:        "",
							PointerReceiver: false,
							Parameters:      []string{"string", "string"},
							ReturnValues:    []string{"*interface{}", "error"},
						},
					},
				},
				{
					Name:     "ConcreteType",
					Basetype: "struct",
					Type:     ConcreteType,
					Package:  "testFiles",
					Methods:  []Method{},
				},
				{
					Name:     "ConcreteCustom",
					Basetype: "int",
					Type:     ConcreteType,
					Package:  "testFiles",
					Methods:  []Method{},
				},
			},
			ExpectedMethods: []Method{
				{
					Name:            "MethodOne",
					Receiver:        "testFiles.ConcreteType",
					PointerReceiver: false,
					Parameters:      []string{"string", "*io.Writer"},
					ReturnValues:    []string{},
				},
				{
					Name:            "MethodTwo",
					Receiver:        "testFiles.ConcreteType",
					PointerReceiver: false,
					Parameters:      []string{},
					ReturnValues:    []string{"int"},
				},
				{
					Name:            "MethodThree",
					Receiver:        "testFiles.ConcreteType",
					PointerReceiver: false,
					Parameters:      []string{"string", "string"},
					ReturnValues:    []string{"*interface{}", "error"},
				},
				{
					Name:            "MethodOne",
					Receiver:        "*testFiles.ConcreteCustom",
					PointerReceiver: true,
					Parameters:      []string{"string", "*io.Writer"},
					ReturnValues:    []string{},
				},
				{
					Name:            "MethodTwo",
					Receiver:        "*testFiles.ConcreteCustom",
					PointerReceiver: true,
					Parameters:      []string{},
					ReturnValues:    []string{"int"},
				},
				{
					Name:            "MethodThree",
					Receiver:        "*testFiles.ConcreteCustom",
					PointerReceiver: true,
					Parameters:      []string{"string", "string"},
					ReturnValues:    []string{"*interface{}", "error"},
				},
			},
		},
		{
			Name:     "Functions as method receivers",
			Filepath: "../testFiles/funcReceivers.go",
			ExpectedTypes: []CustomType{
				{
					Name:     "ParamlessReceiver",
					Package:  "testFiles",
					Basetype: "func()",
					Type:     ConcreteType,
					Methods:  []Method{},
				},
				{
					Name:     "ParamReceiver",
					Package:  "testFiles",
					Basetype: "func(int, string)",
					Type:     ConcreteType,
					Methods:  []Method{},
				},
				{
					Name:     "ReturnReceiver",
					Package:  "testFiles",
					Basetype: "func() (int, error)",
					Type:     ConcreteType,
					Methods:  []Method{},
				},
				{
					Name:     "BothReceiver",
					Package:  "testFiles",
					Basetype: "func(int, string) (io.Writer, error)",
					Type:     ConcreteType,
					Methods:  []Method{},
				},
			},
			ExpectedMethods: []Method{
				{
					Name:            "MethodOne",
					Receiver:        "testFiles.ParamlessReceiver",
					PointerReceiver: false,
					Parameters:      []string{},
					ReturnValues:    []string{},
				},
				{
					Name:            "MethodTwo",
					Receiver:        "testFiles.ParamReceiver",
					PointerReceiver: false,
					Parameters:      []string{},
					ReturnValues:    []string{},
				},
				{
					Name:            "MethodThree",
					Receiver:        "testFiles.ReturnReceiver",
					PointerReceiver: false,
					Parameters:      []string{},
					ReturnValues:    []string{},
				},
				{
					Name:            "MethodFour",
					Receiver:        "testFiles.BothReceiver",
					PointerReceiver: false,
					Parameters:      []string{},
					ReturnValues:    []string{},
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			p := NewParser()
			p.ParseFile(tt.Filepath)
			if !reflect.DeepEqual(p.Types, tt.ExpectedTypes) {
				t.Errorf("Expected types: %+v\nGot types: %+v\n", tt.ExpectedTypes, p.Types)
			}
			if !reflect.DeepEqual(p.Methods, tt.ExpectedMethods) {
				t.Errorf("Expected methods: %+v\nGot methods: %+v\n", tt.ExpectedMethods, p.Methods)
			}
		})
	}
}
