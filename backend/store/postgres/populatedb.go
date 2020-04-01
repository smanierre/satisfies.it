package postgres

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/joho/godotenv"
	"github.com/smanierre/typer-site/typeparser"
)

//Only use this to create and export a database to be loaded into the production system. For loading in production use LoadDB()
func DEVELOPMENT_PopulateDatabaseAndExport() {

	p := typeparser.NewParser()
	walkFunc := func(path string, info os.FileInfo, err error) error {
		if !strings.Contains(path, "_test.go") && path[len(path)-3:] == ".go" {
			file, err := os.Open(path)
			defer file.Close()
			if err != nil {
				return fmt.Errorf("unable to open file %v", err)
			}
			err = p.ParseFile(path)
			if err != nil {
				fmt.Printf("error parsing file %s with error %v", path, err)
				return nil
			}
		}
		return nil
	}
	filepath.Walk("/usr/local/go/src", walkFunc)
	p.ResolveMethods()
	godotenv.Load("./.env_dev")
	InitDB()
	for i, c := range p.ConcreteTypes {
		id := CreateConcreteType(c.Package, c.Name, c.BaseType)
		p.ConcreteTypes[i].ID = id
		for j, m := range c.Methods {
			p.ConcreteTypes[i].Methods[j].ReceiverID = id
			mid := CreateConcreteMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
			p.ConcreteTypes[i].Methods[j].ID = mid
		}
	}
	for n, i := range p.Interfaces {
		id := CreateInterface(i.Package, i.Name, i.Implementable)
		p.Interfaces[n].ID = id
		for j, m := range i.Methods {
			p.Interfaces[n].Methods[j].ReceiverID = id
			mid := CreateInterfaceMethod(m.Package, m.Name, m.Parameters, m.ReturnValues, m.ReceiverName, id)
			p.Interfaces[n].Methods[j].ID = mid
		}
	}
	cmd := exec.Command("rm", "./store/postgres/dump.pgsql")
	cmd.Run()
	dumpFile, err := os.Create("./store/postgres/dump.pgsql")
	if err != nil {
		log.Fatalf("Error opening file: %s\n", err.Error())
	}
	cmd = exec.Command("pg_dump", "types")
	stderr := bytes.Buffer{}
	cmd.Stderr = &stderr
	cmd.Stdout = dumpFile
	err = cmd.Run()
	if err != nil {
		log.Println(stderr.String())
		log.Fatalf("Error running pg_dump command: %s\n", err.Error())
	}
}

func LoadDB() error {
	godotenv.Load("./.env")
	InitDB()
	cmd := exec.Command("psql", "-U", os.Getenv("DB_USER"), "-h", os.Getenv("DB_HOST"), "-d", os.Getenv("DB_NAME"), "-a", "-f", "dump.pgsql")
	stderr := bytes.Buffer{}
	cmd.Stderr = &stderr
	err := cmd.Run()
	if err != nil {
		fmt.Println(stderr.String())
	}
	return nil
}
