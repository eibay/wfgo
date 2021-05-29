package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", hello)
	fmt.Println("Server started...")
	hi()
	log.Fatal(http.ListenAndServe(":7070", nil))
}

func hello(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Write(([]byte(`{"message":"hello world!"}`)))
}

func hi() {
	fmt.Println("Hello from WF Go!")
}
