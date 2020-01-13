package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/store/types"
)

// ExtractInterfaces takes a filename and parses the file extract all the interfaces out.
func ExtractInterfaces(filename string) ([]types.InterfaceRecord, error) {
	fs := token.NewFileSet()
	f, err := parser.ParseFile(fs, filename, nil, parser.AllErrors)
	if err != nil {
		return nil, fmt.Errorf("unable to parse file: %s", err.Error())
	}
	visitor := interfaceVisitor{}
	ast.Walk(visitor, f)
	return nil, nil
}

type interfaceVisitor struct {
	interfaces []types.InterfaceRecord
}

//TODO: This. Have to figure out how to get the package name stored for all the interfaces and methods to use
func (iv interfaceVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.InterfaceType:
		// record := types.InterfaceRecord{}
		iface := node.(*ast.InterfaceType)
		for _, method := range iface.Methods.List {
			methodRecord := types.MethodRecord{}
			methodRecord.Name = method.Names[0].String()
			// methodRecord.Parameters
			fmt.Printf("%T\n", method.Type)
		}
	}
	return iv
}

func Parse() {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, "", "package main\ntype Test interface{\nAdd(a, b int, c ...int) int\n}\n", 0)
	if err != nil {
		panic(err)
	}
	ast.Walk(visitor{}, f)
}

type visitor struct{}

func (v visitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.TypeSpec:
		ts := node.(*ast.TypeSpec)
		it, ok := ts.Type.(*ast.InterfaceType)
		if ok {
			for _, v := range it.Methods.List {
				ft := v.Type.(*ast.FuncType)
				for _, l := range ft.Params.List {
					el, ok := l.Type.(*ast.Ellipsis)
					if ok {
						fmt.Printf("%+v\n", el)
					}
				}
			}
		}
	}
	return visitor{}
}
