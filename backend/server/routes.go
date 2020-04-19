package server

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/smanierre/typer-site/model"
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
	}
	w.Header().Set("content-type", "application/json")
	i := typeStore.GetInterfaceByID(id)
	if i.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(i)
}

func getInterfacesByName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("content-type", "application/json")
	interfaceQuery := r.URL.Path[strings.Index(r.URL.Path, "/interface/")+11:]
	dot := strings.Index(interfaceQuery, ".")
	if dot != -1 {
		interfaceQuery = interfaceQuery[dot+1:]
	}
	interfaces := typeStore.GetInterfacesByName(interfaceQuery)
	if len(interfaces) == 0 {
		w.WriteHeader(http.StatusNotFound)
		return
	}
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
	w.Header().Set("content-type", "application/json")
	typ := typeStore.GetConcreteTypeByID(id)
	if typ.Package == "" {
		w.WriteHeader(http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(typ)
}

func getTypesByName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("content-type", "application/json")
	typeQuery := r.URL.Path[strings.Index(r.URL.Path, "/type/")+6:]
	dot := strings.Index(typeQuery, ".")
	if dot != -1 {
		typeQuery = typeQuery[dot+1:]
	}
	types := typeStore.GetConcreteTypesByName(typeQuery)
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
	inter := typeStore.GetInterfaceByID(interfaceID)
	typeList := []model.ConcreteTypeRecord{}
	for _, v := range typeStore.GetImplementingIDs(interfaceID) {
		for _, t := range typeStore.GetConcreteTypes() {
			if t.ID == v {
				typeList = append(typeList, t)
				continue
			}
		}
	}
	returnJSON := struct {
		Interface    model.InterfaceRecord
		Implementers []model.ConcreteTypeRecord
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
	interfaceList := []model.InterfaceRecord{}
	for _, v := range typeStore.GetImplementeeIDs(typeID) {
		for _, i := range typeStore.GetInterfaces() {
			if i.ID == v {
				interfaceList = append(interfaceList, i)
				continue
			}
		}
	}
	returnJSON := struct {
		Type         model.ConcreteTypeRecord
		Implementees []model.InterfaceRecord
	}{
		Type:         concreteType,
		Implementees: interfaceList,
	}
	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(returnJSON)
}
