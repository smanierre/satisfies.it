FROM golang:1.14.1-buster as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go test ./server
RUN go test ./typeparser/test
RUN go test ./util

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest

RUN apk --no-cache add ca-certificates postgresql-client

WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .
COPY --from=builder /app/dump.pgsql .
COPY --from=builder /app/dbsetup.sql .
COPY --from=builder /app/static ./static

CMD ["./main"]
