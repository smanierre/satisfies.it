package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/smanierre/typer-site/typeparser"
)

func main() {

	outFile, err := os.OpenFile("interfaces.json", os.O_CREATE|os.O_RDWR, 0666)
	defer outFile.Close()
	if err != nil {
		log.Fatalf("error opening file: %v", err)
	}
	p := typeparser.NewParser()
	// p.ParseFile("/usr/lib/go/src/vendor/golang.org/x/crypto/cryptobyte/string.go")
	// if err != nil {
	// 	fmt.Printf("%s\n", err.Error())
	// 	os.Exit(1)
	// }
	walkFunc := func(path string, info os.FileInfo, err error) error {
		if !strings.Contains(path, "_test.go") && path[len(path)-3:] == ".go" {
			file, err := os.Open(path)
			defer file.Close()
			if err != nil {
				return fmt.Errorf("unable to open file %v", err)
			}
			// fmt.Printf("Parsing file: %s\n", path)
			err = p.ParseFile(path)
			if err != nil {
				fmt.Printf("error parsing file %s with error %v", path, err)
				return nil
			}
		}
		return nil
	}
	filepath.Walk("/usr/lib/go/src", walkFunc)
	// p.ResolveMethods()
	// json, err := json.MarshalIndent(structs, "", "\t")
	// if err != nil {
	// 	log.Fatalf("unable to format json %v", err)
	// }
	// outFile.Truncate(0)
	// outFile.Write(json)
}
