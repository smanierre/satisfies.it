package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/model"
)

type concreteTypeVisitor struct {
	types       []model.ConcreteTypeRecord
	prevToken   ast.Node
	packageName string
}

//ExtractConcreteTypes takes a filename and parses it to extract all the concrete types and return them
func ExtractConcreteTypes(filename string) ([]model.ConcreteTypeRecord, error) {
	fs := token.NewFileSet()
	f, err := parser.ParseFile(fs, filename, nil, parser.AllErrors)
	if err != nil {
		return nil, fmt.Errorf("unable to parse file: %s", err.Error())
	}
	visitor := &concreteTypeVisitor{}
	ast.Walk(visitor, f)
	return visitor.types, nil
}

func (cv *concreteTypeVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		file := node.(*ast.File)
		cv.packageName = file.Name.Name
	case *ast.StructType:
		structType := node.(*ast.StructType)
		structRecord := model.ConcreteTypeRecord{}
		structRecord.Package = cv.packageName
		structRecord.Name = fmt.Sprint(cv.prevToken)
		structRecord.BaseType = "struct"
		structRecord.Fields = map[string]string{}
		structRecord.Methods = []model.MethodRecord{}
		structRecord.ID = -1
		if len(structType.Fields.List) != 0 {
			for _, field := range structType.Fields.List {
				switch field.Type.(type) {
				case *ast.Ident: //Field is a regular type e.g. int
					structRecord.Fields[field.Names[0].Name] = fmt.Sprint(field.Type)
				case *ast.SelectorExpr: //Field is a custom type e.g. io.Writer
					selectorExpr := field.Type.(*ast.SelectorExpr)
					structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
				case *ast.ArrayType: //Field is an array type e.g. []int
					arrayType := field.Type.(*ast.ArrayType)
					switch arrayType.Elt.(type) {
					case *ast.Ident: //Array is a regular type e.g. []int
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("[]%s", arrayType.Elt)
					case *ast.SelectorExpr: //Arrray is a custom type e.g. []io.Writer
						selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("[]%s.%s", selectorExpr.X, selectorExpr.Sel)
					default: //Catch and log any unhandled cases which can then be added in
						fmt.Printf("Uncaught type in parsing slice struct field: %T\n", arrayType.Elt)
					}
				case *ast.MapType: //Field is a map
					mapType := field.Type.(*ast.MapType)
					var key, value string
					//Determine the string value of the key type
					switch mapType.Key.(type) {
					case *ast.Ident: //Key type is a regular type e.g. int
						key = fmt.Sprint(mapType.Key)
					case *ast.SelectorExpr: //Keytype is a custom type e.g. io.Writer
						selectorExpr := mapType.Key.(*ast.SelectorExpr)
						key = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
					default: //Catch and log any unhandled cases to add in later
						fmt.Printf("Uncaught type in parsing struct field map key: %T\n", mapType.Key)
					}
					//Determine the string value of the value type
					switch mapType.Value.(type) {
					case *ast.Ident: //Value type is a regular type e.g. int
						value = fmt.Sprint(mapType.Key)
					case *ast.SelectorExpr: //Valye type is a custom type e.g. io.Writer
						selectorExpr := mapType.Key.(*ast.SelectorExpr)
						value = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
					default: //Catch and llog any unhandled cases to add in later
						fmt.Printf("Uncaught type in parsing struct field map value: %T\n", mapType.Value)
					}
					structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("map[%s]%s", key, value)
				default: //Catch and log any unhandled cases to add in later
					fmt.Printf("Uncaught type in struct field parsing: %T\n", field.Type)
				}
			}
		}
		cv.types = append(cv.types, structRecord)
	}
	if node != nil {
		cv.prevToken = node
	}
	return cv
}
