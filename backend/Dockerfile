FROM golang:1.14.1-buster as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .
RUN mv ./store/postgres/dbsetup.sql .

RUN go test ./server
RUN go test ./typeparser/test
RUN go test ./util

ENV PGPASSWORD=testpass

RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN apt update
RUN apt install -y postgresql

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
RUN ./main --populate --envfile=.env_dev

FROM alpine:latest

RUN apk --no-cache add ca-certificates postgresql-client

WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .
COPY --from=builder /app/dump.pgsql .
COPY --from=builder /app/dbsetup.sql .

CMD ["./main"]
