package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"
)

var endpoints = map[string]func(http.ResponseWriter, *http.Request){
	"/interface":  getAllInterfaces,
	"/interface/": getSingleInterface,
	"/struct":     getAllStructs,
	"/struct/":    getSingleStruct,
}

func getAllInterfaces(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typeStore.GetInterfaces())
}

func getSingleInterface(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	interfaceQuery := r.URL.Path[strings.Index(r.URL.Path, "/interface/")+11:]
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

func getAllStructs(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typeStore.GetStructs())
}

func getSingleStruct(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	structQuery := r.URL.Path[strings.Index(r.URL.Path, "/struct/")+8:]
	id, err := strconv.Atoi(structQuery)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	w.Header().Set("content-type", "application/json")
	str := typeStore.GetStruct(id)
	if str.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(str)
}
