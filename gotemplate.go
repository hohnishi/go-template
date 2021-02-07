package main

import "text/template"
import "encoding/json"
import "os"
import "log"
import "fmt"

func main() {
	fname := "sample.json"
	f, err := os.Open(fname)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	dec := json.NewDecoder(f)
//	var data interface{}
//	err = dec.Decode(&data)
	var data map[string]interface{}
//	vat data []interface{}
	err := json.Unmarshal([]byte(), &data)
	if err != nil {
		log.Fatal(err)
	}

	tmpl := template.Must(template.New("tmpl").ParseFiles("sample.template"))
	tmpl.Execute(os.Stdout, data)


}