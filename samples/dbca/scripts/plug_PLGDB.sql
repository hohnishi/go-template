SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\plugDatabase.log append
spool C:\app\Administrator\admin\orcl\scripts\plugDatabase.log append
host mkdir C:\app\Administrator\oradata\ORCL\PLGDB;
select d.name||'|'||t.name from v$datafile d,V$TABLESPACE t where d.con_id=2 and d.ts#=t.ts# and d.con_id=t.con_id;
select d.name||'|'||t.name from v$tempfile d,V$TABLESPACE t where d.con_id=2 and d.ts#=t.ts# and d.con_id=t.con_id;
CREATE PLUGGABLE DATABASE PLGDB ADMIN USER PDBADMIN IDENTIFIED BY "&&pdbadminPassword" ROLES=(CONNECT)  file_name_convert=('C:\app\Administrator\oradata\ORCL\pdbseed','C:\app\Administrator\oradata\ORCL\PLGDB')  STORAGE ( MAXSIZE UNLIMITED MAX_SHARED_TEMP_SIZE UNLIMITED);
alter pluggable database PLGDB open;
alter system register;
