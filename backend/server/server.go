package server

import (
	"log"
	"net/http"

	"github.com/smanierre/typer-site/store"
)

// Server uses the DefaultServeMux and provides a store for endpoints to access
type Server struct {
	*http.ServeMux
	TypeStore store.TypeStore
}

var typeStore store.TypeStore

// NewServer returns a server initialized with a TypeStore and using the DefaultServeMux
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
	fs := http.FileServer(http.Dir("./static"))
	http.Handle("/", fs)
	for k, v := range endpoints {
		log.Printf("Registering endpoint /api%s\n", k)
		http.Handle("/api"+k, http.HandlerFunc(v))
	}
}

func allowCorsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		next.ServeHTTP(w, r)
	})
}
