SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBFiles.log append
{{range .tbss}}
{{template "create_tablespace" . -}}
{{end}}
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
