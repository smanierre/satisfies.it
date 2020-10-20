FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o typersite .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/typersite .
COPY .env .
COPY types.json .
RUN mkdir static
COPY static/* static/ 
RUN ls /app
CMD [ "/app/typersite", "-prod", "-certFile=/certs/fullchain.pem", "-keyFile=/certs/privkey.pem", "-port=8443", "-overwriteDb" ]
