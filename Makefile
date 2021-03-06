NEW_TAG = $(shell date +"%Y-%m-%d-%s")

make:
	go build -o bin/main main.go

run:
	go run main.go

format:
	go fmt .

docker:
	docker build . -t docker-http-hello-world:latest

docker-push:
	docker tag docker-http-hello-world:latest pwithams/docker-http-hello-world:$(NEW_TAG) && \
	docker push pwithams/docker-http-hello-world:$(NEW_TAG)
