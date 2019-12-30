package main

import (
	"log"
	"net/http"
	"os"

	"github.com/smanierre/typer-site/server"
	"github.com/smanierre/typer-site/store"
	db "github.com/smanierre/typer-site/store/postgres"
	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load()
  	if err != nil {
    	log.Fatal("Error loading .env file")
  	}
	db.InitDB()
	store, err := store.NewStore()
	if err != nil {
		log.Fatal(err)
	}
	s := server.NewServer(store)
	s.Handle("/", http.FileServer(http.Dir(os.Getenv("PUBLIC_DIR"))))
	log.Fatal(http.ListenAndServe(os.Getenv("PUBLIC_DIR"), s))
}
