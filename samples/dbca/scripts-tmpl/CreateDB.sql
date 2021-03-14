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
{{template "system_tbs" .SYSTEM -}}
{{template "sysaux_tbs" .SYSAUX -}}
{{template "temp_tbs" .TEMP -}}
{{template "undo_tbs" .UNDO -}}
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
  '{{.DB_BASE}}\{{.SYSTEM.Fname}}','{{.SEED_BASE}}\{{.SYSTEM.Fname}}',
  '{{.DB_BASE}}\{{.SYSAUX.Fname}}','{{.SEED_BASE}}\{{.SYSAUX.Fname}}',
  '{{.DB_BASE}}\{{.TEMP.Fname}}','{{.SEED_BASE}}\{{.TEMP.Fname}}',
  '{{.DB_BASE}}\{{.UNDO.Fname}}','{{.SEED_BASE}}\{{.UNDO.Fname}}'
  ) LOCAL UNDO ON;
spool off
