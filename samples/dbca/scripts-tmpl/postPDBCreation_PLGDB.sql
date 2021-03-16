{{/* define variables */ -}}
{{$oh := .ORACLE_HOME -}}
{{$datapatch := printf "%s\\OPatch\\datapatch.bat" $oh -}}
{{/* ================ */ -}}
SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container={{.PDB_NAME}};
set echo on
spool {{.LOG_DIR}}\postPDBCreation.log append
{{template "tbs_common" .PdbTbs -}}
ALTER DATABASE DEFAULT TABLESPACE "USERS";
host {{$datapatch}} -skip_upgrade_check -db {{.SID}} -pdbs {{.PDB_NAME}};
connect "SYS"/"&&sysPassword" as SYSDBA
select property_value from database_properties where property_name='LOCAL_UNDO_ENABLED';
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container={{.PDB_NAME}};
set echo on
spool {{.LOG_DIR}}\postPDBCreation.log append
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container={{.PDB_NAME}};
set echo on
spool {{.LOG_DIR}}\postPDBCreation.log append
select TABLESPACE_NAME from cdb_tablespaces a,dba_pdbs b where a.con_id=b.con_id and UPPER(b.pdb_name)=UPPER('{{.PDB_NAME}}');
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container={{.PDB_NAME}};
set echo on
spool {{.LOG_DIR}}\postPDBCreation.log append
Select count(*) from dba_registry where comp_id = 'DV' and status='VALID';
alter session set container=CDB$ROOT;
exit;
