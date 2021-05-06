#!/bin/bash

GOTEMPLATE=../../gotemplate
TMPLDIR=scripts-tmpl
DESTDIR=scripts
ORIGDIR=scripts-orig
LIBDIR=Lib

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

templates="\
${LIBDIR}/Common.tmpl \
${LIBDIR}/CREATE_TABLESPACE.tmpl \
${LIBDIR}/CREATE_DATABASE.tmpl \
"

for f in ${files}; do
    echo $f;
    ${GOTEMPLATE} -j "$param" "${TMPLDIR}/${f}" $templates > "${DESTDIR}/${f}"
done

diff -ur ${ORIGDIR} ${DESTDIR}
rc=$?
if [ $rc = 0 ]; then
    echo "** Done! **"
fi
