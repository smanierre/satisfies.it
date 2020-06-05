package main

import (
	"runtime"

	"gitlab.com/sean.manierre/typer-site/parser"
)

func main() {
	// populate := flag.Bool("populate", false, "Set to true if running during build to create a populated database to load in production")
	// certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	// keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	// port := flag.Int("port", 443, "Port for the web server to listen on, defaults to 443.")

	// flag.Parse()

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
	p := parser.NewParser()
	windowsFile := "C:\\Users\\Sean\\Projects\\typer-site\\backend\\parser\\parser.go"
	linuxFile := "/home/sean/Projects/typer-site/backend/parser/types.go"
	var filePath string
	if runtime.GOOS == "linux" {
		filePath = linuxFile
	} else if runtime.GOOS == "windows" {
		filePath = windowsFile
	} else {
		panic("Please don't run my shitty code on a Mac :)")
	}
	err := p.ParseFile(filePath)
	if err != nil {
		panic(err)
	}
}
