package main

import (
	"github.com/smanierre/typer-site/typeparser"
)

func main() {
	typeparser.ExtractInterfaces("./store/typestore.go")
	// err := godotenv.Load()
	// if err != nil {
	// 	log.Fatal("Error loading .env file", err)
	// }
	// db.InitDB()
	// store, err := store.NewStore()
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// s := server.NewServer(store)
	// s.Handle("/", http.FileServer(http.Dir(os.Getenv("PUBLIC_DIR"))))
	// log.Fatal(http.ListenAndServe(os.Getenv("PUBLIC_DIR"), s))
}
