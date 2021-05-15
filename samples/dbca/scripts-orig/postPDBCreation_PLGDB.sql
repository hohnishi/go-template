SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container=PLGDB;
set echo on
spool C:\app\Administrator\admin\orcl\scripts\postPDBCreation.log append
CREATE SMALLFILE TABLESPACE "USERS"
  DATAFILE 'C:\app\Administrator\oradata\ORCL\PLGDB\users01.dbf' SIZE 5M AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
host C:\app\Administrator\product\19.0.0\dbhome_1\OPatch\datapatch.bat -skip_upgrade_check -db orcl -pdbs PLGDB;
connect "SYS"/"&&sysPassword" as SYSDBA
select property_value from database_properties where property_name='LOCAL_UNDO_ENABLED';
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container=PLGDB;
set echo on
spool C:\app\Administrator\admin\orcl\scripts\postPDBCreation.log append
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container=PLGDB;
set echo on
spool C:\app\Administrator\admin\orcl\scripts\postPDBCreation.log append
select TABLESPACE_NAME from cdb_tablespaces a,dba_pdbs b where a.con_id=b.con_id and UPPER(b.pdb_name)=UPPER('PLGDB');
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container=PLGDB;
set echo on
spool C:\app\Administrator\admin\orcl\scripts\postPDBCreation.log append
Select count(*) from dba_registry where comp_id = 'DV' and status='VALID';
alter session set container=CDB$ROOT;
exit;
