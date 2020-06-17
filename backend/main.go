package main

import (
	"runtime"

	"gitlab.com/sean.manierre/typer-site/parser"
)

func main() {
	// populate := flag.Bool("populate", false, "Set to true if running during build to create a json file to load in production")
	// goSrc := flag.String("goSrc", "/usr/local/go/src", "This is the location of the root of the go files to parse e.g. /usr/local/go/src")
	// certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	// keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	// port := flag.Int("port", 443, "Port for the web server to listen on, defaults to 443.")

	// flag.Parse()

	// if *populate {
	// 	parser.ParseAndExportDirectory(*goSrc)
	// }
	// postgres.InitDB()
	// if *populate {
	// 	postgres.DEVELOPMENT_PopulateDatabaseAndExport()
	// } else {
	// 	postgres.LoadDB()
	// 	store, err := store.NewStore()
	// 	if err != nil {
	// 		log.Fatalf("unable to create store: %s", err.Error())
	// 	}
	// 	s := server.NewServer(store)
	// 	log.Fatal(http.ListenAndServeTLS(fmt.Sprintf(":%d", *port), *certFile, *keyFile, s.ServeMux))
	// }
	// p := parser.NewParser()
	windowsFile := "C:\\Go\\src"
	linuxFile := "/usr/local/go/src"
	var filePath string
	if runtime.GOOS == "linux" {
		filePath = linuxFile
	} else if runtime.GOOS == "windows" {
		filePath = windowsFile
	} else {
		panic("Please don't run my shitty code on a Mac :)")
	}
	err := parser.ParseAndExportDirectory(filePath)
	if err != nil {
		panic(err)
	}
	// p := parser.NewParser()
	// err := p.ParseDir(filePath)
	// if err != nil {
	// 	panic(err)
	// }
	// p.ResolveImplementations()
}
