package main

import (
	"fmt"
	"net/http"
)

func main() {
  http.HandleFunc("/test2", func(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    return
  })
	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet {
      http.ServeFile(w, r, "./static/test.sh")
		}
	})
  fmt.Println("Server listening on 8080")
  err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic(err)
	}
}
