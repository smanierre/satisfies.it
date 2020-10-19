FROM golang:latest AS builder
WORKDIR $GOPATH/src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux && go build -o typersite .

FROM alpine:latest
COPY --from=builder typersite .
COPY .env .
COPY backend/types.json .
RUN mkdir static
COPY frontend/static/* static/
ENTRYPOINT [ "typersite", "-prod", "-certFile=/certs/fullchain.pem", "-keyFile=/certs/privkey.pem", "-port=8443", "-overwriteDb" ]
