package main

import (
	"embed"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/joho/godotenv"
	"gitlab.com/sean.manierre/typer-site/parser"
	"gitlab.com/sean.manierre/typer-site/postgres"
	"gitlab.com/sean.manierre/typer-site/server"
	"gitlab.com/sean.manierre/typer-site/store"
)

//go:embed templates/*
var templateDir embed.FS

//go:embed static
var staticDir embed.FS

//go:embed create_database.psql
var createDBScript string

func main() {
	godotenv.Load()
	certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	dbHost := flag.String("dbHost", os.Getenv("DB_HOST"), "The hostname or IP of the database host. Defaults to localhost.")
	dbPort := flag.String("dbPort", os.Getenv("DB_PORT"), "The port the database is listening on. Defaults to 5432.")
	dbUser := flag.String("dbUser", os.Getenv("POSTGRES_USER"), "The user the database should connect as. Defaults to postgres")
	dbPassword := flag.String("dbPassword", os.Getenv("POSTGRES_PASSWORD"), "The password to use to login to the database. If not provided, the program will exit.")
	dbName := flag.String("dbName", os.Getenv("POSTGRES_DB"), "The name of the database that should be connected to. Defaults to types.")
	ssl := flag.Bool("prod", false, "A flag to specify whether or not to use ssl. If no specific port is provided, port is automatically set to 443")
	goSrcDir := flag.String("goSrc", os.Getenv("SRC_DIR"), "The directory of the go files to be parsed for the standard library.")
	flag.Parse()

	attempts := 1
	for {
		log.Println("Attempting to connect to db. Attempt #" + fmt.Sprint(attempts))
		err := postgres.Connect(*dbHost, *dbPort, *dbUser, *dbPassword, *dbName)
		//This is the first time the container is being created, so the structure needs to be created.
		if err != nil && strings.Contains(err.Error(), "database \"types\" does not exist") {
			err = postgres.CreateStructure(*dbHost, *dbPort, *dbUser, *dbPassword, createDBScript)
			if err != nil {
				panic(err.Error())
			}
			err = postgres.Connect(*dbHost, *dbPort, *dbUser, *dbPassword, *dbName)
		}
		if err == nil {
			err = postgres.CheckDBStructure()
			if err == nil {
				break
			}
			panic(fmt.Sprintf("error when checking the structure of the database: %s", err.Error()))
		}
		// If the db container is being created at the same time as the application container
		// it takes longer to start up. If the error is the connection being refused, the app
		// will wait one second then retry. After 5 attempts something else is probably wrong
		// so the app will exit instead.
		if !strings.Contains(err.Error(), "connection refused") {
			log.Fatalln(err)
		}
		if attempts >= 5 {
			log.Fatalln(err)
		}
		attempts++
		time.Sleep(time.Duration(1 * time.Second))
	}
	log.Println("*****Successfully connected to the database*****")

	store := store.New()

	count, err := postgres.GetCustomTypeCount()
	if err != nil {
		panic(fmt.Sprintf("error when getting count of custom types from the database: %s", err.Error()))
	}
	if count == 0 {
		log.Println("Database is empty, populating with standard library")
		p := parser.New()
		p.ParseDir(*goSrcDir)
		err := store.InsertParsedProject(p)
		if err != nil {
			panic(err)
		}
	}

	templates, err := server.ParseTemplates(templateDir)
	if err != nil {
		panic(fmt.Sprintf("unable to parse templates: %s", err.Error()))
	}

	s := server.New(store, templates, staticDir)

	if *ssl {
		log.Fatal(http.ListenAndServeTLS(":443", *certFile, *keyFile, s))
	} else {
		log.Fatal(http.ListenAndServe(":8080", s))
	}
}
