package parser

import (
	"encoding/json"
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
	Types                 []CustomType `json:"types"`
	methods               []Method
	InterfaceImplementers map[string][]CustomType `json:"interface_implementers"`
	TypeImplementees      map[string][]CustomType `json:"type_implementees"`
	fs                    *token.FileSet
}

//NewParser returns a new Parser.
func NewParser() *Parser {
	return &Parser{
		Types:                 []CustomType{},
		methods:               []Method{},
		InterfaceImplementers: map[string][]CustomType{},
		TypeImplementees:      map[string][]CustomType{},
		fs:                    token.NewFileSet(),
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
	p.methods = append(p.methods, tv.Methods...)
	p.resolveEmbeddedInterfaces()
	p.resolveMethods()
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

	return nil
}

//ParseAndExportDirectory takes in a directory path and parses all the .go files within it and its children. Once it is done parsing,
// it then outputs it as types_timestamp.json to be imported once the application is deployed and connected to the db.
func ParseAndExportDirectory(dirPath string) error {
	p := NewParser()
	if err := p.ParseDir(dirPath); err != nil {
		return err
	}
	p.ResolveImplementations()
	filename := fmt.Sprintf("types.json")
	outFile, err := os.Create(filename)
	defer outFile.Close()
	if err != nil {
		return err
	}
	encoder := json.NewEncoder(outFile)
	if err := encoder.Encode(p); err != nil {
		return err
	}
	return nil
}
