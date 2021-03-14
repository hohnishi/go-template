SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBFiles.log append
{{template "user_tbs" .Tbs -}}
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
