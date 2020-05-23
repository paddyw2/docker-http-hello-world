# build
FROM golang:1.14.3-alpine3.11

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go build -o bin/main main.go

# run
FROM alpine:latest

RUN mkdir /app

COPY --from=0 /app/bin/main .

CMD ["./main"]
