#!/bin/bash

GOTEMPLATE=../../gotemplate
TMPLDIR=scripts-tmpl
DESTDIR=scripts
ORIGDIR=scripts-orig

files="
CreateClustDBViews.sql
CreateDB.sql
CreateDBCatalog.sql
CreateDBFiles.sql
JServer.sql
PDBCreation.sql
context.sql
init.ora
interMedia.sql
lockAccount.sql
netExtensions.sql
orcl.bat
orcl.sql
ordinst.sql
plug_PLGDB.sql
postDBCreation.sql
postPDBCreation_PLGDB.sql
"

mkdir -p ${DESTDIR}

param="param.json"
[ $# -ne 0 ] && param="$1"

for f in ${files}; do
    echo $f;
    ${GOTEMPLATE} -j "$param"  "${TMPLDIR}/${f}" "${TMPLDIR}/CommonTablespace.tmpl" "${TMPLDIR}/CREATE_TABLESPACE.tmpl" > "${DESTDIR}/${f}"
#    ${GOTEMPLATE} -j "$param"  "${TMPLDIR}/${f}" "${TMPLDIR}/CREATE_TABLESPACE.tmpl" > "${DESTDIR}/${f}"
#    ${GOTEMPLATE} -j "$param"  "${TMPLDIR}/${f}" "${TMPLDIR}/CommonTablespace.tmpl" > "${DESTDIR}/${f}"
done

diff -ur ${ORIGDIR} ${DESTDIR}
rc=$?
if [ $rc = 0 ]; then
    echo "** Done! **"
fi
