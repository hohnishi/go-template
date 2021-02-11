package main

import "text/template"
import "encoding/json"
import "os"
import "log"
//import "fmt"

func main() {
	fname := "sample.json"
	f, err := os.Open(fname)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	var data interface{}
	err = json.NewDecoder(f).Decode(&data)
	tmpl := template.Must(template.ParseFiles("./sample.template"))
	err = tmpl.Execute(os.Stdout, data)
	if err != nil {
		log.Fatal(err)
	}
}