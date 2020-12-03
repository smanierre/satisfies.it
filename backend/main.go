package main

import (
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

func main() {

	godotenv.Load()

	populate := flag.Bool("populate", false, "Set to true if running during build to create a json file to load in production")
	goSrc := flag.String("goSrc", "/usr/local/go/src", "This is the location of the root of the go files to parse e.g. /usr/local/go/src")
	dataFile := flag.String("dataFile", "types.json", "The datafile to be loaded if overwriteDb is also true. Optional.")
	certFile := flag.String("certFile", ".", "The location of the certificate file to be used for the web server. Defaults to the current directory.")
	keyFile := flag.String("keyFile", ".", "The location of the private key file to be used for the web server. Defaults to the current directory.")
	port := flag.Int("port", 80, "Port for the web server to listen on, defaults to 80.")
	dbHost := flag.String("dbHost", os.Getenv("DB_HOST"), "The hostname or IP of the database host. Defaults to localhost.")
	dbPort := flag.String("dbPort", os.Getenv("DB_PORT"), "The port the database is listening on. Defaults to 5432.")
	dbUser := flag.String("dbUser", os.Getenv("DB_USER"), "The user the database should connect as. Defaults to postgres")
	dbPassword := flag.String("dbPassword", os.Getenv("DB_PASSWORD"), "The password to use to login to the database. If not provided, the program will exit.")
	dbName := flag.String("dbName", os.Getenv("DB_NAME"), "The name of the database that should be connected to. Defaults to types.")
	ssl := flag.Bool("prod", false, "A flag to specify whether or not to use ssl. If no specific port is provided, port is automatically set to 443")
	dev := flag.Bool("dev", false, "A flag to specify whether or not this is development. If it is, it applies the middleware to allow CORS.")
	flag.Parse()

	if *populate {
		err := parser.ParseAndExportDirectory(*goSrc)
		if err != nil {
			log.Fatalf("error when parsing given directory: %s\n", err.Error())
		}
		os.Exit(0)
	}

	attempts := 1
	for {
		log.Println("Attempting to connect to db. Try #:" + fmt.Sprint(attempts))
		_, err := postgres.InitDB(*dbHost, *dbPort, *dbUser, *dbPassword, *dbName, *dataFile)
		if err == nil {
			break
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

	store, err := store.New()
	if err != nil {
		log.Fatalf("unable to create store: %s\n", err.Error())
	}
	s := server.New(store)

	if *dev {
		log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", *port), server.AllowCorsMiddleware(s.ServeMux)))
	}
	if *ssl {
		if *port == 80 {
			*port = 443
		}
		log.Fatal(http.ListenAndServeTLS(fmt.Sprintf(":%d", *port), *certFile, *keyFile, s.ServeMux))
	} else {
		log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", *port), s.ServeMux))
	}
}
