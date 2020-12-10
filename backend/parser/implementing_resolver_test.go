package parser

import (
	"reflect"
	"testing"
)

func TestImplementingResolver(t *testing.T) {
	tc := []struct {
		Name                 string
		TestFile             string
		ExpectedImplementers map[string][]CustomType
		ExpectedImplementees map[string][]CustomType
	}{
		{
			Name:                 "No implementers",
			TestFile:             "../testFiles/noImplementers.go",
			ExpectedImplementers: map[string][]CustomType{},
			ExpectedImplementees: map[string][]CustomType{},
		},
		{
			Name:     "One Implementer",
			TestFile: "../testFiles/oneImplementer.go",
			ExpectedImplementers: map[string][]CustomType{
				"testFiles.InterfaceOne": {{
					Package:  "testFiles",
					Name:     "ImplementerOne",
					Type:     ConcreteType,
					Basetype: "struct",
					Methods: []Method{
						{
							Name:            "MethodOne",
							PointerReceiver: false,
							Receiver:        "testFiles.ImplementerOne",
							Parameters:      []string{},
							ReturnValues:    []string{"error"},
						},
					},
				},
				},
			},
			ExpectedImplementees: map[string][]CustomType{
				"testFiles.ImplementerOne": {
					{
						Package:  "testFiles",
						Name:     "InterfaceOne",
						Type:     Interface,
						Basetype: "interface",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{},
								ReturnValues:    []string{"error"},
							},
						},
					},
				},
			},
		},
		{
			Name:                 "Empty Interface",
			TestFile:             "../testFiles/emptyInterface.go",
			ExpectedImplementers: map[string][]CustomType{},
			ExpectedImplementees: map[string][]CustomType{},
		},
		{
			Name:     "One Pointer Implementer",
			TestFile: "../testFiles/pointerImplementer.go",
			ExpectedImplementers: map[string][]CustomType{
				"testFiles.InterfaceTwo": {
					{
						Package:  "testFiles",
						Name:     "PointerImplementer",
						Type:     ConcreteType,
						Basetype: "struct",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: true,
								Receiver:        "*testFiles.PointerImplementer",
								Parameters:      []string{"int", "interface{}"},
								ReturnValues:    []string{"int", "error"},
							},
						},
					},
				},
			},
			ExpectedImplementees: map[string][]CustomType{
				"*testFiles.PointerImplementer": {
					{
						Package:  "testFiles",
						Name:     "InterfaceTwo",
						Type:     Interface,
						Basetype: "interface",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{"int", "interface{}"},
								ReturnValues:    []string{"int", "error"},
							},
						},
					},
				},
			},
		},
		{
			Name:     "Multiple implementers",
			TestFile: "../testFiles/multipleImplementers.go",
			ExpectedImplementers: map[string][]CustomType{
				"testFiles.InterfaceThree": {
					{
						Package:  "testFiles",
						Name:     "RegularImplementerOne",
						Type:     ConcreteType,
						Basetype: "struct",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: false,
								Receiver:        "testFiles.RegularImplementerOne",
								Parameters:      []string{},
								ReturnValues:    []string{},
							},
							{
								Name:            "MethodTwo",
								PointerReceiver: false,
								Receiver:        "testFiles.RegularImplementerOne",
								Parameters:      []string{"[]string"},
								ReturnValues:    []string{"struct{}"},
							},
						},
					},
					{
						Package:  "testFiles",
						Name:     "PointerImplementerOne",
						Type:     ConcreteType,
						Basetype: "int",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: true,
								Receiver:        "*testFiles.PointerImplementerOne",
								Parameters:      []string{},
								ReturnValues:    []string{},
							},
							{
								Name:            "MethodTwo",
								PointerReceiver: true,
								Receiver:        "*testFiles.PointerImplementerOne",
								Parameters:      []string{"[]string"},
								ReturnValues:    []string{"struct{}"},
							},
						},
					},
				},
			},
			ExpectedImplementees: map[string][]CustomType{
				"testFiles.RegularImplementerOne": {
					{
						Package:  "testFiles",
						Name:     "InterfaceThree",
						Type:     Interface,
						Basetype: "interface",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{},
								ReturnValues:    []string{},
							},
							{
								Name:            "MethodTwo",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{"[]string"},
								ReturnValues:    []string{"struct{}"},
							},
						},
					},
				},
				"*testFiles.PointerImplementerOne": {
					{
						Package:  "testFiles",
						Name:     "InterfaceThree",
						Type:     Interface,
						Basetype: "interface",
						Methods: []Method{
							{
								Name:            "MethodOne",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{},
								ReturnValues:    []string{},
							},
							{
								Name:            "MethodTwo",
								PointerReceiver: false,
								Receiver:        "",
								Parameters:      []string{"[]string"},
								ReturnValues:    []string{"struct{}"},
							},
						},
					},
				},
			},
		},
	}

	for _, tt := range tc {
		parser := New()
		parser.ParseFile(tt.TestFile)
		parser.ResolveImplementations()
		if !reflect.DeepEqual(parser.InterfaceImplementers, tt.ExpectedImplementers) ||
			!reflect.DeepEqual(parser.TypeImplementees, tt.ExpectedImplementees) {
			t.Errorf("Expected:\n\tImplementers: %v\n\tImplementees:%v\nGot:\n\tImplementers: %v\n\tImplementees: %v\n",
				tt.ExpectedImplementers, tt.ExpectedImplementees, parser.InterfaceImplementers, parser.TypeImplementees)
		}
	}
}
