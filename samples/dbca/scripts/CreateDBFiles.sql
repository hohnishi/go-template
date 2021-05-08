SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\CreateDBFiles.log append

CREATE SMALLFILE TABLESPACE "DBCA-USERS"
  DATAFILE 'C:\app\Administrator\oradata\ORCL\users01.dbf' SIZE 5M REUSE AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
 LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE SMALLFILE TABLESPACE "FULLOPT"
  DATAFILE 'C:\app\Administrator\oradata\ORCL\users01.dbf' SIZE 5M REUSE AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED,
 'C:\app\Administrator\oradata\ORCL\users02.dbf' SIZE 5M REUSE AUTOEXTEND OFF
 MINIMUM EXTENT 8K BLOCKSIZE 16K LOGGING FORCE LOGGING ENCRYPTION USING 'AES128' ENCRYPT  ONLINE EXTENT MANAGEMENT LOCAL UNIFORM 1M SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON ENABLE LOST WRITE PROTECTION IN SHARDSPACE NAME;

ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
