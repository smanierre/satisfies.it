package parser

import (
	"fmt"
	"go/ast"

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
						if !util.StartsWithUppercase(typeSpec.Name.Name) {
							//Unexported type, skip it.
							continue
						}
						customType := CustomType{}
						customType.Package = file.Name.Name
						customType.Name = typeSpec.Name.Name
						customType.Methods = []Method{}
						//Assume concrete type, if it is an interface, this will be overwritten later
						customType.Type = ConcreteType
						setBaseType(typeSpec.Type, file.Name.Name, &customType)
						if customType.Basetype == "interface" {
							parseInterface(&customType, typeSpec.Type.(*ast.InterfaceType), file.Name.Name)
						}
						tv.Types = append(tv.Types, customType)
						continue
					case *ast.ImportSpec, *ast.ValueSpec:
						//Don't care about imports or variable/const declarations. Just continue.
						continue
					default:
						fmt.Printf("Unknown spec type: %T\n", spec)
					}
				}
			case *ast.FuncDecl:
				funcDecl := decl.(*ast.FuncDecl)
				if !util.StartsWithUppercase(funcDecl.Name.Name) {
					//Unexported method, ignore it.
					continue
				}
				if funcDecl.Recv == nil {
					//Not attached to a type, skip it.
					continue
				}
				method := Method{}
				method.Package = file.Name.Name
				method.Name = funcDecl.Name.Name
				method.Parameters = []string{}
				method.ReturnValues = []string{}

				if len(funcDecl.Recv.List) == 0 {
					//This is most likely a test file with a line like "func ( /* receiver type */ ) f0() {}"
					//such as in file $GoSrcDir/go/doc/testdata/issue17788.go
					//since this is not a valid method, just continue
					continue
				}
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

				//funcDecl.Type.Params.List is nil if there are no parameters
				if funcDecl.Type.Params.List != nil {
					//Resolve parameters of the method
					for _, parameter := range funcDecl.Type.Params.List {
						//If the length of names is more than one it represents the syntax func(a, b string), therefore the type needs to be
						//appended multiple times.
						for i := 0; i < len(parameter.Names); i++ {
							method.Parameters = append(method.Parameters, parseParameter(parameter.Type, file.Name.Name))
						}
					}
				}

				//funcDecl.Type.Results is nil if there are no return values
				if funcDecl.Type.Results != nil {
					//Resolve return values of the method
					for _, value := range funcDecl.Type.Results.List {
						method.ReturnValues = append(method.ReturnValues, parseParameter(value.Type, file.Name.Name))
					}
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
	for _, method := range iface.Methods.List {
		m := Method{}
		m.Package = packageName //Setting package name in case it's needed later, but as of now it doesn't get used for interface methods.
		//Interface method so it can't be a pointer receiver
		m.PointerReceiver = false
		m.Receiver = ""
		m.Parameters = []string{}
		m.ReturnValues = []string{}

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

		//If there are no parameters, funcType.Params.List is nil
		if funcType.Params.List != nil {
			//Loop through each of the parameters and add the type to the method.Parameters slice.
			for _, field := range funcType.Params.List {
				//A bold assumption is being made here. If the type is of *ast.Ident, meaning it is not from an external package, and
				//has a lowercase name, then it is going to be assumed it's a builtin type. Otherwise, the package name will be prepended to the name.
				m.Parameters = append(m.Parameters, parseParameter(field.Type, packageName))
			}
		}

		//If there are no return values, funcType.Results is nil
		if funcType.Results != nil {
			//Loop through each of the return values and add the type to the method.ReturnValues slice.
			for _, value := range funcType.Results.List {
				//The same assumtion is being made here as above about return values.
				m.ReturnValues = append(m.ReturnValues, parseParameter(value.Type, packageName))
			}
		}
		customType.Methods = append(customType.Methods, m)
	}
}
