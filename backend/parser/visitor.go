package parser

import (
	"fmt"
	"go/ast"
	"strings"

	"gitlab.com/sean.manierre/typer-site/util"
)

type typeVisitor struct {
	Types       []CustomType
	Methods     []Method
	prevToken   ast.Node
	twoBack     ast.Node
	packageName string
}

func (tv *typeVisitor) Visit(node ast.Node) ast.Visitor {
	//Ignore empty nodes
	if node == nil {
		return tv
	}

	switch node.(type) {
	case *ast.File:
		file := node.(*ast.File)
		//Loop through the declarations to find all the type and function declarations
		for _, decl := range file.Decls {
			switch decl.(type) {
			case *ast.GenDecl: // According to the documentation a GenDecl is one of the following: "import, constant, type or variable declaration."
				genDecl := decl.(*ast.GenDecl)
				//genDecl.Specs is the list of specifications. Looping through this will give us all the declarations we care about.
				for _, spec := range genDecl.Specs {
					switch spec.(type) {
					case *ast.TypeSpec:
						typeSpec := spec.(*ast.TypeSpec)
						customType := CustomType{}
						customType.Package = file.Name.Name
						customType.Name = typeSpec.Name.Name
						//Assume concrete type, if it is an interface, this will be overwritten later
						customType.Type = ConcreteType
						switch typeSpec.Type.(type) {
						case *ast.InterfaceType:
							//Since handling interfaces will require parsing methods on the spot instead of resolving later,
							//this is getting extracted into a different function for readability.
							iface := typeSpec.Type.(*ast.InterfaceType)
							parseInterface(&customType, iface, file.Name.Name)
							tv.Types = append(tv.Types, customType)
							continue
						case *ast.StructType:
							//Only thing to do is set the base type, the methods will be added later once the whole package is parsed.
							customType.Basetype = "struct"
							tv.Types = append(tv.Types, customType)
							continue
						case *ast.Ident:
							ident := typeSpec.Type.(*ast.Ident)
							//If ident starts with an uppercase, prepend the current package name.
							if util.StartsWithUppercase(ident.Name) {
								customType.Basetype = fmt.Sprintf("%s.%s", file.Name.Name, ident.Name)
								tv.Types = append(tv.Types, customType)
								continue
							}
							customType.Basetype = ident.Name
							tv.Types = append(tv.Types, customType)
							continue
						case *ast.SelectorExpr:
							selectorExpr := typeSpec.Type.(*ast.SelectorExpr)
							customType.Basetype = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
							tv.Types = append(tv.Types, customType)
							continue
						default:
							fmt.Printf("Unknown basetype: %T\n", typeSpec.Type)
						}
					case *ast.ImportSpec, *ast.ValueSpec:
						//Don't care about these, just continue.
						continue
					default:
						fmt.Printf("Unknown spec type: %T\n", spec)
					}
				}
			case *ast.FuncDecl:
				funcDecl := decl.(*ast.FuncDecl)
				if funcDecl.Recv == nil {
					//Not attached to a type, skip it.
					continue
				}
				method := Method{}
				method.Name = funcDecl.Name.Name

				//Resolve whether or not the receiver is a pointer and the name of it.
				switch funcDecl.Recv.List[0].Type.(type) {
				case *ast.Ident:
					ident := funcDecl.Recv.List[0].Type.(*ast.Ident)
					method.PointerReceiver = false
					method.Receiver = fmt.Sprintf("%s.%s", file.Name.Name, ident.Name)
				case *ast.StarExpr:
					starExpr := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
					//Extract the name of the pointer value
					switch starExpr.X.(type) {
					case *ast.Ident:
						ident := starExpr.X.(*ast.Ident)
						method.Receiver = fmt.Sprintf("*%s.%s", file.Name.Name, ident.Name)
					default:
						fmt.Printf("Unknown type when parsing Method pointer receiver name: %T\n", starExpr.X)
					}
				default:
					fmt.Printf("Unknown receiver type when parsing function declaration receivers: %T\n", funcDecl.Recv.List[0].Type)
				}

				//Resolve parameters of the method
				for _, parameter := range funcDecl.Type.Params.List {

				}
			default:
				fmt.Printf("Unknown Declaration type: %T\n", decl)
			}
		}
	}
	return tv
}

