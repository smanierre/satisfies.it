# typer-site

<img src="https://satisfies.it/static/images/gopher.png" alt="Confused Gopher" width="400px"/>

This is the repo for the website [satisfies.it](https://satisfies.it). This website allows you to search for types in the standard library and see what types they are implemented by, or what interfaces they implement. This project was born out of me seeing methods take an io.Reader or other interface, and not knowing off the top of my head what could be used there. The basic functionality is good so far, but it is still a work in progress.

Technologies used:

- [go/types](https://pkg.go.dev/go/types) & [go/packages](https://pkg.go.dev/golang.org/x/tools/go/packages) packages for parsing the standard library
- [pgx](https://github.com/jackc/pgx) for database connection
- [Postgresql 12](https://www.postgresql.org/) for the database
- [html/template](https://pkg.go.dev/html/template) for static web pages
- [godotenv](https://github.com/joho/godotenv) for loading configuration values from a .env file
- [embed](https://golang.org/pkg/embed/) for embedding all the static assets and templates into the binary

## Running locally

If you want to run this locally, say to get this information about other libraries (this is something I plan on implementing in the future), use the following steps:

_Note: I have only run this on linux machines, attempt with a Windows machine at your own risk._

1. Clone the repo to a local machine
2. Build the binary with `go build -o optional_binary_name .`
3. Determine what machine will be hosting the site and copy the built binary onto the system
4. Install [Postgresql 12](https://www.postgresql.org/) onto the system and create an account to use
5. Create a .env file in the same directory where the binary will be run from
6. Use the provided `sample.env` file to populate your own .env file with the relevant information
7. Download library to be parsed and specify location
   - If using the go standard library, just follow the instructions provided on the official website
   - If parsing a separate library, clone whatever repo you want to parse and note which directory it is located in
   - **IMPORTANT**: If you are parsing a different library, or you didn't install go into the default directory (/usr/local/go/src), then add another line to the `.env` file with the key `SRC_DIR` and the value being whatever directory is being used for the library. This can also be provided using a cmd line flag
8. Run the binary with the command `./binary_name`, providing any override flags if desired (Specified in next section)

## Command Line Override Flags

The following flags can be used on the command line if you wish to override or not use the .env file.

- `-certFile`: This is the path to the certificate file to be used if serving via https. No need to provide this if serving http. Defaults to `./cert.pem`
- `-keyFile`: This is the path to the key file to be used if serving via https. No need to provide this if serving http. Defaults to `./key.pem`
- `-dbHost`: This is the IP address/hostname that gets used in the connection string for the database. Defaults to the value provided in `.env`
- `-dbPort`: This is the port that the database is listening on. Defaults to the value provided in `.env`
- `-dbUser`: This is the user that will be used to connect to the database. Defaults to the value provided in `.env`
- `-dbPassword`: This is the password that will be used to authenticate with the database. Defaults to the value provided in `.env`
- `-ssl`: This is a boolean flag that tells whether or not to use ssl. If a specific port is not provided, it will default to 443 if this is enabled. Defaults to `false`
- `-goSrc`: This is the directory that the parser looks for the library to be parsed in. Defaults to the value provided in `.env`, is none is provided there it defaults to `/usr/local/go/src`
- `-port`: This specifies what port the application should listen on. Defaults to the value provided in `.env`. If there is no value provided there, it defaults to 443 if ssl is enabled, and 80 if ssl is not enabled.
- `-dev`: This flag specifies if the server is being run in development mode. All this changes is setting the port to 8080 to avoid any port conflicts with 80 or 443. May be removed later on in favor of using just the `-port` flag. Defaults to `false`

## Future of this project

There are no plans to introduce any features in the near future. Although the site works, there are a good amount of issues that need to be fixed before I want to add any features. The main thing I want to get squared away is testing for the site, and then after that there are error pages and just the overall look of the site that could use some polishing.

## Contributing

This is my first real project so I haven't even considered a process for contributing. If you feel like it, submit a merge request and i'll try to figure out where to go from there.
