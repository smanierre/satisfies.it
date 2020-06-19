package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"runtime"

	"github.com/joho/godotenv"
	"gitlab.com/sean.manierre/typer-site/parser"
	"gitlab.com/sean.manierre/typer-site/postgres"
)

func main() {

	godotenv.Load()

	populate := flag.Bool("populate", false, "Set to true if running during build to create a json file to load in production")
	goSrc := flag.String("goSrc", "/usr/local/go/src", "This is the location of the root of the go files to parse e.g. /usr/local/go/src")
	dataFile := flag.String("dataFile", "", "The datafile to be loaded if overwriteDb is also true. Optional.")
	// certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	// keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	// port := flag.Int("port", 443, "Port for the web server to listen on, defaults to 443.")
	dbHost := flag.String("dbHost", os.Getenv("DB_HOST"), "The hostname or IP of the database host. Defaults to localhost.")
	dbPort := flag.String("dbPort", os.Getenv("DB_PORT"), "The port the database is listening on. Defaults to 5432.")
	dbUser := flag.String("dbUser", os.Getenv("DB_USER"), "The user the database should connect as. Defaults to postgres")
	dbPassword := flag.String("dbPassword", os.Getenv("DB_PASSWORD"), "The password to use to login to the database. If not provided, the program will exit.")
	dbName := flag.String("dbName", os.Getenv("DB_NAME"), "The name of the database that should be connected to. Defaults to types.")
	overwriteDb := flag.Bool("overwriteDb", false, "A boolean flag to specify whether or not the current database should be overwritten with the new data.")

	flag.Parse()

	if *populate {
		parser.ParseAndExportDirectory(*goSrc)
		os.Exit(0)
	}

	//If overwrite is specified, ensure there is a jsonFile also present to be loaded in and can be opened.
	if *overwriteDb {
		file, err := os.Open(*dataFile)
		if err != nil {
			log.Fatalf("Please provide a valid data file if you wish to overwrite the database: %s\n", err.Error())
		}
		file.Close()
	}

	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		*dbHost, *dbPort, *dbUser, *dbPassword, *dbName)
	_, err := postgres.InitDB(psqlInfo, *dataFile, *overwriteDb)
	if err != nil {
		log.Fatalln(err)
	}
	os.Exit(0)
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
	err = parser.ParseAndExportDirectory(filePath)
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
