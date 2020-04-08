build:
	mkdir temp
	curl -o ./temp/src.tar.gz https://dl.google.com/go/go1.14.1.src.tar.gz
	tar -C ./temp -xvf ./temp/src.tar.gz
	mv ./temp/go/src .
	docker build . -t typer-site
	go clean
	rm -r temp
	rm -r src