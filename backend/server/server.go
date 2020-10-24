package server

import (
	"log"
	"net/http"
	"strings"

	"gitlab.com/sean.manierre/typer-site/store"
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
	for k, v := range endpoints {
		log.Printf("Registering endpoint /api%s\n", k)
		http.Handle("/api"+k, http.HandlerFunc(v))
	}
	http.Handle("/", http.HandlerFunc(getRoot))
}

//getRoot handles serving the files for the React SPA frontend and redirects and non-api calls to the home page so the app can load.
func getRoot(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" && !strings.Contains(r.URL.Path, "/static") && r.URL.Path != "/logo.svg" {
		http.Redirect(w, r, "/", http.StatusFound)
		return
	}
	fs := http.FileServer(http.Dir("static"))
	fs.ServeHTTP(w, r)
}

//AllowCorsMiddleware allows CORS requests from any source for development purposes only.
func AllowCorsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		next.ServeHTTP(w, r)
	})
}
