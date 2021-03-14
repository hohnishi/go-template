{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\netExtensions.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b dbmsclr -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\dbmsclr.plb;
spool off
