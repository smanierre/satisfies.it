package parser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"os"
	"path/filepath"

	"gitlab.com/sean.manierre/typer-site/util"
)

//A Parser is a struct that contains all the extracted interfaces and custom types from a set of files.
type Parser struct {
	Types   []CustomType
	Methods []Method
	fs      *token.FileSet
}

//NewParser returns a new Parser.
func NewParser() *Parser {
	return &Parser{
		Types:   []CustomType{},
		Methods: []Method{},
		fs:      token.NewFileSet(),
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
	p.Types = append(p.Types, tv.Types...)
	p.Methods = append(p.Methods, tv.Methods...)
	return nil
}

//ParseDir takes a root directory and parses all the .go files within it. Ignores files that end in _test.go.
func (p *Parser) ParseDir(dirpath string) error {
	err := filepath.Walk(dirpath, func(path string, info os.FileInfo, err error) error {
		if util.IsTestFile(info.Name()) || info.IsDir() || !util.IsGoFile(info.Name()) {
			return nil
		}
		err = p.ParseFile(path)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return err
	}
	p.resolveMethods()
	return nil
}
