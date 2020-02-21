package main

import (
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"github.com/smanierre/typer-site/server"
	"github.com/smanierre/typer-site/store"
	"github.com/smanierre/typer-site/store/postgres"
)

func main() {
	godotenv.Load(".env")
	postgres.InitDB()
	store, err := store.NewStore()
	if err != nil {
		log.Fatalf("unable to create store: %s", err.Error())
	}
	s := server.NewServer(store)
	http.ListenAndServe(os.Getenv("LISTEN_PORT"), s.ServeMux)
}
