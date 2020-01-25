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
	// fmt.Println(visitor.interfaces)
	return visitor.interfaces, nil
}

type interfaceVisitor struct {
	interfaces  []model.InterfaceRecord
	prevToken   ast.Node
	packageName string
}

func (iv *interfaceVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		f := node.(*ast.File)
		iv.packageName = f.Name.String()
	case *ast.InterfaceType:
		record := model.InterfaceRecord{}
		record.Package = iv.packageName
		record.Methods = []model.MethodRecord{}
		// Default the record ID to -1 since the database will handle it on insert.
		record.ID = -1
		previousIdent, ok := iv.prevToken.(*ast.Ident)
		if !ok { // This is an interface that is a parameter to a method
			return iv
		}
		record.Name = previousIdent.String()
		record.Implementable = true
		iface := node.(*ast.InterfaceType)
		for _, method := range iface.Methods.List {
			// If the method is unexported, then don't add it to the interface and also make the interface as un-implementable
			if method.Names[0].Name[0] >= 97 && method.Names[0].Name[0] <= 122 {
				record.Implementable = false
				continue
			}
			methodRecord := model.MethodRecord{}
			methodRecord.Package = iv.packageName
			methodRecord.Name = method.Names[0].String()
			funcDec := method.Type.(*ast.FuncType)

			// Check to see how many parameters there are, and then parse if there are any
			if funcDec.Params.NumFields() == 0 {
				methodRecord.Parameters = []string{}
			} else {
				methodRecord.Parameters = parseParameters(funcDec.Params.List)
			}
			// Check to see how many return values there are, then parse any that exist
			if funcDec.Results.NumFields() == 0 {
				methodRecord.ReturnValues = []string{}
			} else {
				methodRecord.ReturnValues = parseReturnValues(funcDec.Results.List)
			}

			// Set ID = -1 since the database will handle assigning an ID.
			// Set the Receiver ID to -1 since that will be handled later on.
			methodRecord.ID = -1
			methodRecord.ReceiverID = -1
			record.Methods = append(record.Methods, methodRecord)
		}
		iv.interfaces = append(iv.interfaces, record)
	}
	if node != nil {
		iv.prevToken = node
	}
	return iv
}

