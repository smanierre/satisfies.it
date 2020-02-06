package typeparser

import (
	"fmt"
	"go/ast"
	"strings"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/util"
)

type concreteTypeVisitor struct {
	types       []model.ConcreteTypeRecord
	prevToken   ast.Node
	packageName string
}

func (cv *concreteTypeVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		file := node.(*ast.File)
		cv.packageName = file.Name.Name
	case *ast.TypeSpec:
		typeSpec := node.(*ast.TypeSpec)
		structRecord := model.ConcreteTypeRecord{}
		structRecord.Package = cv.packageName
		structRecord.Name = typeSpec.Name.String()
		structRecord.Methods = []model.MethodRecord{}
		structRecord.ID = -1
		switch typeSpec.Type.(type) {
		case *ast.StructType:
			if !util.StartsWithUppercase(typeSpec.Name.String()) {
				return cv
			}
			structRecord.BaseType = "struct"
		case *ast.Ident:
			structRecord.BaseType = fmt.Sprint(typeSpec.Type)
		case *ast.SelectorExpr:
			selectorExpr := typeSpec.Type.(*ast.SelectorExpr)
			structRecord.BaseType = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
		case *ast.InterfaceType: //Ignore interfaces
		case *ast.ArrayType:
			arrayType := typeSpec.Type.(*ast.ArrayType)
			switch arrayType.Elt.(type) {
			case *ast.Ident:
				structRecord.BaseType = fmt.Sprint(arrayType.Elt)
			case *ast.SelectorExpr:
				selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
				structRecord.BaseType = fmt.Sprintf("[]%s.%s", selectorExpr.X, selectorExpr.Sel)
			case *ast.ArrayType:
				arrayType := arrayType.Elt.(*ast.ArrayType)
				switch arrayType.Elt.(type) {
				case *ast.Ident:
					structRecord.BaseType = fmt.Sprintf("[][]%s", arrayType.Elt)
				default:
					fmt.Printf("Uncaught type in Typespect 2d array declaration: %T\n", arrayType.Elt)
				}
			case *ast.StarExpr:
				starExpr := arrayType.Elt.(*ast.StarExpr)
				switch starExpr.X.(type) {
				case *ast.Ident:
					structRecord.BaseType = fmt.Sprintf("*%s", starExpr.X)
				default:
					fmt.Printf("Uncaught type in Typespce array pointer declaration: %T\n", starExpr.X)
				}
			default:
				fmt.Printf("Uncaught type in TypeSpec array declaration: %T\n", arrayType.Elt)
			}
		case *ast.FuncType: //Paramater is a function
			funcType := typeSpec.Type.(*ast.FuncType)
			params := parseFieldList(funcType.Params.List)
			var returnValues []string
			if funcType.Results != nil {
				returnValues = parseFieldList(funcType.Results.List)
			}
			paramsString := strings.Join(params, ", ")
			returnValuesString := strings.Join(returnValues, ", ")
			if strings.Contains(returnValuesString, ",") {
				structRecord.BaseType = fmt.Sprintf("func(%s) (%s)", paramsString, returnValuesString)
			} else {
				structRecord.BaseType = fmt.Sprintf("func(%s) %s", paramsString, returnValuesString)
			}
		case *ast.StarExpr:
			starExpr := typeSpec.Type.(*ast.StarExpr)
			switch starExpr.X.(type) {
			case *ast.Ident:
				structRecord.BaseType = fmt.Sprintf("*%s", starExpr.X)
			case *ast.StructType:
				//Assuming empty struct or ignorning
				structType := starExpr.X.(*ast.StructType)
				if len(structType.Fields.List) == 0 {
					structRecord.BaseType = "*struct{}"
				}
			default:
				fmt.Printf("Uncaught type in TypeSpec pointer declaration: %T\n", starExpr.X)
			}
		case *ast.MapType:
			mapType := typeSpec.Type.(*ast.MapType)
			var key, value string
			//Determine the string value of the key type
			switch mapType.Key.(type) {
			case *ast.Ident: //Key type is a regular type e.g. int
				key = fmt.Sprint(mapType.Key)
			case *ast.SelectorExpr: //Keytype is a custom type e.g. io.Writer
				selectorExpr := mapType.Key.(*ast.SelectorExpr)
				key = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
			case *ast.StarExpr:
				starExpr := mapType.Key.(*ast.StarExpr)
				switch starExpr.X.(type) {
				default:
					fmt.Printf("Uncaught type in parsing Typespec type map key pointer: %T\n", starExpr.X)
				}
			default: //Catch and log any unhandled cases to add in later
				fmt.Printf("Uncaught type in parsing TypeSpec type map key: %T\n", mapType.Key)
			}
			//Determine the string value of the value type
			switch mapType.Value.(type) {
			case *ast.Ident: //Value type is a regular type e.g. int
				value = fmt.Sprint(mapType.Value)
			case *ast.SelectorExpr: //Value type is a custom type e.g. io.Writer
				selectorExpr := mapType.Value.(*ast.SelectorExpr)
				value = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
			case *ast.StarExpr: //Value type is a pointer e.g. *int
				starExpr := mapType.Value.(*ast.StarExpr)
				switch starExpr.X.(type) {
				case *ast.SelectorExpr: //Map value type is a pointer to a custom type e.g. *io.Writer
					selectorExpr := starExpr.X.(*ast.SelectorExpr)
					value = fmt.Sprintf("*%s.%s", selectorExpr.X, selectorExpr.Sel)
				case *ast.Ident: //Map value type is a pointer to a builtin type e.g. *int
					value = fmt.Sprintf("*%s", starExpr.X)
				default: //Catch and log any uncaught cases to add in
					fmt.Printf("Uncaught type in parsing TypeSpec type map pointer value: %T\n", starExpr.X)
				}
			case *ast.InterfaceType:
				//Assuming interface is empty or else ignorning
				interfaceType := mapType.Value.(*ast.InterfaceType)
				if len(interfaceType.Methods.List) == 0 {
					value = "interface{}"
				}
			case *ast.ArrayType:
				arrayType := mapType.Value.(*ast.ArrayType)
				switch arrayType.Elt.(type) {
				case *ast.Ident:
					value = fmt.Sprintf("[]%s", arrayType.Elt)
				default:
					fmt.Printf("Uncaught type in parsing TypeSpec type map slice value: %T\n", arrayType.Elt)
				}
			default: //Catch and llog any unhandled cases to add in later
				fmt.Printf("Uncaught type in parsing TypeSpec type map value: %T\n", mapType.Value)
			}
			structRecord.BaseType = fmt.Sprintf("map[%s]%s", key, value)
		case *ast.ChanType:
			chanType := typeSpec.Type.(*ast.ChanType)
			switch chanType.Value.(type) {
			case *ast.StructType:
				structType := chanType.Value.(*ast.StructType)
				if len(structType.Fields.List) == 0 {
					structRecord.BaseType = "chan struct{}"
				}
			case *ast.StarExpr:
				starExpr := chanType.Value.(*ast.StarExpr)
				switch starExpr.X.(type) {
				case *ast.SelectorExpr:
					selectorExpr := starExpr.X.(*ast.SelectorExpr)
					structRecord.BaseType = fmt.Sprintf("chan *%s.%s", selectorExpr.X, selectorExpr.Sel)
				default:
					fmt.Printf("Uncaught type in Typespec chan pointer type declaration: %T\n", starExpr.X)
				}
			case *ast.Ident:
				structRecord.BaseType = fmt.Sprintf("chan %s", chanType.Value)
			case *ast.ParenExpr:
				parenExpr := chanType.Value.(*ast.ParenExpr)
				switch parenExpr.X.(type) {
				default:
					fmt.Printf("Uncaught type in TypeSpec chan paren declaration: %T\n", parenExpr.X)
				}
			default:
				fmt.Printf("Uncaught type in TypeSpec chan type declaration: %T\n", chanType.Value)
			}
		default: //Uncaught type in TypeSpec declaration
			fmt.Printf("Uncaught type in TypeSpec declaration: %T\n", typeSpec.Type)
		}
		cv.types = append(cv.types, structRecord)
	}
	if node != nil {
		cv.prevToken = node
	}
	return cv
}
