package main

import (
	"net/http"
)

func main() {
	dir := "./static"

	fileServer := http.FileServer(http.Dir(dir))

	http.Handle("/", http.StripPrefix("/", fileServer))

	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic(err)
	}
}

