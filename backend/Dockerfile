FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o typersite .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/typersite .
COPY .env .
RUN cat .env
COPY types.json .
RUN mkdir static
COPY static/* static/ 
CMD [ "/app/typersite", "-prod", "-certFile=/etc/letsencrypt/live/satisfies.it/fullchain.pem", "-keyFile=/etc/letsencrypt/live/satisfies.it/privkey.pem", "-port=8443", "-overwriteDb" ]
