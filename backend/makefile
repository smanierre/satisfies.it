build:
	docker build . -t typer-site

populate:
	go run main.go -populate=true -envfile="./.env_dev"

prod:
	npm run build --prefix ../frontend
	cp -r ../frontend/build/* static
	docker build . -t smanierre/typer-site
	docker push smanierre/typer-site:latest