package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/ping", pingHandler)
    fmt.Println("Starting server on port 8080...")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        fmt.Printf("Error starting server: %s\n", err)
    }
}

func pingHandler(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("pong pong pong!!!!!!"))
}
