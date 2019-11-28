package server

import (
	"log"
	"net/http"

	"github.com/smanierre/typer-site/store"
)

type Server struct {
	*http.ServeMux
	TypeStore store.TypeStore
}

var typeStore store.TypeStore

func NewServer(store store.TypeStore) Server {
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
