SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBFiles.log append
{{template "create_tablespace" .Tbs -}}
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
