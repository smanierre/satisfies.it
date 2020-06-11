package parser

import (
	"fmt"
	"go/ast"
	"strings"

	"gitlab.com/sean.manierre/typer-site/util"
)

func parseParameter(node ast.Node, packageName string) string {
	pb := &parameterBuilder{
		paramString: "",
		packageName: packageName,
	}
	pb.parseNode(node)
	return pb.paramString
}

type parameterBuilder struct {
	paramString string
	packageName string
}

func (p *parameterBuilder) parseNode(node ast.Node) {
	switch node.(type) {
	case *ast.Field:
		field := node.(*ast.Field)
		p.parseNode(field.Type)
	case *ast.SelectorExpr:
		selectorExpr := node.(*ast.SelectorExpr)
		p.paramString += fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
	case *ast.ArrayType:
		arrayType := node.(*ast.ArrayType)
		p.paramString += "[]"
		p.parseNode(arrayType.Elt)
	case *ast.Ident:
		ident := node.(*ast.Ident)
		if util.StartsWithUppercase(ident.Name) {
			p.paramString += fmt.Sprintf("%s.%s", p.packageName, ident.Name)
		} else {
			p.paramString += fmt.Sprintf("%s", ident.Name)
		}
	case *ast.StarExpr:
		starExpr := node.(*ast.StarExpr)
		p.paramString += "*"
		p.parseNode(starExpr.X)
	case *ast.Ellipsis:
		ellipsis := node.(*ast.Ellipsis)
		p.paramString += "..."
		p.parseNode(ellipsis.Elt)
	case *ast.InterfaceType:
		interfaceType := node.(*ast.InterfaceType)
		//TODO: implement recursive interface parsing, only handles empty interfaces for now
		if len(interfaceType.Methods.List) == 0 {
			p.paramString += "interface{}"
		}
	case *ast.FuncType:
		funcType := node.(*ast.FuncType)
		params := []string{}
		for _, parameter := range funcType.Params.List {
			param := parseParameter(parameter.Type, p.packageName)
			params = append(params, param)
		}
		returnValues := []string{}
		if funcType.Results != nil {
			for _, returnValue := range funcType.Results.List {
				result := parseParameter(returnValue.Type, p.packageName)
				returnValues = append(returnValues, result)
			}
		}
		var paramsString string
		if len(params) > 1 {
			paramsString = strings.Join(params, ", ")
		} else if len(params) == 1 {
			paramsString = params[0]
		} else {
			paramsString = ""
		}
		var returnString string
		if len(returnValues) > 1 {
			returnString = fmt.Sprintf("(%s)", strings.Join(returnValues, ", "))
		} else if len(returnValues) == 1 {
			returnString = returnValues[0]
		} else {
			returnString = ""
		}
		//Trim space to get rid of trailing space if there are no return values
		p.paramString += strings.TrimSpace(fmt.Sprintf("func(%s) %s", paramsString, returnString))
	case *ast.MapType:
		mapType := node.(*ast.MapType)
		keyString := parseParameter(mapType.Key, p.packageName)
		valueString := parseParameter(mapType.Value, p.packageName)
		p.paramString += fmt.Sprintf("map[%s]%s", keyString, valueString)
	case *ast.ChanType:
		chanType := node.(*ast.ChanType)
		chanValue := parseParameter(chanType.Value, p.packageName)
		//Determine if the channel is a send/receive only channel and format accordingly.
		if chanType.Dir == ast.SEND {
			p.paramString += fmt.Sprintf("chan<- %s", chanValue)
		} else if chanType.Dir == ast.RECV {
			p.paramString += fmt.Sprintf("<-chan %s", chanValue)
		} else {
			p.paramString += fmt.Sprintf("chan %s", chanValue)
		}
	case *ast.StructType:
		structType := node.(*ast.StructType)
		//TODO: Implement recursive struct parsing
		if len(structType.Fields.List) == 0 {
			p.paramString += "struct{}"
		}
	case *ast.ParenExpr:
		parenExpr := node.(*ast.ParenExpr)
		p.paramString += "("
		p.parseNode(parenExpr.X)
		p.paramString += ")"
	default:
		fmt.Printf("Uncaught type when parsing node: %T\n", node)
	}
}
