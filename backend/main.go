package main

import (
	"flag"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"github.com/smanierre/typer-site/server"
	"github.com/smanierre/typer-site/store"
	"github.com/smanierre/typer-site/store/postgres"
)

func main() {
	populate := flag.Bool("populate", false, "Set to true if running during build to create a populated database to load in production")
	envfile := flag.String("envfile", ".env", "env file to use for application")
	flag.Parse()
	godotenv.Load(*envfile)
	postgres.InitDB()
	if *populate {
		postgres.DEVELOPMENT_PopulateDatabaseAndExport()
	} else {
		postgres.LoadDB()
		store, err := store.NewStore()
		if err != nil {
			log.Fatalf("unable to create store: %s", err.Error())
		}
		s := server.NewServer(store)
		log.Fatal(http.ListenAndServeTLS(os.Getenv("LISTEN_PORT"), os.Getenv("CERT_FILE"), os.Getenv("PRIVATE_KEY"), s.ServeMux))
	}
}
