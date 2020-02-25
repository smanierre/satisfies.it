package postgres

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"github.com/joho/godotenv"
	"github.com/smanierre/typer-site/typeparser"
)

func PopulateDatabase() {

	p := typeparser.NewParser()
	walkFunc := func(path string, info os.FileInfo, err error) error {
		if !strings.Contains(path, "_test.go") && path[len(path)-3:] == ".go" {
			file, err := os.Open(path)
			defer file.Close()
			if err != nil {
				return fmt.Errorf("unable to open file %v", err)
			}
			fmt.Printf("Parsing file: %s\n", path)
			err = p.ParseFile(path)
			if err != nil {
				fmt.Printf("error parsing file %s with error %v", path, err)
				return nil
			}
		}
		return nil
	}
	filepath.Walk("/usr/lib/go/src", walkFunc)
	p.ResolveMethods()
	godotenv.Load("./.env")
	InitDB()
	for i, c := range p.ConcreteTypes {
		fmt.Printf("Inserting Type: %s.%s\n", c.Package, c.Name)
		id := CreateConcreteType(c.Package, c.Name, c.BaseType)
		p.ConcreteTypes[i].ID = id
		for j, m := range c.Methods {
			fmt.Printf("Inserting concrete_method %s on type %s.%s\n", m.Name, c.Package, c.Name)
			p.ConcreteTypes[i].Methods[j].ReceiverID = id
			mid := CreateConcreteMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
			p.ConcreteTypes[i].Methods[j].ID = mid
		}
	}
	for n, i := range p.Interfaces {
		fmt.Printf("Inserting Interface: %s.%s\n", i.Package, i.Name)
		id := CreateInterface(i.Package, i.Name, i.Implementable)
		p.Interfaces[n].ID = id
		for j, m := range i.Methods {
			fmt.Printf("Inserting interface_method %s on interface %s.%s\n", m.Name, i.Package, i.Name)
			p.Interfaces[n].Methods[j].ReceiverID = id
			mid := CreateInterfaceMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
			fmt.Println(mid)
			p.Interfaces[n].Methods[j].ID = mid
		}
	}
}
