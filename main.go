package main

import (
	"os"
	"path/filepath"
	"strings"

	"github.com/smanierre/typer-site/typeparser"
)

func main() {
	typeparser.ExtractConcreteTypes("./model/types.go")
	filepath.Walk("/usr/lib/go/src", walkFn)
	// err := godotenv.Load()
	// if err != nil {
	// 	log.Fatal("Error loading .env file", err)
	// }
	// db.InitDB()
	// store, err := store.NewStore()
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// s := server.NewServer(store)
	// s.Handle("/", http.FileServer(http.Dir(os.Getenv("PUBLIC_DIR"))))
	// log.Fatal(http.ListenAndServe(os.Getenv("PUBLIC_DIR"), s))

}

func walkFn(path string, info os.FileInfo, err error) error {
	if info.IsDir() {
		return nil
	}
	if info.Name()[len(info.Name())-3:] != ".go" {
		return nil
	}
	if strings.Contains(info.Name(), "_test.go") {
		return nil
	}
	// fmt.Println("Parsing file: ", path)
	typeparser.ExtractInterfaces(path)
	return nil
}
