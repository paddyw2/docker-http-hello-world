make:
	go build -o bin/main main.go

run:
	go run main.go

format:
	go fmt .

docker:
	docker build . -t web-app:latest
