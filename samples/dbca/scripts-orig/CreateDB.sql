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
DATAFILE 'C:\app\Administrator\oradata\ORCL\system01.dbf' SIZE 700M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SYSAUX
  DATAFILE 'C:\app\Administrator\oradata\ORCL\sysaux01.dbf' SIZE 550M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP
  TEMPFILE 'C:\app\Administrator\oradata\ORCL\temp01.dbf' SIZE 20M REUSE AUTOEXTEND ON NEXT  640K MAXSIZE UNLIMITED
SMALLFILE UNDO TABLESPACE "UNDOTBS1"
  DATAFILE  'C:\app\Administrator\oradata\ORCL\undotbs01.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT  5120K MAXSIZE UNLIMITED
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
  'C:\app\Administrator\oradata\ORCL\system01.dbf','C:\app\Administrator\oradata\ORCL\pdbseed\system01.dbf',
  'C:\app\Administrator\oradata\ORCL\sysaux01.dbf','C:\app\Administrator\oradata\ORCL\pdbseed\sysaux01.dbf',
  'C:\app\Administrator\oradata\ORCL\temp01.dbf','C:\app\Administrator\oradata\ORCL\pdbseed\temp01.dbf',
  'C:\app\Administrator\oradata\ORCL\undotbs01.dbf','C:\app\Administrator\oradata\ORCL\pdbseed\undotbs01.dbf'
  ) LOCAL UNDO ON;
spool off
