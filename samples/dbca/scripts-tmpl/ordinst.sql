{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\ordinst.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b ordinst  -U "SYS"/"&&sysPassword" -a 1  {{$oh}}\ord\admin\ordinst.sql 1SYSAUX 1SYSAUX;
spool off