func parseParameters(params []*ast.Field) []string {
	parameters := []string{}

	for _, p := range params {
		switch p.Type.(type) {
		case *ast.Ident: //Regular identifier e.g. string
			param := p.Type.(*ast.Ident)
			parameters = append(parameters, param.String())
		case *ast.SelectorExpr: //Custom type e.g. io.Writer
			selectorExpr := p.Type.(*ast.SelectorExpr)
			parameters = append(parameters, fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel))
		case *ast.StarExpr: //Pointer e.g. *int
			starExpr := p.Type.(*ast.StarExpr)
			switch starExpr.X.(type) {
			case *ast.SelectorExpr: //pointer type is a custom type e.g. io.Writer
				selectorExpr := starExpr.X.(*ast.SelectorExpr)
				parameters = append(parameters, fmt.Sprintf("*%s.%s", selectorExpr.X, selectorExpr.Sel))
			case *ast.ArrayType: //pointer type is a slice or array e.g. *[]
				arrayType := starExpr.X.(*ast.ArrayType)
				switch arrayType.Elt.(type) {
				case *ast.StarExpr: //pointer is to a slice of pointers e.g. *[]*
					starExpr := arrayType.Elt.(*ast.StarExpr)
					switch starExpr.X.(type) {
					case *ast.Ident: // Pointer type is builtin e.g. *[]*int
						parameters = append(parameters, fmt.Sprintf("*[]*%s", starExpr.X))
					case *ast.SelectorExpr: // Pointer type is a custom type e.g. *[]*io.Writer
						selectorExpr := starExpr.X.(*ast.SelectorExpr)
						parameters = append(parameters, fmt.Sprintf("*[]*%s.%s", selectorExpr.X, selectorExpr.Sel))
					}
				case *ast.SelectorExpr: // pointer is to a slice of custom types e.g. *[]io.Writer
					selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
					parameters = append(parameters, fmt.Sprintf("*[]%s.%s", selectorExpr.X, selectorExpr.Sel))
				case *ast.Ident: // pointer is to a slice of builtin types e.g. *[]int
					parameters = append(parameters, fmt.Sprintf("*[]%s", arrayType.Elt))
				}
			case *ast.Ident: //pointer type is a builtin type e.g. *int
				parameters = append(parameters, fmt.Sprintf("*%s", starExpr.X))
			}
		case *ast.ArrayType: //Array e.g. []int
			arrayType := p.Type.(*ast.ArrayType)
			switch arrayType.Elt.(type) {
			case *ast.StarExpr: //Array of pointers
				starExpr := arrayType.Elt.(*ast.StarExpr)
				switch starExpr.X.(type) {
				case *ast.Ident: //Array of builtin pointers e.g. *int
					parameters = append(parameters, fmt.Sprintf("[]*%s", starExpr.X))
				case *ast.SelectorExpr: //Array of custom type pointers e.g. *io.Writer
					selectorExpr := starExpr.X.(*ast.SelectorExpr)
					parameters = append(parameters, fmt.Sprintf("[]*%s.%s", selectorExpr.X, selectorExpr.Sel))
				}
			case *ast.SelectorExpr: //Array of custom types e.g. io.Writer
				selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
				parameters = append(parameters, fmt.Sprintf("[]%s.%s", selectorExpr.X, selectorExpr.Sel))
			case *ast.Ident: //Array of builting types e.g. int
				parameters = append(parameters, fmt.Sprintf("[]%s", arrayType.Elt))
			case *ast.ArrayType: //Array of Arrays e.g. [][]
				arrayType := arrayType.Elt.(*ast.ArrayType)
				switch arrayType.Elt.(type) {
				case *ast.Ident: //Array of builtin types e.g. [][]int
					parameters = append(parameters, fmt.Sprintf("[][]%s", arrayType.Elt))
				case *ast.SelectorExpr: //Array of custom types e.g. [][]io.Writer
					selectorExpr := arrayType.Elt.(*ast.SelectorExpr)
					parameters = append(parameters, fmt.Sprintf("[][]%s.%s", selectorExpr.X, selectorExpr.Sel))
				case *ast.StarExpr: //Array of pointers e.g. [][]*
					starExpr := arrayType.Elt.(*ast.StarExpr)
					switch starExpr.X.(type) {
					case *ast.SelectorExpr: //Array of pointers to custom types e.g. [][]*io.Writer
						selectorExpr := starExpr.X.(*ast.SelectorExpr)
						parameters = append(parameters, fmt.Sprintf("[][]*%s.%s", selectorExpr.X, selectorExpr.Sel))
					case *ast.Ident: //Array of pointers to builtin types e.g. [][]*int
						parameters = append(parameters, fmt.Sprintf("[][]*%s", starExpr.X))
					}
				}
			}
		case *ast.InterfaceType: //Interface parameter, right now only empty interfaces are supported e.g. interface{}
			interfaceType := p.Type.(*ast.InterfaceType)
			if len(interfaceType.Methods.List) == 0 { // only going to handle empty interfaces for now. If you aren't requiring an empty interface, don't be lazy and just define it...
				parameters = append(parameters, fmt.Sprintf("interface{}"))
			}
		default:
			fmt.Printf("%T\n", p.Type)
		}
	}
	return parameters
}

func parseReturnValues(values []*ast.Field) []string {
	returnValues := []string{}
	for _, r := range values {
		switch r.Type.(type) {
		case *ast.ArrayType:
			at := r.Type.(*ast.ArrayType)
			// Check to see what type the array is and parse accordingly
			switch at.Elt.(type) {
			case *ast.SelectorExpr:
				se := at.Elt.(*ast.SelectorExpr)
				returnValues = append(returnValues, fmt.Sprintf("[]%s", se.Sel.Name))
			case *ast.Ident:
				id := at.Elt.(*ast.Ident)
				returnValues = append(returnValues, fmt.Sprintf("[]%s", id.String()))
			}
		case *ast.SelectorExpr:
			se := r.Type.(*ast.SelectorExpr)
			returnValues = append(returnValues, se.Sel.Name)
		case *ast.Ident:
			id := r.Type.(*ast.Ident)
			returnValues = append(returnValues, id.Name)
		}
	}
	return returnValues
}
