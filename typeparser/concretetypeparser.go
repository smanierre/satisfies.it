package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"strings"

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
				case *ast.Ident: //Field is a regular type or local custom type e.g. int
					ident := field.Type.(*ast.Ident)
					parseIdent(field.Names, ident, structRecord.Fields, cv.packageName, "")
				case *ast.SelectorExpr: //Field is a custom type e.g. io.Writer
					selectorExpr := field.Type.(*ast.SelectorExpr)
					parseSelectorExpr(field.Names, selectorExpr, structRecord.Fields, cv.packageName, "")
				case *ast.ArrayType: //Field is an array type e.g. []int
					arrayType := field.Type.(*ast.ArrayType)
					switch arrayType.Elt.(type) {
					case *ast.Ident: //Array is a regular type e.g. []int
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("[]%s", arrayType.Elt)
					case *ast.SelectorExpr: //Arrray is a custom type e.g. []io.Writer
						selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("[]%s.%s", selectorExpr.X, selectorExpr.Sel)
					case *ast.StarExpr:
						starExpr := arrayType.Elt.(*ast.StarExpr)
						switch starExpr.X.(type) {
						case *ast.Ident: // Array is a pointer of builtin types or local custom types
							structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("[]*%s", starExpr.X)
						case *ast.ArrayType:
							arrayType := starExpr.X.(*ast.ArrayType)
							switch arrayType.Elt.(type) {
							default: //Catch and log any unhandled cases which can then be added in
								fmt.Printf("Uncaught type in parsing slice pointer slice ([]*[]) field: %T\n", starExpr.X)
							}
						default: //Catch and log any unhandled cases which can then be added in
							fmt.Printf("Uncaught type in parsing slice pointer field: %T\n", starExpr.X)
						}
					case *ast.ArrayType:
						arrayType := arrayType.Elt.(*ast.ArrayType)
						switch arrayType.Elt.(type) {
						default: //Catch and log any unhandled cases which can then be added in
							fmt.Printf("Uncaught type in parsing 2d slice: %T\n", arrayType.Elt)
						}
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
						value = fmt.Sprint(mapType.Value)
					case *ast.SelectorExpr: //Valye type is a custom type e.g. io.Writer
						selectorExpr := mapType.Value.(*ast.SelectorExpr)
						value = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
					default: //Catch and llog any unhandled cases to add in later
						fmt.Printf("Uncaught type in parsing struct field map value: %T\n", mapType.Value)
					}
					structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("map[%s]%s", key, value)
				case *ast.StarExpr: //Field is a pointer e.g. *int
					starExpr := field.Type.(*ast.StarExpr)
					switch starExpr.X.(type) {
					case *ast.Ident: //Pointer is a builtin type or local custom type
						ident := starExpr.X.(*ast.Ident)
						parseIdent(field.Names, ident, structRecord.Fields, cv.packageName, "*")
					case *ast.SelectorExpr: //Pointer is a custom type
						selectorExpr := starExpr.X.(*ast.SelectorExpr)
						parseSelectorExpr(field.Names, selectorExpr, structRecord.Fields, cv.packageName, "*")
					default: //Catch and log any unhandled cases to add in later
						fmt.Printf("Uncaught type when parsing pointer struct field: %T\n", starExpr.X)
					}
				case *ast.FuncType: //Field is function type
					funcType := field.Type.(*ast.FuncType)
					params := parseFieldList(funcType.Params.List)
					var returnValues []string
					if funcType.Results != nil {
						returnValues = parseFieldList(funcType.Results.List)
					}
					paramsString := strings.Join(params, ", ")
					returnValuesString := strings.Join(returnValues, ", ")
					if strings.Contains(returnValuesString, ",") {
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("func(%s) (%s)", paramsString, returnValuesString)
					} else {
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("func(%s) %s", paramsString, returnValuesString)
					}
				case *ast.ChanType: //Field is a channel
					chanType := field.Type.(*ast.ChanType)
					switch chanType.Value.(type) {
					case *ast.StructType: //Channel sends or receives a struct
						structType := chanType.Value.(*ast.StructType)
						if len(structType.Fields.List) == 0 {
							structRecord.Fields[field.Names[0].Name] = fmt.Sprint("chan struct{}")
						}
					case *ast.Ident: //Channel of builtin types
						structRecord.Fields[field.Names[0].Name] = fmt.Sprintf("%s", chanType.Value)
					default: //Catch and log any uncaught cases to add in
						fmt.Printf("Uncaught type in parsing chan type: %T\n", chanType.Value)
					}
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

func parseIdent(fieldNames []*ast.Ident, fieldType *ast.Ident, typeMap map[string]string, packageName string, typeModifier string) {
	if len(fieldNames) == 0 { //Embedded local custom type
		typeMap[fmt.Sprintf("%s%s.%s", typeModifier, packageName, fieldType)] = "embedded"
	} else {
		typeMap[fieldNames[0].Name] = fmt.Sprintf("%s%s", typeModifier, fieldType)
	}
}

func parseSelectorExpr(fieldNames []*ast.Ident, fieldType *ast.SelectorExpr, typeMap map[string]string, packageName string, typeModifier string) {
	if len(fieldNames) == 0 { //Embedded type
		typeMap[fmt.Sprintf("%s%s.%s", typeModifier, fieldType.X, fieldType.Sel)] = "embedded"
	} else {
		typeMap[fieldNames[0].Name] = fmt.Sprintf("%s%s.%s", typeModifier, fieldType.X, fieldType.Sel)
	}
}
