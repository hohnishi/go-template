package main

import (
	"encoding/json"
	"flag"
	"log"
	"os"
	"text/template"
)

var jsonfile, outfile, templatefile string

func main() {
	flag.StringVar(&jsonfile, "j", "", "json filename")
	flag.StringVar(&jsonfile, "json", "", "json filename")
	flag.StringVar(&outfile, "o", "", "output filename")
	flag.StringVar(&outfile, "outfile", "", "output filename")
	flag.Parse()
	templatefile = flag.Arg(0)
	if templatefile == "" {
		templatefile = "sample.template"
	}
	os.Exit(Run(os.Args))
}

func Run(args []string) int {
	//	fmt.Printf("outfile: %s\n", outfile)
	//	fmt.Printf("jsonfile: %s\n", jsonfile)
	//	fmt.Printf("templatefile: %s\n", templatefile)

	var err error
	o := os.Stdout
	if outfile != "" {
		o, err = os.Create(outfile)
		if err != nil {
			log.Fatal(err)
		}
		defer o.Close()
	}

	f := os.Stdin
	if jsonfile != "" {
		f, err = os.Open(jsonfile)
		if err != nil {
			log.Fatal(err)
		}
		defer f.Close()
	}

	var data interface{}
	err = json.NewDecoder(f).Decode(&data)
	if err != nil {
		log.Fatal(err)
	}
	tmpl := template.Must(template.ParseFiles(templatefile))
	err = tmpl.Execute(o, data)
	if err != nil {
		log.Fatal(err)
	}
	return 0
}
