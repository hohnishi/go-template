package main

import (
	"encoding/json"
	"flag"
	"log"
	"os"
	"text/template"
)

func main() {
	var jsonfile, outfile string
	flag.StringVar(&jsonfile, "j", "", "json filename")
	flag.StringVar(&jsonfile, "json", "", "json filename")
	flag.StringVar(&outfile, "o", "", "output filename")
	flag.StringVar(&outfile, "outfile", "", "output filename")
	flag.Parse()
	os.Exit(Run(os.Args))
}

func Run(args []string) int {
	fname := "sample.json"
	f, err := os.Open(fname)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	var data interface{}
	err = json.NewDecoder(f).Decode(&data)
	tmpl := template.Must(template.ParseFiles("sample.template"))
	err = tmpl.Execute(os.Stdout, data)
	if err != nil {
		log.Fatal(err)
	}
	return 0
}
