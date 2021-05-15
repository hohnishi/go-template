{{/*
{{$maxinstances  := or .maxinstances  8 -}}
{{$maxloghistory := or .maxloghistory 1 -}}
{{$maxlogfiles   := or .maxlogfiles   16 -}}
{{$maxlogmembers := or .maxlogmembers 3 -}}
{{$maxdatafiles  := or .maxdatafiles  1024 -}}
*/}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\CreateDB.log append
startup nomount pfile="{{.SCRIPT_DIR}}\init.ora";
{{template "create_database" .}}
spool off
