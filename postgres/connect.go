package postgres

import (
	"context"
	"fmt"
	"strconv"

	"github.com/jackc/pgx"
	"github.com/jackc/pgx/v4/pgxpool"
)

var db *pgxpool.Pool

//Connect takes in all the information needed to create a connection string and returns a connection pool that
//can be used to access the database.
func Connect(dbHost, dbPort, dbUser, dbPassword, dbName string) error {
	var err error
	port, err := strconv.Atoi(dbPort)
	if err != nil {
		return fmt.Errorf("error when parsing string %s to int: %s", dbPort, err.Error())
	}
	dbConfig := pgx.ConnConfig{
		Host:     dbHost,
		Port:     uint16(port),
		User:     dbUser,
		Password: dbPassword,
		Database: dbName,
	}
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, dbName)
	check, err := pgx.Connect(dbConfig)
	if err != nil {
		return err
	}
	if err = check.Ping(context.Background()); err != nil {
		return err
	}
	err = check.Close()
	if err != nil {
		return fmt.Errorf("unable to close connection test database: %s", err.Error())
	}
	db, err = pgxpool.Connect(context.Background(), psqlInfo)
	if err != nil {
		return err
	}

	return nil
}
