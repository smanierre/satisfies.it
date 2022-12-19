package store

import (
	"gitlab.com/sean.manierre/typer-site/parser"
)

// TypeStore is an interface that describes all the methods needed by the application
type TypeStore interface {
	GetInterfaces() ([]Interface, error)
	GetInterfaceByID(int64) (Interface, error)
	GetInterfacesByName(string) ([]Interface, error)
	GetConcreteTypes() ([]ConcreteType, error)
	GetConcreteTypeByID(int64) (ConcreteType, error)
	GetConcreteTypesByName(string) ([]ConcreteType, error)
	GetImplementingIDs(int64) ([]int64, error)
	GetImplementeeIDs(int64) ([]int64, error)
	InsertParsedProject(*parser.Parser) error
}

//Interface represents an interface and all of its methods.
type Interface struct {
	ID      int64
	Package string
	Name    string
	Methods []Method
}

//ConcreteType represents a concrete type and all of its methods.
type ConcreteType struct {
	ID       int64
	Package  string
	Name     string
	Pointer  bool
	BaseType string
	Methods  []Method
}

//Method represents a method belonging to either an interface or a concrete type
type Method struct {
	ID           int64
	Name         string
	Parameters   []string
	ReturnValues []string
}
