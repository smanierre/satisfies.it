package server

import (
	"log"
	"net/http"
	"os"
	"sort"
	"strconv"
	"strings"

	"gitlab.com/sean.manierre/typer-site/store"
)

var BASE_URL = os.Getenv("BASE_URL")

var pages = map[string]http.Handler{
	"/":           http.HandlerFunc(getIndexPage),
	"/types":      http.HandlerFunc(getTypesFromQuery),
	"/static/":    nil, //Handled in server.go
	"/interface/": http.HandlerFunc(getInterfaceByID),
	"/concrete/":  http.HandlerFunc(getConcreteTypeByID),
	// "/parse":         postProjectParse,
}

type headerTemplateData struct {
	HomeURL string
}

type indexPageData struct {
	headerTemplateData
}

func getIndexPage(w http.ResponseWriter, r *http.Request) {
	data := indexPageData{headerTemplateData: headerTemplateData{HomeURL: BASE_URL}}
	templates.ExecuteTemplate(w, "index.gohtml", data)
}

type resultsPageData struct {
	headerTemplateData
	Results     resultList
	ResultQuery string
}

//This is only being created for the purpose of implementing sort.Interface for sorting the list before rendering it out.
type resultList []result

func (rl resultList) Len() int           { return len(rl) }
func (rl resultList) Swap(i, j int)      { rl[i], rl[j] = rl[j], rl[i] }
func (rl resultList) Less(i, j int) bool { return rl[i].Name[0] < rl[j].Name[0] }

type result struct {
	ID       int64
	Package  string
	Name     string
	Pointer  bool
	BaseType string
}

func getTypesFromQuery(w http.ResponseWriter, r *http.Request) {
	data := resultsPageData{
		headerTemplateData: headerTemplateData{HomeURL: BASE_URL},
		Results:            []result{},
	}
	if r.Method != http.MethodPost {
		w.WriteHeader(http.StatusMethodNotAllowed)
		templates.ExecuteTemplate(w, "na.gohtml", data.headerTemplateData)
		return
	}
	r.ParseForm()
	query := r.Form.Get("typeQuery")
	data.ResultQuery = query
	if query == "" {
		concreteTypes, err := typeStore.GetConcreteTypes()
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			log.Printf("error when getting all concrete types from store: %s", err.Error())
			return
		}
		for _, ct := range concreteTypes {
			data.Results = append(data.Results, result{
				ID:       ct.ID,
				Package:  ct.Package,
				Name:     ct.Name,
				Pointer:  ct.Pointer,
				BaseType: ct.BaseType,
			})
		}
		interfaces, err := typeStore.GetInterfaces()
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			log.Printf("error when getting all interfaces from store: %s", err.Error())
			return
		}
		for _, i := range interfaces {
			data.Results = append(data.Results, result{
				ID:       i.ID,
				Package:  i.Package,
				Name:     i.Name,
				Pointer:  false,
				BaseType: "interface",
			})
		}
	} else {
		concreteTypes, err := typeStore.GetConcreteTypesByName(query)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			log.Printf("error when getting concrete types by name from store: %s", err.Error())
			return
		}
		for _, ct := range concreteTypes {
			data.Results = append(data.Results, result{
				ID:       ct.ID,
				Package:  ct.Package,
				Name:     ct.Name,
				Pointer:  ct.Pointer,
				BaseType: ct.BaseType,
			})
		}
		interfaces, err := typeStore.GetInterfacesByName(query)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			log.Printf("error when getting interfaces by name from store: %s", err.Error())
			return
		}
		for _, i := range interfaces {
			data.Results = append(data.Results, result{
				ID:       i.ID,
				Package:  i.Package,
				Name:     i.Name,
				Pointer:  false,
				BaseType: "interface",
			})
		}
	}
	sort.Sort(data.Results)
	templates.ExecuteTemplate(w, "results.gohtml", data)
}

type interfaceData struct {
	headerTemplateData
	Interface    store.Interface
	Implementers []store.ConcreteType
}