func parseInterface(customType *CustomType, iface *ast.InterfaceType, packageName string) {
	customType.Type = Interface
	customType.Basetype = "interface"
	for _, method := range iface.Methods.List {
		m := Method{}
		//Interface method so it can't be a pointer receiver
		m.PointerReceiver = false
		m.Receiver = ""

		//Determine name of method, and if embedded interface, name accordingly for later processing.
		if len(method.Names) > 0 {
			//Method has a name, so it's just a regular method.
			m.Name = method.Names[0].Name
		} else {
			//The interface is embedded, set the name as package.Interface name to be resolved later.
			switch method.Type.(type) {
			case *ast.SelectorExpr:
				//Interface is from external package so all the needed info is within the Type field
				selectorExpr := method.Type.(*ast.SelectorExpr)
				m.Name = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
			case *ast.Ident:
				//Interface is from within the package, use the passed in package string and prepend it to the interface name for later recognition
				ident := method.Type.(*ast.Ident)
				m.Name = fmt.Sprintf("%s.%s", packageName, ident.Name)
			}
			//Since interface is embedded, there are no parameters or return values
			m.Parameters = nil
			m.ReturnValues = nil
			customType.Methods = append(customType.Methods, m)
			continue
		}

		//Make sure the method is actually a function, then parse the parameters and return values
		funcType, ok := method.Type.(*ast.FuncType)
		if !ok {
			panic("Method isn't an embedded interface or function, guess i'll die now.")
		}

		//Loop through each of the parameters and add the type to the method.Parameters slice.
		for _, field := range funcType.Params.List {
			//A bold assumption is being made here. If the type is of *ast.Ident, meaning it is not from an external package, and
			//has a lowercase name, then it is going to be assumed it's a builtin type. Otherwise, the package name will be prepended to the name.
			switch field.Type.(type) {
			case *ast.Ident:
				ident := field.Type.(*ast.Ident)
				if !util.StartsWithUppercase(ident.Name) {
					//assuming builtin type here because otherwise external packages wouldn't be able to implement the function
					m.Parameters = append(m.Parameters, ident.Name)
					continue
				}
				m.Parameters = append(m.Parameters, fmt.Sprintf("%s.%s", packageName, ident.Name))
			//Param is a from an external package, just add formatted name to m.Parameters slice
			case *ast.SelectorExpr:
				selectorExpr := field.Type.(*ast.SelectorExpr)
				m.Parameters = append(m.Parameters, fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel))
			default:
				fmt.Printf("Unknown type when parsing interface method parameters: %T\n", field.Type)
			}
		}

		//Loop through each of the return values and add the type to the method.ReturnValues slice.
		for _, value := range funcType.Results.List {
			//The same assumtion is being made here as above about return values.
			switch value.Type.(type) {
			case *ast.Ident:
				ident := value.Type.(*ast.Ident)
				if !util.StartsWithUppercase(ident.Name) {
					m.ReturnValues = append(m.ReturnValues, ident.Name)
					continue
				}
				m.ReturnValues = append(m.ReturnValues, fmt.Sprintf("%s.%s", packageName, ident.Name))
			case *ast.SelectorExpr:
				selectorExpr := value.Type.(*ast.SelectorExpr)
				m.ReturnValues = append(m.ReturnValues, fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel))
			default:
				fmt.Printf("Unknown type when parsing interface method return values: %T\n", value.Type)
			}
		}
		customType.Methods = append(customType.Methods, m)
	}
}

/*
Use the Decls field on the File object to search the file for type and function declarations and parse accordingly. Should be cleaner.
*/

// func (tv *typeVisitor) Visit(node ast.Node) ast.Visitor {
// 	switch node.(type) {
// 	case *ast.File:
// 		f := node.(*ast.File)
// 		tv.packageName = f.Name.String()

// 	case *ast.InterfaceType:
// 		previousIdent, ok := tv.prevToken.(*ast.Ident)
// 		if !ok { // This is an interface that is a parameter to a method
// 			return tv
// 		}
// 		_, ok = tv.prevToken.(*ast.Field)
// 		if ok { // This is an interface that is a return value from a method
// 			return tv
// 		}
// 		_, ok = tv.twoBack.(*ast.Field)
// 		if ok { //This is an interface that is a field in a struct
// 			return tv
// 		}
// 		if !util.StartsWithUppercase(previousIdent.String()) { //Interface is unexported, ignore it
// 			return tv
// 		}
// 		record := CustomType{}
// 		record.Package = tv.packageName
// 		record.Methods = []Method{}
// 		record.Type = Interface
// 		record.Name = previousIdent.String()

