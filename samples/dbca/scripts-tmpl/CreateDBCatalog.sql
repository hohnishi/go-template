{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBCatalog.log append
alter session set "_oracle_script"=true;
alter pluggable database pdb$seed close;
alter pluggable database pdb$seed open;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catalog  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catalog.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catproc  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catproc.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catoctk  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catoctk.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b owminst  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\owminst.plb;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b pupbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" {{$oh}}\sqlplus\admin\pupbld.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b pupdel -u SYS/&&sysPassword  -U "SYS"/"&&sysPassword" {{$oh}}\sqlplus\admin\pupdel.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool {{.LOG_DIR}}\sqlPlusHelp.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b hlpbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" -a 1  {{$oh}}\sqlplus\admin\help\hlpbld.sql 1helpus.sql;
spool off
spool off
