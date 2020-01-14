package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/model"
)

// ExtractInterfaces takes a filename and parses the file extract all the interfaces out.
func ExtractInterfaces(filename string) ([]model.InterfaceRecord, error) {
	fs := token.NewFileSet()
	f, err := parser.ParseFile(fs, filename, nil, parser.AllErrors)
	if err != nil {
		return nil, fmt.Errorf("unable to parse file: %s", err.Error())
	}
	visitor := &interfaceVisitor{}
	ast.Walk(visitor, f)
	return visitor.interfaces, nil
}

type interfaceVisitor struct {
	interfaces  []model.InterfaceRecord
	packageName string
}

//TODO: How to get the name of the interface being parsed?
func (iv *interfaceVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		f := node.(*ast.File)
		iv.packageName = f.Name.String()
	case *ast.InterfaceType:
		record := model.InterfaceRecord{}
		record.Package = iv.packageName
		iface := node.(*ast.InterfaceType)
		for _, method := range iface.Methods.List {
			methodRecord := model.MethodRecord{}
			methodRecord.Package = iv.packageName
			methodRecord.Name = method.Names[0].String()
			funcDec := method.Type.(*ast.FuncType)

			// Check to see how many parameters there are, and then parse if there are any
			if funcDec.Params.NumFields() == 0 {
				methodRecord.Parameters = []string{}
			} else {
				for _, p := range funcDec.Params.List {
					param := p.Type.(*ast.Ident)
					methodRecord.Parameters = append(methodRecord.Parameters, param.String())
				}
			}
			// Check to see how many return values there are, then parse any that exist
			if funcDec.Results.NumFields() == 0 {
				methodRecord.ReturnValues = []string{}
			} else {
				for _, r := range funcDec.Results.List {
					switch r.Type.(type) {
					case *ast.ArrayType:
						at := r.Type.(*ast.ArrayType)
						// Check to see what type the array is and parse accordingly
						switch at.Elt.(type) {
						case *ast.SelectorExpr:
							se := at.Elt.(*ast.SelectorExpr)
							methodRecord.ReturnValues = append(methodRecord.ReturnValues, fmt.Sprintf("[]%s", se.Sel.Name))
						case *ast.Ident:
							id := at.Elt.(*ast.Ident)
							methodRecord.ReturnValues = append(methodRecord.ReturnValues, fmt.Sprintf("[]%s", id.String()))
						}
					case *ast.SelectorExpr:
						se := r.Type.(*ast.SelectorExpr)
						methodRecord.ReturnValues = append(methodRecord.ReturnValues, se.Sel.Name)
					case *ast.Ident:
						id := r.Type.(*ast.Ident)
						methodRecord.ReturnValues = append(methodRecord.ReturnValues, id.Name)
					}
				}
			}
			record.Methods = append(record.Methods, methodRecord)
		}
		iv.interfaces = append(iv.interfaces, record)
	}
	return iv
}
