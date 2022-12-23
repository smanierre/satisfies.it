package main

import (
	"embed"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"

	"gitlab.com/sean.manierre/typer-site/parser"
	"gitlab.com/sean.manierre/typer-site/server"
	"gitlab.com/sean.manierre/typer-site/sqlite"
	"gitlab.com/sean.manierre/typer-site/store"
	_ "modernc.org/sqlite"
)

//go:embed templates/*
var templateDir embed.FS

//go:embed static
var staticDir embed.FS

func main() {
	certFile := flag.String("certFile", "cert.pem", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	keyFile := flag.String("keyFile", "key.pem", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	ssl := flag.Bool("prod", false, "A flag to specify whether or not to use ssl. If no specific port is provided, port is automatically set to 443")
	goDir := flag.String("goDir", "/usr/local/go/src", "Used to override the default directory where the go standard library is parsed from. Docker documentation for the container tells user to mount to '/data'")
	dev := flag.Bool("dev", false, "Used to override the base url when developing")
	flag.Parse()

	db, err := sqlite.InitializeDB()
	if err != nil {
		log.Fatalf("error when attempting to initialize database: %s", err.Error())
	}
	store := store.New(db)

	count, err := db.GetCustomTypeCount()
	if err != nil {
		panic(fmt.Sprintf("error when getting count of custom types from the database: %s", err.Error()))
	}
	if count == 0 {
		log.Println("Database is empty, populating with standard library from path: ", *goDir)
		p := parser.New()
		err := p.ParseDir(*goDir)
		if err != nil {
			log.Fatalf("error when attempting to parse directory: %s", err.Error())
		}
		err = store.InsertParsedProject(p)
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
		if *dev {
			if os.Getenv("BASE_URL") == "" {
				server.BASE_URL = "http://localhost:8080"
			}
			http.ListenAndServe(":8080", s)
		} else {
			log.Fatal(http.ListenAndServe(":80", s))
		}
	}
}
