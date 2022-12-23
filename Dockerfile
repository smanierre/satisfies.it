FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o typersite .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/typersite .
RUN apk add --no-cache sqlite curl libc6-compat
RUN curl -LO https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
RUN rm /app/go1.19.4.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"
EXPOSE 80
CMD [ "/app/typersite"]
