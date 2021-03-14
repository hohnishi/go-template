{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\interMedia.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b iminst -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\ord\im\admin\iminst.sql;
spool off
