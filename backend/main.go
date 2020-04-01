package main

import (
	// "log"
	// "net/http"
	// "os"

	// "github.com/joho/godotenv"
	// "github.com/smanierre/typer-site/server"
	// "github.com/smanierre/typer-site/store"
	"github.com/smanierre/typer-site/store/postgres"
)

func main() {
	//Uncomment this to create populated db dump for new version on development system.
	postgres.DEVELOPMENT_PopulateDatabaseAndExport()

	// //Main applicaiton
	// godotenv.Load(".env")
	// postgres.LoadDB()
	// store, err := store.NewStore()
	// if err != nil {
	// 	log.Fatalf("unable to create store: %s", err.Error())
	// }
	// s := server.NewServer(store)
	// log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_PORT"), s.ServeMux))
}
