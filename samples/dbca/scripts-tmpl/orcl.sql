set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
ACCEPT pdbAdminPassword CHAR PROMPT 'Enter new password for PDBADMIN: ' HIDE
host {{.ORACLE_HOME}}\bin\orapwd.exe file={{.ORACLE_HOME}}\database\PWD{{.SID}}.ora force=y format=12
@{{.SCRIPT_DIR}}\CreateDB.sql
@{{.SCRIPT_DIR}}\CreateDBFiles.sql
@{{.SCRIPT_DIR}}\CreateDBCatalog.sql
@{{.SCRIPT_DIR}}\JServer.sql
@{{.SCRIPT_DIR}}\context.sql
@{{.SCRIPT_DIR}}\ordinst.sql
@{{.SCRIPT_DIR}}\interMedia.sql
@{{.SCRIPT_DIR}}\netExtensions.sql
@{{.SCRIPT_DIR}}\CreateClustDBViews.sql
@{{.SCRIPT_DIR}}\lockAccount.sql
@{{.SCRIPT_DIR}}\postDBCreation.sql
@{{.SCRIPT_DIR}}\PDBCreation.sql
@{{.SCRIPT_DIR}}\plug_{{.PDB_NAME}}.sql
@{{.SCRIPT_DIR}}\postPDBCreation_{{.PDB_NAME}}.sql
