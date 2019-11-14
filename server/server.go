package server

import (
	"log"
	"net/http"

	"github.com/smanierre/typer-site/model"
)

type Server struct {
	*http.ServeMux
	TypeStore model.TypeStore
}

var typeStore model.TypeStore

func NewServer(store model.TypeStore) Server {
	s := Server{
		ServeMux:  http.DefaultServeMux,
		TypeStore: store,
	}
	s.registerEndpoints()
	return s
}

func (s Server) registerEndpoints() {
	typeStore = s.TypeStore
	for k, v := range endpoints {
		log.Printf("Registering endpoint /api%s\n", k)
		http.Handle("/api"+k, http.HandlerFunc(v))
	}
}
