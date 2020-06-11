package parser

import (
	"fmt"
	"go/ast"
	"strings"

	"gitlab.com/sean.manierre/typer-site/util"
)

func setBaseType(t ast.Expr, packageName string, customType *CustomType) {
	switch t.(type) {
	case *ast.InterfaceType:
		//Since handling interfaces will require parsing methods on the spot instead of resolving later,
		//this is getting extracted into a different function for readability.
		customType.Type = Interface
		customType.Basetype = "interface"
	case *ast.StructType:
		//Only thing to do is set the base type, the methods will be added later once the whole package is parsed.
		customType.Basetype = "struct"
	case *ast.Ident:
		ident := t.(*ast.Ident)
		//If ident starts with an uppercase, prepend the current package name.
		if util.StartsWithUppercase(ident.Name) {
			customType.Basetype = fmt.Sprintf("%s.%s", packageName, ident.Name)
		}
		customType.Basetype = ident.Name
	case *ast.SelectorExpr:
		selectorExpr := t.(*ast.SelectorExpr)
		customType.Basetype = fmt.Sprintf("%s.%s", selectorExpr.X, selectorExpr.Sel)
	case *ast.FuncType:
		funcType := t.(*ast.FuncType)
		params, results := []string{}, []string{}

		//Get list of parameters
		if funcType.Params.List != nil {
			for _, param := range funcType.Params.List {
				params = append(params, parseParameter(param, packageName))
			}
		}

		//Get list of return values
		if funcType.Results != nil {
			for _, result := range funcType.Results.List {
				results = append(results, parseParameter(result, packageName))
			}
		}

		resultString := ""

		//If the amount of return values is more than one, format accordingly.
		if len(results) > 1 {
			resultString = fmt.Sprintf("(%s)", strings.Join(results, ", "))
		} else if len(results) == 1 {
			resultString = results[0]
		}
		//Trimspace to get rid of the extra space if there are no return values
		customType.Basetype = strings.TrimSpace(fmt.Sprintf("func(%s) %s", strings.Join(params, ", "), resultString))
	case *ast.ArrayType:
		arrayType := t.(*ast.ArrayType)
		customType.Basetype = fmt.Sprintf("[]%s\n", parseParameter(arrayType.Elt, packageName))
	case *ast.MapType:
		mapType := t.(*ast.MapType)
		a := parseParameter(mapType.Value, packageName)
		if a == "[]" { //TODO: Handle having an anonymous struct as the value of a map as in /usr/local/go/src/cmd/vendor/github.com/google/pprof/internal/plugin/plugin.go
			// fmt.Println(packageName)
			// fmt.Println(customType.Name)
		}
		customType.Basetype = fmt.Sprintf("map[%s]%s\n", parseParameter(mapType.Key, packageName), parseParameter(mapType.Value, packageName))
	case *ast.StarExpr:
		starExpr := t.(*ast.StarExpr)
		customType.Basetype = fmt.Sprintf("*%s\n", parseParameter(starExpr.X, packageName))
	case *ast.ChanType:
		chanType := t.(*ast.ChanType)
		customType.Basetype = parseParameter(chanType, packageName)
	case *ast.ParenExpr:
		parenExpr := t.(*ast.ParenExpr)
		customType.Basetype = fmt.Sprintf("(%s)", parseParameter(parenExpr.X, packageName))
	default:
		fmt.Printf("Unknown basetype: %T\n", t)
	}
}
