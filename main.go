package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/typeparser"
)

func main() {

	outFile, err := os.OpenFile("interfaces.json", os.O_CREATE|os.O_RDWR, 0666)
	defer outFile.Close()
	if err != nil {
		log.Fatalf("error opening file: %v", err)
	}
	// interfaces := []model.InterfaceRecord{}
	structs := []model.ConcreteTypeRecord{}

	walkFunc := func(path string, info os.FileInfo, err error) error {
		// fmt.Println("Parsing file: " + path)
		if !strings.Contains(path, "_test.go") && path[len(path)-3:] == ".go" {
			file, err := os.Open(path)
			defer file.Close()
			if err != nil {
				return fmt.Errorf("unable to open file %v", err)
			}
			et, err := typeparser.ExtractConcreteTypes(path)
			if err != nil {
				fmt.Printf("error parsing file %s with error %v", path, err)
				return nil
			}
			structs = append(structs, et...)
			// interfaces = append(interfaces, extractedInterfaces...)
		}
		return nil
	}
	filepath.Walk("/usr/lib/go/src", walkFunc)
	json, err := json.MarshalIndent(structs, "", "\t")
	if err != nil {
		log.Fatalf("unable to format json %v", err)
	}
	outFile.Truncate(0)
	outFile.Write(json)
}
