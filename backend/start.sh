#!/bin/sh

docker-compose up &
wait $!
./typer-site -prod -certFile=/etc/letsencrypt/live/satisfies.it/fullchain.pem -keyFile=/etc/letsencrypt/live/satisfies.it/privkey.pem -port=8443 -overwriteDb &