package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"

	db "gitlab.com/sean.manierre/typer-site/postgres"
)

var endpoints = map[string]func(http.ResponseWriter, *http.Request){
	"/interface":     getAllInterfaces,
	"/interface/":    getSingleInterface,
	"/type":          getAllTypes,
	"/type/":         getSingleTypeByID,
	"/implementers/": getImplementingTypes,
	"/implementees/": getImplementedInterfaces,
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
		//Going to assume they are searching by name
		getInterfacesByName(w, r)
		return
	}
	i := typeStore.GetInterfaceByID(id)
	if i.CT.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(i)
}

func getInterfacesByName(w http.ResponseWriter, r *http.Request) {
	interfaceQuery := r.URL.Path[strings.Index(r.URL.Path, "/interface/")+11:]
	interfaces := typeStore.GetInterfacesByName(interfaceQuery)
	if len(interfaces) == 0 {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(interfaces)
}

func getAllTypes(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	log.Printf("Handling get request at %s from %s\n", r.URL.Path, r.RemoteAddr)
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typeStore.GetConcreteTypes())
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
	typ := typeStore.GetConcreteTypeByID(id)
	if typ.CT.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(typ)
}

func getTypesByName(w http.ResponseWriter, r *http.Request) {
	typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/type/")+6:]
	types := typeStore.GetConcreteTypesByName(typeQuery)
	if len(types) == 0 {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	w.Header().Set("content-type", "application/json")
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
	inter := typeStore.GetInterfaceByID(interfaceID)
	typeList := []db.CustomTypeRecord{}
	for _, v := range typeStore.GetImplementingIDs(interfaceID) {
		typeList = append(typeList, typeStore.GetConcreteTypeByID(v))
	}

	returnJSON := struct {
		Interface    db.CustomTypeRecord   `json:"interface"`
		Implementers []db.CustomTypeRecord `json:"implementers"`
	}{
		Interface:    inter,
		Implementers: typeList,
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(returnJSON)
}

func getImplementedInterfaces(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}
	typeIDQuery := r.URL.Path[strings.Index(r.URL.Path, "/implementees/")+14:]
	typeID, err := strconv.Atoi(typeIDQuery)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	concreteType := typeStore.GetConcreteTypeByID(typeID)
	interfaceList := []db.CustomTypeRecord{}
	for _, v := range typeStore.GetImplementeeIDs(typeID) {
		interfaceList = append(interfaceList, typeStore.GetInterfaceByID(v))
	}
	returnJSON := struct {
		Type         db.CustomTypeRecord   `json:"type"`
		Implementees []db.CustomTypeRecord `json:"implementees"`
	}{
		Type:         concreteType,
		Implementees: interfaceList,
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(returnJSON)
}
