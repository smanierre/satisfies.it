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
					method.PointerReceiver = true
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
					method.Parameters = append(method.Parameters, parseParameter(parameter.Type, file.Name.Name))
				}

				//Resolve return values of the method
				for _, value := range funcDecl.Type.Results.List {
					method.ReturnValues = append(method.ReturnValues, parseParameter(value.Type, file.Name.Name))
				}
				tv.Methods = append(tv.Methods, method)
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
			m.Parameters = append(m.Parameters, parseParameter(field.Type, packageName))
		}

		//Loop through each of the return values and add the type to the method.ReturnValues slice.
		for _, value := range funcType.Results.List {
			//The same assumtion is being made here as above about return values.
			m.ReturnValues = append(m.ReturnValues, parseParameter(value.Type, packageName))
		}
		customType.Methods = append(customType.Methods, m)
	}
}

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
		p.paramString += fmt.Sprintf("chan %s\n", chanValue)
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
