package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"
)

var endpoints = map[string]func(http.ResponseWriter, *http.Request){
	"/interface":  handleInterfaceRoot,
	"/interface/": handleSingleInterface,
}

func handleInterfaceRoot(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		getAllInterfaces(w, r)
		return
	}
	if r.Method == http.MethodPost {
		// Stubbed for now but will implement later
		return
	}
	w.WriteHeader(http.StatusMethodNotAllowed)
}

func handleSingleInterface(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		getSingleInterface(w, r)
		return
	}
	w.WriteHeader(http.StatusMethodNotAllowed)
}

func getAllInterfaces(w http.ResponseWriter, r *http.Request) {
	log.Println("Handling get request at /api/interface from " + r.RemoteAddr)
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typeStore.GetInterfaces())
}

func getSingleInterface(w http.ResponseWriter, r *http.Request) {
	interfaceQuery := r.URL.Path[strings.Index(r.URL.Path, "/interface/")+7:]
	id, err := strconv.Atoi(interfaceQuery)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	w.Header().Set("content-type", "application/json")
	i := typeStore.GetInterface(id)
	if i.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(i)
}
