SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool {{.LOG_DIR}}\plugDatabase.log append
spool {{.LOG_DIR}}\plugDatabase.log append
host mkdir {{.DB_BASE}}\{{.PDB_NAME}};
select d.name||'|'||t.name from v$datafile d,V$TABLESPACE t where d.con_id=2 and d.ts#=t.ts# and d.con_id=t.con_id;
select d.name||'|'||t.name from v$tempfile d,V$TABLESPACE t where d.con_id=2 and d.ts#=t.ts# and d.con_id=t.con_id;
CREATE PLUGGABLE DATABASE {{.PDB_NAME}} ADMIN USER PDBADMIN IDENTIFIED BY "&&pdbadminPassword" ROLES=(CONNECT)  file_name_convert=('{{.SEED_BASE}}','{{.PDB_BASE}}')  STORAGE ( MAXSIZE UNLIMITED MAX_SHARED_TEMP_SIZE UNLIMITED);
alter pluggable database {{.PDB_NAME}} open;
alter system register;
