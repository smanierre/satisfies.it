package parser

import (
	"fmt"
	"reflect"
	"testing"
)

func TestParse(t *testing.T) {
	tc := []struct {
		Name          string
		Filepath      string
		ExpectedTypes []CustomType
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
					Methods: []Method{
						{
							Name:            "MethodOne",
							PointerReceiver: false,
							Receiver:        "testFiles.ConcreteType",
							Parameters:      []string{"string", "*io.Writer"},
							ReturnValues:    []string{},
						},
						{
							Name:            "MethodTwo",
							PointerReceiver: false,
							Receiver:        "testFiles.ConcreteType",
							Parameters:      []string{},
							ReturnValues:    []string{"int"},
						},
						{
							Name:            "MethodThree",
							PointerReceiver: false,
							Receiver:        "testFiles.ConcreteType",
							Parameters:      []string{"string", "string"},
							ReturnValues:    []string{"*interface{}", "error"},
						},
					},
				},
				{
					Name:     "ConcreteCustom",
					Basetype: "int",
					Type:     ConcreteType,
					Package:  "testFiles",
					Methods: []Method{
						{
							Name:            "MethodOne",
							PointerReceiver: true,
							Receiver:        "*testFiles.ConcreteCustom",
							Parameters:      []string{"string", "*io.Writer"},
							ReturnValues:    []string{},
						},
						{
							Name:            "MethodTwo",
							PointerReceiver: true,
							Receiver:        "*testFiles.ConcreteCustom",
							Parameters:      []string{},
							ReturnValues:    []string{"int"},
						},
						{
							Name:            "MethodThree",
							PointerReceiver: true,
							Receiver:        "*testFiles.ConcreteCustom",
							Parameters:      []string{"string", "string"},
							ReturnValues:    []string{"*interface{}", "error"},
						},
					},
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
					Methods: []Method{
						{
							Name:            "MethodOne",
							PointerReceiver: false,
							Receiver:        "testFiles.ParamlessReceiver",
							Parameters:      []string{},
							ReturnValues:    []string{},
						},
					},
				},
				{
					Name:     "ParamReceiver",
					Package:  "testFiles",
					Basetype: "func(int, string)",
					Type:     ConcreteType,
					Methods: []Method{
						{
							Name:            "MethodTwo",
							PointerReceiver: false,
							Receiver:        "testFiles.ParamReceiver",
							Parameters:      []string{},
							ReturnValues:    []string{},
						},
					},
				},
				{
					Name:     "ReturnReceiver",
					Package:  "testFiles",
					Basetype: "func() (int, error)",
					Type:     ConcreteType,
					Methods: []Method{
						{
							Name:            "MethodThree",
							PointerReceiver: false,
							Receiver:        "testFiles.ReturnReceiver",
							Parameters:      []string{},
							ReturnValues:    []string{},
						},
					},
				},
				{
					Name:     "BothReceiver",
					Package:  "testFiles",
					Basetype: "func(int, string) (io.Writer, error)",
					Type:     ConcreteType,
					Methods: []Method{
						{
							Name:            "MethodFour",
							PointerReceiver: false,
							Receiver:        "testFiles.BothReceiver",
							Parameters:      []string{},
							ReturnValues:    []string{},
						},
					},
				},
			},
		},
		{
			Name:     "Multiple return values of same type",
			Filepath: "../testFiles/multipleReturnValues.go",
			ExpectedTypes: []CustomType{
				{
					Name:     "TestType",
					Basetype: "interface",
					Type:     Interface,
					Package:  "testFiles",
					Methods: []Method{
						{
							Name:            "MethodOne",
							PointerReceiver: false,
							Receiver:        "",
							Parameters:      []string{},
							ReturnValues:    []string{"int", "int", "error"},
						},
					},
				},
				{
					Name:     "TestConcrete",
					Basetype: "struct",
					Type:     ConcreteType,
					Package:  "testFiles",
					Methods: []Method{
						{
							Name:            "MethodTwo",
							PointerReceiver: false,
							Receiver:        "testFiles.TestConcrete",
							Parameters:      []string{},
							ReturnValues:    []string{"int", "error", "error"},
						},
					},
				},
			},
		},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			p := NewParser()
			p.ParseFile(tt.Filepath)
			if !reflect.DeepEqual(p.Types, tt.ExpectedTypes) {
				for _, Type := range p.Types {
					fmt.Println(Type.Name)
					for _, Method := range Type.Methods {
						fmt.Printf("%+v\n", Method)
					}
				}
				t.Errorf("Expected types: %+v\nGot types: %+v\n", tt.ExpectedTypes, p.Types)
			}
		})
	}
}
