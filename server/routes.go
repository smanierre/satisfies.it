package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/smanierre/typer-site/store/types"
)

var endpoints = map[string]func(http.ResponseWriter, *http.Request){
	"/interface":     getAllInterfaces,
	"/interface/":    getSingleInterface,
	"/type":          getAllTypes,
	"/type/":         getSingleTypeByID,
	"/implementers/": getImplementingTypes,
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

func getAllTypes(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typeStore.GetTypes())
}

func getSingleTypeByID(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/type/")+6:]
	id, err := strconv.Atoi(typeQuery)
	if err != nil {
		//Going to assume they passed in a name to search for
		getTypesByName(w, r)
	}
	w.Header().Set("content-type", "application/json")
	typ := typeStore.GetTypeByID(id)
	if typ.Package == "" {
		return
	}
	json.NewEncoder(w).Encode(typ)
}

func getTypesByName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("content-type", "application/json")
	typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/type/")+6:]
	types := typeStore.GetTypesByName(typeQuery)
	if len(types) == 0 {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(types)
}

func getImplementingTypes(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	interfaceIDQuery := r.URL.Path[strings.Index(r.URL.Path, "/implementers/")+14:]
	interfaceID, err := strconv.Atoi(interfaceIDQuery)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	inter := typeStore.GetInterface(interfaceID)
	var typeList []types.ConcreteTypeRecord
	for _, v := range typeStore.GetImplementingIDs(interfaceID) {
		for _, t := range typeStore.GetTypes() {
			if t.ID == v {
				typeList = append(typeList, t)
				continue
			}
		}
	}
	returnJSON := struct {
		Interface    types.InterfaceRecord
		Implementers []types.ConcreteTypeRecord
	}{
		Interface:    inter,
		Implementers: typeList,
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(returnJSON)
}
