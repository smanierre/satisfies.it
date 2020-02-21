FROM golang:1.13 as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go test ./server
RUN go test ./typeparser/test
RUN go test ./util

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM golang:1.13

# RUN apk --no-cache add ca-certificates

RUN curl https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz --output go.tar.gz
RUN tar -xvf go.tar.gz
RUN rm go.tar.gz


WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .

EXPOSE  8080

CMD ["./main"]
