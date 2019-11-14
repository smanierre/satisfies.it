package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/smanierre/typer-site/util"

	"github.com/smanierre/typer"
)

var endpoints map[string]func(http.ResponseWriter, *http.Request) = map[string]func(http.ResponseWriter, *http.Request){
	"/types":  handleRoot,
	"/types/": handleSpecificType,
}

func handleRoot(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		log.Println("Handling get request at /api/types from " + r.RemoteAddr)
		w.Header().Set("content-type", "application/json")
		json.NewEncoder(w).Encode(typeStore.GetAllTypes())
		return
	}

	if r.Method == http.MethodPost {
		err := r.ParseMultipartForm(1024 << 12)
		if err != nil {
			log.Println("Error parsing multipart form: " + err.Error())
			return
		}
		t := typer.NewTyper()
		for _, v := range r.MultipartForm.File["files"] {
			file, err := v.Open()
			if err != nil {
				log.Println("Error opening file.")
				continue
			}
			err = t.Parse(file)
			if err != nil {
				log.Println("Error parsing file: " + err.Error())
			}
		}
		t.ResolveMethods()
		records, err := util.ConvertToTypeRecord(t.GetTypes(), typeStore)
		if err != nil {
			log.Printf("Unable to convert type to record: %s\n", err.Error())
		}
		json.NewEncoder(w).Encode(typeStore.StoreTypes(records))
		return
	}
	w.WriteHeader(http.StatusMethodNotAllowed)
}

func handleSpecificType(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/types/")+7:]
		id, err := strconv.Atoi(typeQuery)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			return
		}
		w.Header().Set("content-type", "application/json")
		t := typeStore.GetType(id)
		if t.Package == "" {
			w.WriteHeader(http.StatusNotFound)
			return
		}
		json.NewEncoder(w).Encode(t)
		return
	}
	if r.Method == http.MethodDelete {
		typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/types/")+7:]
		id, err := strconv.Atoi(typeQuery)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			return
		}
		if typeStore.RemoveType(id) {
			w.WriteHeader(http.StatusNoContent)
			return
		}
		w.WriteHeader(http.StatusNotFound)
		return
	}
	w.WriteHeader(http.StatusMethodNotAllowed)
}
