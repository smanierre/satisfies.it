package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"gitlab.com/sean.manierre/typer-site/parser"
	"gitlab.com/sean.manierre/typer-site/postgres"
	"gitlab.com/sean.manierre/typer-site/server"
	"gitlab.com/sean.manierre/typer-site/store"
)

func main() {

	godotenv.Load()

	populate := flag.Bool("populate", false, "Set to true if running during build to create a json file to load in production")
	goSrc := flag.String("goSrc", "/usr/local/go/src", "This is the location of the root of the go files to parse e.g. /usr/local/go/src")
	dataFile := flag.String("dataFile", "types.json", "The datafile to be loaded if overwriteDb is also true. Optional.")
	certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	port := flag.Int("port", 443, "Port for the web server to listen on, defaults to 443.")
	dbHost := flag.String("dbHost", os.Getenv("DB_HOST"), "The hostname or IP of the database host. Defaults to localhost.")
	dbPort := flag.String("dbPort", os.Getenv("DB_PORT"), "The port the database is listening on. Defaults to 5432.")
	dbUser := flag.String("dbUser", os.Getenv("DB_USER"), "The user the database should connect as. Defaults to postgres")
	dbPassword := flag.String("dbPassword", os.Getenv("DB_PASSWORD"), "The password to use to login to the database. If not provided, the program will exit.")
	dbName := flag.String("dbName", os.Getenv("DB_NAME"), "The name of the database that should be connected to. Defaults to types.")
	overwriteDb := flag.Bool("overwriteDb", false, "A boolean flag to specify whether or not the current database should be overwritten with the new data.")
	prod := flag.Bool("prod", false, "A flag to specify whether or not this is production. Affects usage of ssl.")
	flag.Parse()

	if *populate {
		err := parser.ParseAndExportDirectory(*goSrc)
		if err != nil {
			log.Fatalf("error when parsing given directory: %s\n", err.Error())
		}
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

	_, err := postgres.InitDB(*dbHost, *dbPort, *dbUser, *dbPassword, *dbName, *dataFile, *overwriteDb)
	if err != nil {
		log.Fatalln(err)
	}
	store, err := store.NewStore()
	if err != nil {
		log.Fatalf("unable to create store: %s", err.Error())
	}
	s := server.NewServer(store)
	if *prod {
		log.Fatal(http.ListenAndServeTLS(fmt.Sprintf(":%d", *port), *certFile, *keyFile, s.ServeMux))
	} else {
		log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", *port), server.AllowCorsMiddleware(s.ServeMux)))
	}
}
