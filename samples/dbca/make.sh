#!/bin/sh

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

for f in ${files}; do
    echo $f;
    ${GOTEMPLATE} -j param.json  "${TMPLDIR}/${f}" "${TMPLDIR}/CommonTablespace.tmpl" > "${DESTDIR}/${f}"
done

diff -ur ${ORIGDIR} ${DESTDIR}

