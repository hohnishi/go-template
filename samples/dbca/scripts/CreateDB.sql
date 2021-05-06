SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\CreateDB.log append
startup nomount pfile="C:\app\Administrator\admin\orcl\scripts\init.ora";
CREATE DATABASE "orcl"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 1024
DATAFILE
EXTENT MANAGEMENT LOCAL
SYSAUX
  DATAFILE
SMALLFILE DEFAULT TEMPORARY TABLESPACE <no value>
  TEMPFILE
SMALLFILE UNDO TABLESPACE "<no value>"
  DATAFILE
CHARACTER SET AL32UTF8
NATIONAL CHARACTER SET AL16UTF16
LOGFILE
  GROUP 1 ('C:\app\Administrator\oradata\ORCL\redo01.log') SIZE 200M,
  GROUP 2 ('C:\app\Administrator\oradata\ORCL\redo02.log') SIZE 200M,
  GROUP 3 ('C:\app\Administrator\oradata\ORCL\redo03.log') SIZE 200M
USER SYS IDENTIFIED BY "&&sysPassword"
USER SYSTEM IDENTIFIED BY "&&systemPassword"
enable pluggable database
seed file_name_convert=(
  '<no value>','C:\app\Administrator\oradata\ORCL\pdbseed\<no value>',
  '<no value>','C:\app\Administrator\oradata\ORCL\pdbseed\<no value>',
  '<no value>','C:\app\Administrator\oradata\ORCL\pdbseed\<no value>',
  '<no value>','C:\app\Administrator\oradata\ORCL\pdbseed\<no value>'
  ) LOCAL UNDO ON;
spool off
