package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/smanierre/typer-site/server"
	"github.com/smanierre/typer-site/store"
	db "github.com/smanierre/typer-site/store/postgres"
	"github.com/spf13/viper"
)

func main() {
	viper.SetDefault("db_host", "localhost")
	viper.SetDefault("db_port", "5432")
	viper.SetDefault("db_user", "postgres")
	viper.SetDefault("db_password", "testpass")
	viper.SetDefault("db_name", "types")
	viper.SetDefault("public_dir", "./public")
	viper.SetDefault("listen_port", ":8080")

	viper.SetConfigName("environment")
	viper.AddConfigPath(".")
	if err := viper.ReadInConfig(); err != nil {
		if _, ok := err.(viper.ConfigFileNotFoundError); ok {
			log.Println("Configuration file not found, using default values.")
		} else {
			panic(err)
		}
	}
	db.InitDB()
	store, err := store.NewStore()
	if err != nil {
		log.Fatal(err)
	}
	s := server.NewServer(store)
	publicDirString, ok := viper.Get("public_dir").(string)
	if !ok {
		panic(fmt.Sprintln("Unable to retrieve public directory from viper"))
	}
	s.Handle("/", http.FileServer(http.Dir(publicDirString)))
	portString, ok := viper.Get("listen_port").(string)
	if !ok {
		panic(fmt.Sprintln("Unable to retrieve listening port from viper"))
	}
	log.Fatal(http.ListenAndServe(portString, s))
}
