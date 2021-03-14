SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDBFiles.log append
CREATE SMALLFILE TABLESPACE "{{.Tbs.Tbsname}}" LOGGING
  DATAFILE  '{{.DB_BASE}}\{{.Tbs.Fname}}' SIZE {{.Tbs.Size}} REUSE AUTOEXTEND {{.Tbs.Autoextend}} NEXT  {{.Tbs.Next}} MAXSIZE {{.Tbs.Maxsize}}
  EXTENT MANAGEMENT LOCAL  SEGMENT SPACE MANAGEMENT  AUTO;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
