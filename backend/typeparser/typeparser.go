package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"strings"

	"github.com/smanierre/typer-site/model"
)

//A Parser is a struct that contains all the extracted interfaces and custom types from a file or files.
type Parser struct {
	Interfaces    []model.InterfaceRecord
	ConcreteTypes []model.ConcreteTypeRecord
	Methods       []model.MethodRecord
	fs            *token.FileSet
}

//NewParser returns a new Parser.
func NewParser() Parser {
	return Parser{
		Interfaces:    []model.InterfaceRecord{},
		ConcreteTypes: []model.ConcreteTypeRecord{},
		Methods:       []model.MethodRecord{},
		fs:            token.NewFileSet(),
	}
}

var Filename string

//ParseFile takes a file and extracts all the interfaces and custom types.
func (p *Parser) ParseFile(filepath string) error {
	file, err := parser.ParseFile(p.fs, filepath, nil, parser.AllErrors)
	if err != nil {
		return fmt.Errorf("unable to parse file: %s", err.Error())
	}
	tv := &typeVisitor{}
	Filename = filepath
	ast.Walk(tv, file)
	p.Interfaces = append(p.Interfaces, tv.interfaces...)
	p.ConcreteTypes = append(p.ConcreteTypes, tv.concreteTypes...)
	p.Methods = append(p.Methods, tv.methods...)
	return nil
}

//ResolveMethods attempts to associate any of the parsed methods with their receiver types.
//Any methods that are attached to a receiver will be removed from the method list.
func (p *Parser) ResolveMethods() {
	unresolvedMethods := []model.MethodRecord{}
	var resolved bool
	for _, m := range p.Methods {
		resolved = false
		for ti, t := range p.ConcreteTypes {
			if m.Package == t.Package {
				//check if it is a pointer receiver and if so, dont include the '*'
				if (m.ReceiverName[0] == '*' && m.ReceiverName[1:] == t.Name) || m.ReceiverName == t.Name {
					p.ConcreteTypes[ti].Methods = append(p.ConcreteTypes[ti].Methods, m)
					resolved = true
					break
				}
			}
		}
		if !resolved {
			unresolvedMethods = append(unresolvedMethods, m)
		}
	}
	p.Methods = unresolvedMethods
	p.resolveEmbeddedInterfaces()
}

func (p *Parser) resolveEmbeddedInterfaces() {
	for i, iface := range p.Interfaces {
		for j, method := range iface.Methods {
			if strings.Contains(method.Name, ".") {
				for _, compareString := range p.Interfaces {
					if fmt.Sprintf("%s.%s", compareString.Package, compareString.Name) == method.Name {
						if len(p.Interfaces[i].Methods) <= 1 {
							p.Interfaces[i].Methods = compareString.Methods
						} else {
							methods := append(p.Interfaces[i].Methods[:j], compareString.Methods...)
							methods = append(methods, p.Interfaces[i].Methods[j+1:]...)
							p.Interfaces[i].Methods = methods
						}
					}
				}
			}
		}
	}
}
