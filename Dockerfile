FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o typersite .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/typersite .
RUN apk add --no-cache sqlite
EXPOSE 80
CMD [ "/app/typersite" ]
