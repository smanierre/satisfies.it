package typeparser

import (
	"fmt"
	"go/ast"
	"strings"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/util"
)

type typeVisitor struct {
	interfaces    []model.InterfaceRecord
	concreteTypes []model.ConcreteTypeRecord
	methods       []model.MethodRecord
	prevToken     ast.Node
	packageName   string
}

func (tv *typeVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		f := node.(*ast.File)
		tv.packageName = f.Name.String()
	case *ast.InterfaceType:
		record := model.InterfaceRecord{}
		record.Package = tv.packageName
		record.Methods = []model.MethodRecord{}
		// Default the record ID to -1 since the database will handle it on insert.
		record.ID = -1

		previousIdent, ok := tv.prevToken.(*ast.Ident)
		if !ok { // This is an interface that is a parameter to a method
			return tv
		}
		record.Name = previousIdent.String()
		record.Implementable = true
		iface := node.(*ast.InterfaceType)
		for _, method := range iface.Methods.List {
			// If the method is unexported, then don't add it to the interface and also make the interface as un-implementable
			if len(method.Names) != 0 && !util.StartsWithUppercase(method.Names[0].Name) {
				record.Implementable = false
				continue
			}
			methodRecord := model.MethodRecord{}
			methodRecord.Package = tv.packageName
			if len(method.Names) == 0 { //Embedded interface
				switch method.Type.(type) {
				case *ast.Ident: //Embedded interface is within the same package
					ident := method.Type.(*ast.Ident)
					if !util.StartsWithUppercase(ident.Name) {
						record.Implementable = false
						continue
					}
					methodRecord.Name = fmt.Sprintf("%s.%s", methodRecord.Package, ident.Name)
					methodRecord.Parameters = []string{}
					methodRecord.ReturnValues = []string{}
					methodRecord.ReceiverID = -1
					methodRecord.ID = -1
					record.Methods = append(record.Methods, methodRecord)
					continue
				case *ast.SelectorExpr:
					selectorExpr := method.Type.(*ast.SelectorExpr)
					methodRecord.Name = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
					methodRecord.Parameters = []string{}
					methodRecord.ReturnValues = []string{}
					methodRecord.ReceiverID = -1
					methodRecord.ID = -1
					record.Methods = append(record.Methods, methodRecord)
					continue
				}
			} else {
				methodRecord.Name = method.Names[0].String()
			}
			funcDec := method.Type.(*ast.FuncType)
			parameters := []string{}
			for _, parameter := range funcDec.Params.List {
				numParam := len(parameter.Names)
				param := astBuilder{packageName: tv.packageName}
				param.parseAst(parameter)
				for i := 0; i < numParam; i++ {
					parameters = append(parameters, param.String())
				}
				if numParam == 0 { //If the param is nameless, still add it once to show it exists
					parameters = append(parameters, param.String())
				}
			}
			methodRecord.Parameters = parameters
			returnValues := []string{}
			if funcDec.Results != nil {
				for _, returnValue := range funcDec.Results.List {
					result := astBuilder{packageName: tv.packageName}
					result.parseAst(returnValue)
					returnValues = append(returnValues, result.String())
				}
			}
			methodRecord.ReturnValues = returnValues
			methodRecord.ID = -1
			methodRecord.ReceiverID = -1
			record.Methods = append(record.Methods, methodRecord)
		}
		tv.interfaces = append(tv.interfaces, record)
	case *ast.TypeSpec:
		typeSpec := node.(*ast.TypeSpec)
		if !util.StartsWithUppercase(typeSpec.Name.String()) {
			return tv
		}
		structRecord := model.ConcreteTypeRecord{}
		structRecord.Package = tv.packageName
		structRecord.Name = typeSpec.Name.String()
		structRecord.Methods = []model.MethodRecord{}
		structRecord.ID = -1
		_, ok := typeSpec.Type.(*ast.StructType)
		if ok { //Since the astBuilder parses more than just the base type e.g. "struct", limit
			structRecord.BaseType = "struct"
		} else {
			baseType := astBuilder{packageName: tv.packageName}
			baseType.parseAst(typeSpec.Type)
			structRecord.BaseType = baseType.String()
		}
		tv.concreteTypes = append(tv.concreteTypes, structRecord)
	case *ast.FuncDecl:
		funcDecl := node.(*ast.FuncDecl)
		if funcDecl.Recv == nil { //No receiver means it's just a regular fuction and not a method
			return tv
		}
		if !util.StartsWithUppercase(funcDecl.Name.Name) { //Unexported method
			return tv
		}
		//Check to see if the method is on an unexported type. If so, ignore it.
		var recvname string
		starExpr, ok := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
		recvname = fmt.Sprint(funcDecl.Recv.List[0].Type)
		if ok {
			recvname = fmt.Sprint(starExpr.X)
		}
		if !util.StartsWithUppercase(recvname) {
			return tv
		}
		methodRecord := model.MethodRecord{}
		methodRecord.Package = tv.packageName
		methodRecord.Name = funcDecl.Name.Name
		switch funcDecl.Recv.List[0].Type.(type) { //Check to see if pointer receiver is used or not
		case *ast.StarExpr: //Pointer receiver
			starExpr := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
			methodRecord.ReceiverName = fmt.Sprintf("*%s", starExpr.X)
		case *ast.Ident: //Regular receiver
			methodRecord.ReceiverName = fmt.Sprint(funcDecl.Recv.List[0].Type)
		}
		methodRecord.ReceiverID = -1
		methodRecord.ID = -1
		parameters := []string{}
		for _, parameter := range funcDecl.Type.Params.List {
			numParam := len(parameter.Names)
			param := astBuilder{packageName: tv.packageName}
			param.parseAst(parameter)
			for i := 0; i < numParam; i++ {
				parameters = append(parameters, param.String())
			}
			if numParam == 0 { //If the param is nameless, still add it once to show it exists
				parameters = append(parameters, param.String())
			}
		}
		methodRecord.Parameters = parameters
		returnValues := []string{}
		if funcDecl.Type.Results != nil {
			for _, returnValue := range funcDecl.Type.Results.List {
				result := astBuilder{packageName: tv.packageName}
				result.parseAst(returnValue)
				returnValues = append(returnValues, result.String())
			}
		}
		methodRecord.ReturnValues = returnValues
		tv.methods = append(tv.methods, methodRecord)
	}
	if node != nil {
		tv.prevToken = node
	}
	return tv
}