// 		iface := node.(*ast.InterfaceType)
// 		for _, method := range iface.Methods.List {
// 			methodRecord := Method{}
// 			if len(method.Names) == 0 { //Embedded interface
// 				switch method.Type.(type) {
// 				case *ast.Ident: //Embedded interface is within the same package
// 					ident := method.Type.(*ast.Ident)
// 					methodRecord.Name =  ident.Name
// 					methodRecord.Parameters = []string{}
// 					methodRecord.ReturnValues = []string{}
// 					methodRecord.Receiver = &record
// 					record.Methods = append(record.Methods, methodRecord)
// 					continue
// 				case *ast.SelectorExpr:
// 					selectorExpr := method.Type.(*ast.SelectorExpr)
// 					methodRecord.Name = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
// 					methodRecord.Parameters = []string{}
// 					methodRecord.ReturnValues = []string{}
// 					methodRecord.Receiver = &record
// 					record.Methods = append(record.Methods, methodRecord)
// 					continue
// 				}
// 			} else {
// 				methodRecord.Name = method.Names[0].String()
// 			}
// 			funcDec := method.Type.(*ast.FuncType)
// 			parameters := []string{}
// 			for _, parameter := range funcDec.Params.List {
// 				numParam := len(parameter.Names)
// 				param := astBuilder{packageName: tv.packageName}
// 				param.parseAst(parameter)
// 				for i := 0; i < numParam; i++ {
// 					parameters = append(parameters, param.String())
// 				}
// 				if numParam == 0 { //If the param is nameless, still add it once to show it exists
// 					parameters = append(parameters, param.String())
// 				}
// 			}
// 			methodRecord.Parameters = parameters
// 			returnValues := []string{}
// 			if funcDec.Results != nil {
// 				for _, returnValue := range funcDec.Results.List {
// 					result := astBuilder{packageName: tv.packageName}
// 					result.parseAst(returnValue)
// 					returnValues = append(returnValues, result.String())
// 				}
// 			}
// 			methodRecord.ReturnValues = returnValues
// 			methodRecord.Receiver = &record
// 			record.Methods = append(record.Methods, methodRecord)
// 		}
// 		tv.Types = append(tv.Types, record)
// 	case *ast.TypeSpec:
// 		typeSpec := node.(*ast.TypeSpec)
// 		structRecord := model.ConcreteTypeRecord{}
// 		structRecord.Package = tv.packageName
// 		structRecord.Name = typeSpec.Name.String()
// 		structRecord.Methods = []model.MethodRecord{}
// 		structRecord.ID = -1
// 		_, ok := typeSpec.Type.(*ast.StructType)
// 		if ok { //Since the astBuilder parses more than just the base type e.g. "struct", limit
// 			structRecord.BaseType = "struct"
// 		} else {
// 			baseType := astBuilder{packageName: tv.packageName}
// 			baseType.parseAst(typeSpec.Type)
// 			structRecord.BaseType = baseType.String()
// 		}
// 		tv.Types = append(tv.Types, structRecord)
// 	case *ast.FuncDecl:
// 		funcDecl := node.(*ast.FuncDecl)
// 		if funcDecl.Recv == nil { //No receiver means it's just a regular fuction and not a method
// 			return tv
// 		}
// 		if !util.StartsWithUppercase(funcDecl.Name.Name) { //Unexported method
// 			return tv
// 		}
// 		//Check to see if the method is on an unexported type. If so, ignore it.
// 		var recvname string
// 		starExpr, ok := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
// 		recvname = fmt.Sprint(funcDecl.Recv.List[0].Type)
// 		if ok {
// 			recvname = fmt.Sprint(starExpr.X)
// 		}
// 		if !util.StartsWithUppercase(recvname) {
// 			return tv
// 		}
// 		methodRecord := model.MethodRecord{}
// 		methodRecord.Package = tv.packageName
// 		methodRecord.Name = funcDecl.Name.Name
// 		switch funcDecl.Recv.List[0].Type.(type) { //Check to see if pointer receiver is used or not
// 		case *ast.StarExpr: //Pointer receiver
// 			starExpr := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
// 			methodRecord.ReceiverName = fmt.Sprintf("*%s", starExpr.X)
// 		case *ast.Ident: //Regular receiver
// 			methodRecord.ReceiverName = fmt.Sprint(funcDecl.Recv.List[0].Type)
// 		}
// 		methodRecord.ReceiverID = -1
// 		methodRecord.ID = -1
// 		parameters := []string{}
// 		for _, parameter := range funcDecl.Type.Params.List {
// 			numParam := len(parameter.Names)
// 			param := astBuilder{packageName: tv.packageName}
// 			param.parseAst(parameter)
// 			for i := 0; i < numParam; i++ {
// 				parameters = append(parameters, param.String())
// 			}
// 			if numParam == 0 { //If the param is nameless, still add it once to show it exists
// 				parameters = append(parameters, param.String())
// 			}
// 		}
// 		methodRecord.Parameters = parameters
// 		returnValues := []string{}
// 		if funcDecl.Type.Results != nil {
// 			for _, returnValue := range funcDecl.Type.Results.List {
// 				result := astBuilder{packageName: tv.packageName}
// 				result.parseAst(returnValue)
// 				returnValues = append(returnValues, result.String())
// 			}
// 		}
// 		methodRecord.ReturnValues = returnValues
// 		tv.methods = append(tv.methods, methodRecord)
// 	}
// 	if node != nil {
// 		tv.twoBack = tv.prevToken
// 		tv.prevToken = node
// 	}
// 	return tv
// }

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
		//Trim space to get rid of trailing space if there are no return values
		a.astString += strings.TrimSpace(fmt.Sprintf("func(%s) %s", paramsString, returnString))
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
	case *ast.ParenExpr:
		parenExpr := node.(*ast.ParenExpr)
		a.astString += "("
		a.parseAst(parenExpr.X)
		a.astString += ")"
	default:
		fmt.Printf("Uncaught type when parsing node: %T\n", node)
	}
}

func (a astBuilder) String() string {
	return string(a.astString)
}
