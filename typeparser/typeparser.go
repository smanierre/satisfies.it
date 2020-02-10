package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/model"
)

//A Parser is a struct that contains all the extracted interfaces and custom types from a file or files.
type Parser struct {
	Interfaces    []model.InterfaceRecord
	ConcreteTypes []model.ConcreteTypeRecord
	Methods       []model.MethodRecord
	fs            *token.FileSet
}

//NewParser takes a list of visitors to use when parsing a file and returns a new Parser.
func NewParser() Parser {
	return Parser{
		Interfaces:    []model.InterfaceRecord{},
		ConcreteTypes: []model.ConcreteTypeRecord{},
		Methods:       []model.MethodRecord{},
		fs:            token.NewFileSet(),
	}
}

//ParseFile takes a file and extracts all the interfaces and custom types.
func (p *Parser) ParseFile(filepath string) error {
	file, err := parser.ParseFile(p.fs, filepath, nil, parser.AllErrors)
	if err != nil {
		return fmt.Errorf("unable to parse file: %s", err.Error())
	}
	tv := &typeVisitor{}
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
}
