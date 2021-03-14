echo "-- settings.json ------------------"
cat setting.json
echo "-- test.tmpl ------------------"
cat test.tmpl
echo "-- jq .db1.dbf setting.json | ../gotemplate test.tmpl  ------------------"
jq .db1.dbf setting.json | ../gotemplate test.tmpl
echo "-- jq .db1 setting.json | ../gotemplate test.tmpl  ------------------"
jq .db1 setting.json | ../gotemplate test.tmpl
echo "-------"
jq .db1.dbf setting.json | ../gotemplate repeat.tmpl
