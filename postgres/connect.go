package postgres

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v4"
	"github.com/jackc/pgx/v4/pgxpool"
)

var db *pgxpool.Pool

//Connect takes in all the information needed to create a connection string and returns a connection pool that
//can be used to access the database.
func Connect(dbHost, dbPort, dbUser, dbPassword, dbName string) error {
	var err error
	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, dbName)
	check, err := pgx.Connect(context.Background(), psqlInfo)
	if err != nil {
		return err
	}
	if err = check.Ping(context.Background()); err != nil {
		return err
	}
	err = check.Close(context.Background())
	if err != nil {
		return fmt.Errorf("unable to close connection test database: %s", err.Error())
	}
	db, err = pgxpool.Connect(context.Background(), psqlInfo)
	if err != nil {
		return err
	}

	return nil
}
