SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDB.log append
startup nomount pfile="{{.SCRIPT_DIR}}\init.ora";
CREATE DATABASE "{{.SID}}"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 1024
DATAFILE {{template "dataf_tempf_spec" .SYSTEM }}
EXTENT MANAGEMENT LOCAL
SYSAUX
  DATAFILE {{template "dataf_tempf_spec" .SYSAUX }}
SMALLFILE DEFAULT TEMPORARY TABLESPACE {{.TEMP.tbsname}}
  TEMPFILE {{template "dataf_tempf_spec" .TEMP }}
SMALLFILE UNDO TABLESPACE "{{.UNDO.tbsname}}"
  DATAFILE {{template "dataf_tempf_spec" .UNDO }}
CHARACTER SET {{.CHARSET}}
NATIONAL CHARACTER SET {{.NSCHARSET}}
LOGFILE
  GROUP 1 ('{{.DB_BASE}}\redo01.log') SIZE 200M,
  GROUP 2 ('{{.DB_BASE}}\redo02.log') SIZE 200M,
  GROUP 3 ('{{.DB_BASE}}\redo03.log') SIZE 200M
USER SYS IDENTIFIED BY "&&sysPassword"
USER SYSTEM IDENTIFIED BY "&&systemPassword"
enable pluggable database
seed file_name_convert=(
  '{{.SYSTEM.path}}','{{.SEED_BASE}}\{{.SYSTEM.fname}}',
  '{{.SYSAUX.path}}','{{.SEED_BASE}}\{{.SYSAUX.fname}}',
  '{{.TEMP.path}}','{{.SEED_BASE}}\{{.TEMP.fname}}',
  '{{.UNDO.path}}','{{.SEED_BASE}}\{{.UNDO.fname}}'
  ) LOCAL UNDO ON;
spool off
