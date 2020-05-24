/*
From: https://golang.org/pkg/net/http/#example_ListenAndServe
*/
package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

const PORT string = "8080"
const VERSION string = "0.0.1"

func main() {
	http.HandleFunc("/", helloWorldRouter)
	fmt.Println("Listening...")
	log.Fatal(http.ListenAndServe(":"+PORT, nil))
}

func helloWorldRouter(writer http.ResponseWriter, request *http.Request) {
	fmt.Println("Handling request to:", request.URL)
	if request.URL.Path == "/" {
        io.WriteString(writer, "Hello, world\nVersion: "+VERSION)
	} else {
		fmt.Println("Path not supported")
		writer.Header()
		writer.WriteHeader(http.StatusNotFound)
		io.WriteString(writer, "404 - not found\n")
	}
}
