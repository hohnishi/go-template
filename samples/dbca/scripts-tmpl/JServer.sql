{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\JServer.log append
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b initjvm -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\javavm\install\initjvm.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b initxml -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\xdk\admin\initxml.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b xmlja -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\xdk\admin\xmlja.sql;
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catjava -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catjava.sql;
connect "SYS"/"&&sysPassword" as SYSDBA
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b catxdbj -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\catxdbj.sql;
spool off
