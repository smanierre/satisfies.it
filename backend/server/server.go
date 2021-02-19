package server

import (
	"embed"
	"html/template"
	"io/fs"
	"log"
	"net/http"

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
			http.Handle(k, http.StripPrefix("/static/", http.FileServer(http.FS(staticFS))))
			continue
		}
		http.Handle(k, v)
	}
	return http.DefaultServeMux
}
