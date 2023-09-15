package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
  port := os.Getenv("PORT")
  // port = ":8080"

	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet {
      http.ServeFile(w, r, "./static/test.html")
		}
	})
  fmt.Println("Server listening on ", port)
  err := http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
	if err != nil {
		panic(err)
	}
}
