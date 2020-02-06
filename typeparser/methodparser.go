package typeparser

import (
	"fmt"
	"go/ast"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/util"
)

type methodVisitor struct {
	methods     []model.MethodRecord
	packageName string
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
		if !util.StartsWithUppercase(funcDecl.Name.Name) { //Unexported method
			return mv
		}
		//Check to see if the method is on an unexported type. If so, ignore it.
		var recvname string
		starExpr, ok := funcDecl.Recv.List[0].Type.(*ast.StarExpr)
		recvname = fmt.Sprint(funcDecl.Recv.List[0].Type)
		if ok {
			recvname = fmt.Sprint(starExpr.X)
		}
		if !util.StartsWithUppercase(recvname) {
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
