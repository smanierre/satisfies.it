package parser

import (
	"fmt"
)

//go:generate stringer -type=Type

//Type is an alias for int to represent different types for CustomTypes. 0 means it's an Interface, 1 means it's a Concrete Type.
type Type int

const (
	//Interface is used to describe what a CustomType object is.
	Interface Type = iota
	//ConcreteType is used to descript what a CustomType object is.
	ConcreteType
)

//CustomType represents a type that was parsed from a file. It can be an interface or a concrete type.
type CustomType struct {
	Package  string   `json:"package"`
	Name     string   `json:"name"`
	Type     Type     `json:"type"`
	Basetype string   `json:"base_type"`
	Methods  []Method `json:"methods"`
}

//Method represents a Method of an interface or a concrete type.
type Method struct {
	Name            string   `json:"name"`
	PointerReceiver bool     `json:"pointer_receiver"`
	Receiver        string   `json:"receiver"`
	Parameters      []string `json:"parameters"`
	ReturnValues    []string `json:"return_values"`
}

func (c CustomType) String() string {
	return fmt.Sprintf("Package: %s\nName: %s\nType: %s\nBaseType: %s\nMethods: %d\n", c.Package, c.Name, c.Type, c.Basetype, len(c.Methods))
}

func (m *Method) String() string {
	return fmt.Sprintf("Name: %s\nPointerReceiver: %t\nReceiver: %s\nParameters: %v\nReturnValues: %v\n", m.Name, m.PointerReceiver, m.Receiver, m.Parameters, m.ReturnValues)
}