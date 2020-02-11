package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/smanierre/typer-site/typeparser"
)

func main() {

	typeFile, err := os.OpenFile("types.json", os.O_CREATE|os.O_RDWR, 0666)
	defer typeFile.Close()
	if err != nil {
		log.Fatalf("error opening file: %v", err)
	}
	interfaceFile, err := os.OpenFile("interfaces.json", os.O_CREATE|os.O_RDWR, 0666)
	defer interfaceFile.Close()
	if err != nil {
		log.Fatalf("error opening file: %v", err)
	}
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
	typeJson, err := json.MarshalIndent(p.ConcreteTypes, "", "\t")
	if err != nil {
		log.Fatalf("unable to format json %v", err)
	}
	interfaceJson, err := json.MarshalIndent(p.Interfaces, "", "\t")
	if err != nil {
		log.Fatalf("unable to format json %v", err)
	}
	typeFile.Truncate(0)
	typeFile.Write(typeJson)
	interfaceFile.Truncate(0)
	interfaceFile.Write(interfaceJson)
}
