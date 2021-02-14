package main

import (
    "text/template"
    "time"
    "os"
)

func main() {
    // テンプレートをパース
    tpl := template.Must(template.ParseFiles("sample.tpl"))

    m := map[string]string{
        "Date": time.Now().Format("2006-01-02"),
        "Time": time.Now().Format("15:04:05"),
    }

    // テンプレートを描画
    err := tpl.Execute(os.Stdout, m)
    if err != nil {
    panic(err)
    }
}
