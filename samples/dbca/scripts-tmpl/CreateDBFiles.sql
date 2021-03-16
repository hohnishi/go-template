SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBFiles.log append
{{template "tbs_common" .Tbs -}}
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