type astBuilder struct {
	packageName string
	astString   string
}

func (a *astBuilder) parseAst(node ast.Node) {
	switch node.(type) {
	case *ast.Field:
		field := node.(*ast.Field)
		a.parseAst(field.Type)
	case *ast.SelectorExpr:
		selectorExpr := node.(*ast.SelectorExpr)
		a.astString += fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
	case *ast.ArrayType:
		arrayType := node.(*ast.ArrayType)
		a.astString += "[]"
		a.parseAst(arrayType.Elt)
	case *ast.Ident:
		if !util.IsBuiltinType(fmt.Sprint(node)) {
			a.astString += fmt.Sprintf("%s.%s", a.packageName, node)
		} else {
			a.astString += fmt.Sprintf("%s", node)
		}
	case *ast.StarExpr:
		starExpr := node.(*ast.StarExpr)
		a.astString += "*"
		a.parseAst(starExpr.X)
	case *ast.Ellipsis:
		ellipsis := node.(*ast.Ellipsis)
		a.astString += "..."
		a.parseAst(ellipsis.Elt)
	case *ast.InterfaceType:
		interfaceType := node.(*ast.InterfaceType)
		//TODO: implement recursive interface parsing, only handles empty interfaces for now
		if len(interfaceType.Methods.List) == 0 {
			a.astString += "interface{}"
		}
	case *ast.FuncType:
		funcType := node.(*ast.FuncType)
		params := []string{}
		for _, parameter := range funcType.Params.List {
			param := astBuilder{packageName: a.packageName}
			param.parseAst(parameter)
			params = append(params, param.String())
		}
		returnValues := []string{}
		if funcType.Results != nil {
			for _, returnValue := range funcType.Results.List {
				result := astBuilder{packageName: a.packageName}
				result.parseAst(returnValue)
				returnValues = append(returnValues, result.String())
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
		a.astString += fmt.Sprintf("func(%s) %s", paramsString, returnString)
	case *ast.MapType:
		mapType := node.(*ast.MapType)
		keyString := astBuilder{packageName: a.packageName}
		keyString.parseAst(mapType.Key)
		valueString := astBuilder{packageName: a.packageName}
		valueString.parseAst(mapType.Value)
		a.astString += fmt.Sprintf("map[%s]%s", keyString, valueString)
	case *ast.ChanType:
		chanType := node.(*ast.ChanType)
		chanValue := astBuilder{packageName: a.packageName}
		chanValue.parseAst(chanType.Value)
		a.astString += fmt.Sprintf("chan %s\n", chanValue)
	case *ast.StructType:
		structType := node.(*ast.StructType)
		//TODO: Implement recursive struct parsing
		if len(structType.Fields.List) == 0 {
			a.astString += "struct{}"
		}
	default:
		fmt.Printf("Uncaught type when parsing node: %T\n", node)
	}
}

func (a astBuilder) String() string {
	return string(a.astString)
}
