package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", HelloServer)
	log.Println("starting server on port 8080")
	http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	log.Println("received request")
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "Hello :D, %s!", r.URL.Path[1:])

}
