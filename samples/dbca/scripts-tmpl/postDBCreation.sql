{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$catcon_pl := printf "\"%s\\perl\\bin\\perl.exe\" %s\\rdbms\\admin\\catcon.pl" $oh $oh -}}
{{$datapatch := printf "%s\\OPatch\\datapatch.bat" $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
spool {{.LOG_DIR}}\postDBCreation.log append
host {{$datapatch}} -skip_upgrade_check -db {{.SID}};
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='{{$oh}}\database\spfile{{.SID}}.ora' FROM pfile='{{.SCRIPT_DIR}}\init.ora';
connect "SYS"/"&&sysPassword" as SYSDBA
host {{$catcon_pl}} -n 1 -l {{.LOG_DIR}} -v  -b utlrp  -U "SYS"/"&&sysPassword" {{$oh}}\rdbms\admin\utlrp.sql;
select comp_id, status from dba_registry;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
spool off
