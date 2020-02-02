package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/util"
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
	visitor.types = []model.ConcreteTypeRecord{}
	ast.Walk(visitor, f)
	return visitor.types, nil
}

func (cv *concreteTypeVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		file := node.(*ast.File)
		cv.packageName = file.Name.Name
	case *ast.TypeSpec:
		typeSpec := node.(*ast.TypeSpec)
		switch typeSpec.Type.(type) {
		case *ast.StructType:
			if !util.StartsWithUppercase(typeSpec.Name.String()) {
				return cv
			}
			structRecord := model.ConcreteTypeRecord{}
			structRecord.Package = cv.packageName
			structRecord.Name = typeSpec.Name.String()
			structRecord.BaseType = "struct"
			structRecord.Methods = []model.MethodRecord{}
			structRecord.ID = -1
			cv.types = append(cv.types, structRecord)
		case *ast.Ident:
			structRecord := model.ConcreteTypeRecord{}
			structRecord.Package = cv.packageName
			structRecord.Name = typeSpec.Name.String()
			structRecord.BaseType = fmt.Sprint(typeSpec.Type)
			structRecord.Methods = []model.MethodRecord{}
			structRecord.ID = -1
			cv.types = append(cv.types, structRecord)
		}
	}
	if node != nil {
		cv.prevToken = node
	}
	return cv
}