func getInterfaceByID(w http.ResponseWriter, r *http.Request) {
	data := interfaceData{
		headerTemplateData: headerTemplateData{HomeURL: BASE_URL},
		Interface:          store.Interface{},
		Implementers:       []store.ConcreteType{},
	}
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		templates.ExecuteTemplate(w, "na.gohtml", data.headerTemplateData)
		return
	}
	idString := r.URL.Path[strings.Index(r.URL.Path, "/interface/")+11:]
	id, err := strconv.Atoi(idString)
	if err != nil {
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	iface, err := typeStore.GetInterfaceByID(int64(id))
	if err != nil {
		if strings.Contains(err.Error(), "no rows in result set") {
			w.WriteHeader(http.StatusNotFound)
			templates.ExecuteTemplate(w, "nf.gohtml", data.headerTemplateData)
			return
		}
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	data.Interface = iface
	implementingIDs, err := typeStore.GetImplementingIDs(int64(id))
	if err != nil {
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	concreteTypes := []store.ConcreteType{}
	for _, id := range implementingIDs {
		ct, err := typeStore.GetConcreteTypeByID(id)
		if err != nil {
			log.Println(err.Error())
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			return
		}
		concreteTypes = append(concreteTypes, ct)
	}
	data.Implementers = concreteTypes
	templates.ExecuteTemplate(w, "interface.gohtml", data)
}

type concreteData struct {
	headerTemplateData
	ConcreteType store.ConcreteType
	Implementees []store.Interface
}

func getConcreteTypeByID(w http.ResponseWriter, r *http.Request) {
	data := concreteData{
		headerTemplateData: headerTemplateData{HomeURL: BASE_URL},
		ConcreteType:       store.ConcreteType{},
		Implementees:       []store.Interface{},
	}
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		templates.ExecuteTemplate(w, "na.gohtml", data.headerTemplateData)
		return
	}
	idString := r.URL.Path[strings.Index(r.URL.Path, "/concrete/")+10:]
	id, err := strconv.Atoi(idString)
	if err != nil {
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	ct, err := typeStore.GetConcreteTypeByID(int64(id))
	if err != nil {
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	data.ConcreteType = ct
	ids, err := typeStore.GetImplementeeIDs(int64(id))
	if err != nil {
		log.Println(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
		return
	}
	for _, i := range ids {
		inter, err := typeStore.GetInterfaceByID(i)
		if err != nil {
			log.Println(err.Error())
			w.WriteHeader(http.StatusInternalServerError)
			templates.ExecuteTemplate(w, "ise.gohtml", data.headerTemplateData)
			return
		}
		data.Implementees = append(data.Implementees, inter)
	}
	templates.ExecuteTemplate(w, "concrete.gohtml", data)
}

// func postProjectParse(w http.ResponseWriter, r *http.Request) {
// 	if r.Method != http.MethodPost {
// 		w.WriteHeader(http.StatusMethodNotAllowed)
// 		return
// 	}
// 	repoURL := r.URL.Query().Get("repo")
// 	tempdir := fmt.Sprintf("temp-%d", time.Now().UnixNano())
// 	log.Printf("Cloning repo from: %s into temp directory %s\n", repoURL, tempdir)
// 	os.Mkdir(tempdir, 0777)
// 	cloneCMD := exec.Command("git", "clone", repoURL, tempdir)
// 	cloneCMD.Stderr = os.Stderr
// 	err := cloneCMD.Start()
// 	time.Sleep(1 * time.Second)
// 	if err != nil {
// 		fmt.Fprintf(w, "Error when cloning repository from %s", repoURL)
// 		log.Printf("Error when cloning repository: %s\n", err)
// 		log.Printf("Removing temporary directory: %s\n", tempdir)
// 		os.RemoveAll(tempdir)
// 		return
// 	}
// 	w.WriteHeader(http.StatusOK)
// 	cloneCMD.Wait()
// 	p := parser.New()
// 	p.ParseDir(tempdir)
// 	err = typeStore.InsertParsedProject(p)
// 	if err != nil {
// 		log.Printf("error when inserting parsed project: %s\n", err.Error())
// 	}
// 	log.Printf("Removing temporary directory: %s\n", tempdir)
// 	os.RemoveAll(tempdir)
// }
