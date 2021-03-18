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
SMALLFILE DEFAULT TEMPORARY TABLESPACE {{.TEMP.Tbsname}}
  TEMPFILE {{template "dataf_tempf_spec" .TEMP }}
SMALLFILE UNDO TABLESPACE "{{.UNDO.Tbsname}}"
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
  '{{.SYSTEM.Path}}','{{.SEED_BASE}}\{{.SYSTEM.Fname}}',
  '{{.SYSAUX.Path}}','{{.SEED_BASE}}\{{.SYSAUX.Fname}}',
  '{{.TEMP.Path}}','{{.SEED_BASE}}\{{.TEMP.Fname}}',
  '{{.UNDO.Path}}','{{.SEED_BASE}}\{{.UNDO.Fname}}'
  ) LOCAL UNDO ON;
spool off
