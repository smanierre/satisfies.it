package main

import (
	"log"
	"net/http"

	"github.com/smanierre/typer-site/store"
	"github.com/smanierre/typer-site/server"
)

func main() {
	s := server.NewServer(model.NewStore("./model/db.json"))
	s.Handle("/", http.FileServer(http.Dir("public")))
	log.Fatal(http.ListenAndServe(":8080", s))
}
