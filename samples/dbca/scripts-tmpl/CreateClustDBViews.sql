{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateClustDBViews.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catclust  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catclust.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catfinal  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catfinal.sql;
spool off
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\postDBCreation.log append
