{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\context.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catctx -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" -a 1  {{$oh}}\ctx\admin\catctx.sql 1Xbkfsdcdf1ggh_123 1SYSAUX 1TEMP 1LOCK;
alter user CTXSYS account unlock identified by "CTXSYS";
connect "CTXSYS"/"CTXSYS"
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b dr0defin -c  'PDB$SEED CDB$ROOT'  -u CTXSYS/CTXSYS  -U "SYS"/"&&sysPassword" -a 1  {{$oh}}\ctx\admin\defaults\dr0defin.sql 1\"JAPANESE\";
connect "SYS"/"&&sysPassword" as SYSDBA
alter user CTXSYS password expire account lock;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b dbmsxdbt -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\dbmsxdbt.sql;
spool off
