package main

import (
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"github.com/smanierre/typer-site/server"
	"github.com/smanierre/typer-site/store"
	"github.com/smanierre/typer-site/store/postgres"
)

func main() {
	godotenv.Load(".env")
	postgres.InitDB()
	store, err := store.NewStore()
	if err != nil {
		log.Fatalf("unable to create store: %s", err.Error())
	}
	s := server.NewServer(store)
	http.ListenAndServe(os.Getenv("LISTEN_PORT"), s.ServeMux)
	// http.ListenAndServeTLS(os.Getenv("LISTEN_PORT"), "server.crt", "server.key", s.ServeMux)

	// p := typeparser.NewParser()
	// walkFunc := func(path string, info os.FileInfo, err error) error {
	// 	if !strings.Contains(path, "_test.go") && path[len(path)-3:] == ".go" {
	// 		file, err := os.Open(path)
	// 		defer file.Close()
	// 		if err != nil {
	// 			return fmt.Errorf("unable to open file %v", err)
	// 		}
	// 		fmt.Printf("Parsing file: %s\n", path)
	// 		err = p.ParseFile(path)
	// 		if err != nil {
	// 			fmt.Printf("error parsing file %s with error %v", path, err)
	// 			return nil
	// 		}
	// 	}
	// 	return nil
	// }
	// filepath.Walk("/usr/lib/go/src", walkFunc)
	// p.ResolveMethods()
	// godotenv.Load("./.env")
	// postgres.InitDB()
	// for i, c := range p.ConcreteTypes {
	// 	fmt.Printf("Inserting Type: %s.%s\n", c.Package, c.Name)
	// 	id := postgres.CreateConcreteType(c.Package, c.Name, c.BaseType)
	// 	p.ConcreteTypes[i].ID = id
	// 	for j, m := range c.Methods {
	// 		fmt.Printf("Inserting concrete_method %s on type %s.%s\n", m.Name, c.Package, c.Name)
	// 		p.ConcreteTypes[i].Methods[j].ReceiverID = id
	// 		mid := postgres.CreateConcreteMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
	// 		p.ConcreteTypes[i].Methods[j].ID = mid
	// 	}
	// }
	// for n, i := range p.Interfaces {
	// 	fmt.Printf("Inserting Interface: %s.%s\n", i.Package, i.Name)
	// 	id := postgres.CreateInterface(i.Package, i.Name, i.Implementable)
	// 	p.Interfaces[n].ID = id
	// 	for j, m := range i.Methods {
	// 		fmt.Printf("Inserting interface_method %s on interface %s.%s\n", m.Name, i.Package, i.Name)
	// 		p.Interfaces[n].Methods[j].ReceiverID = id
	// 		mid := postgres.CreateInterfaceMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
	// 		fmt.Println(mid)
	// 		p.Interfaces[n].Methods[j].ID = mid
	// 	}
	// }
}
