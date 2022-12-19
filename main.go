package main

import (
	"embed"
	"log"

	_ "github.com/mattn/go-sqlite3"
	"gitlab.com/sean.manierre/typer-site/sqlite"
)

//go:embed templates/*
var templateDir embed.FS

//go:embed static
var staticDir embed.FS

func main() {
	// certFile := flag.String("certFile", "cert.pem", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	// keyFile := flag.String("keyFile", "key.pem", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	// dbHost := flag.String("dbHost", os.Getenv("DB_HOST"), "The hostname or IP of the database host. Defaults to localhost.")
	// dbPort := flag.String("dbPort", os.Getenv("DB_PORT"), "The port the database is listening on. Defaults to 5432.")
	// dbUser := flag.String("dbUser", os.Getenv("POSTGRES_USER"), "The user the database should connect as. Defaults to postgres")
	// dbPassword := flag.String("dbPassword", os.Getenv("POSTGRES_PASSWORD"), "The password to use to login to the database. If not provided, the program will exit.")
	// dbName := flag.String("dbName", os.Getenv("POSTGRES_DB"), "The name of the database that should be connected to. Defaults to types.")
	// ssl := flag.Bool("prod", false, "A flag to specify whether or not to use ssl. If no specific port is provided, port is automatically set to 443")
	// goSrcDir := flag.String("goSrc", os.Getenv("SRC_DIR"), "The directory of the go files to be parsed for the standard library.")
	// port := flag.String("port", os.Getenv("PORT"), "Used to override what port the web server listens on")
	// dev := flag.Bool("dev", false, "If the dev flag is passed, the server will listen on port 8080.")
	// flag.Parse()

	db, err := sqlite.InitializeDB()
	if err != nil {
		log.Fatal("error when attempting to initialize database: %s", err.Error())
	}
	// store := store.New()

	// count, err := postgres.GetCustomTypeCount()
	// if err != nil {
	// 	panic(fmt.Sprintf("error when getting count of custom types from the database: %s", err.Error()))
	// }
	// if count == 0 {
	// 	if *goSrcDir == "" {
	// 		log.Println("goSrcDir is empty, defaulting to /usr/local/go/src")
	// 		*goSrcDir = "/usr/local/go/src"
	// 	}
	// 	log.Println("Database is empty, populating with standard library from path: ", *goSrcDir)
	// 	p := parser.New()
	// 	p.ParseDir(*goSrcDir)
	// 	err := store.InsertParsedProject(p)
	// 	if err != nil {
	// 		panic(err)
	// 	}
	// }

	// templates, err := server.ParseTemplates(templateDir)
	// if err != nil {
	// 	panic(fmt.Sprintf("unable to parse templates: %s", err.Error()))
	// }

	// s := server.New(store, templates, staticDir)

	// if *ssl {
	// 	log.Fatal(http.ListenAndServeTLS(":443", *certFile, *keyFile, s))
	// } else if *dev {
	// 	log.Fatal(http.ListenAndServe(":8080", s))
	// } else {
	// 	if *port != "" {
	// 		log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", *port), s))
	// 	}
	// 	log.Fatal(http.ListenAndServe(":80", s))
	// }
}
