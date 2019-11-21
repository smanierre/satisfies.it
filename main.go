package main

import (
	"log"
	"net/http"

	"github.com/smanierre/typer-site/model"
	"github.com/smanierre/typer-site/server"
)

func main() {
	s := server.NewServer(model.NewTypeStore("./model/db.json"))
	s.Handle("/", http.FileServer(http.Dir("public")))
	log.Fatal(http.ListenAndServe(":8080", s))
}
