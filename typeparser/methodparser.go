package typeparser

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"

	"github.com/smanierre/typer-site/model"
)

type methodVisitor struct {
	methods     []model.MethodRecord
	packageName string
}

//ExtractMethods takes a filepath of a .go file and parses it to extract all the methods
func ExtractMethods(filename string) ([]model.MethodRecord, error) {
	fs := token.NewFileSet()
	f, err := parser.ParseFile(fs, filename, nil, parser.AllErrors)
	if err != nil {
		return nil, fmt.Errorf("unable to parse file: %s", err.Error())
	}
	visitor := &methodVisitor{}
	visitor.methods = []model.MethodRecord{}
	ast.Walk(visitor, f)
	return visitor.methods, nil
}

func (mv *methodVisitor) Visit(node ast.Node) ast.Visitor {
	switch node.(type) {
	case *ast.File:
		file := node.(*ast.File)
		mv.packageName = file.Name.String()
	case *ast.FuncDecl:
		funcDecl := node.(*ast.FuncDecl)
		if funcDecl.Recv == nil { //No receiver means it's just a regular fuction and not a method
			return mv
		}
		methodRecord := model.MethodRecord{}
		methodRecord.Package = mv.packageName
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
		methodRecord.Parameters = parseFieldList(funcDecl.Type.Params.List)
		if funcDecl.Type.Results == nil {
			methodRecord.ReturnValues = []string{}
		} else {
			methodRecord.ReturnValues = parseFieldList(funcDecl.Type.Results.List)
		}
		mv.methods = append(mv.methods, methodRecord)
	}
	return mv
}
