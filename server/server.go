package server

import (
	"embed"
	"html/template"
	"io/fs"
	"log"
	"net/http"
	"strings"

	"gitlab.com/sean.manierre/typer-site/store"
)

// Server uses the DefaultServeMux and provides a store for endpoints to access

var typeStore store.TypeStore
var templates *template.Template
var staticDir embed.FS

// New returns a server initialized with a TypeStore and using the DefaultServeMux
func New(store store.TypeStore, ts *template.Template, static embed.FS) *http.ServeMux {
	typeStore = store
	templates = ts
	staticDir = static

	for k, v := range pages {
		log.Printf("Registering endpoint %s\n", k)
		//I have to do it this way for some reason. If I try to get a subFS anywhere else I get a nil pointer error.
		if k == "/static/" {
			staticFS, err := fs.Sub(staticDir, "static")
			if err != nil {
				panic(err)
			}
			http.Handle(k, loggingMiddleware(http.StripPrefix("/static/", http.FileServer(http.FS(staticFS)))))
			continue
		}
		http.Handle(k, loggingMiddleware(v))
	}
	return http.DefaultServeMux
}

func loggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if !filterLoggingRequests(r.URL.Path) {
			log.Printf("Handling request from: %s at path: %s\n", r.RemoteAddr, r.URL.Path)
		}
		next.ServeHTTP(w, r)
	})
}

func filterLoggingRequests(url string) bool {
	excludedTypes := []string{".js", ".css", ".svg", ".png"}
	for _, t := range excludedTypes {
		if strings.Contains(url, t) {
			return true
		}
	}
	return false
}
