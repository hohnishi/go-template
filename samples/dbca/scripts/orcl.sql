set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
ACCEPT pdbAdminPassword CHAR PROMPT 'Enter new password for PDBADMIN: ' HIDE
host C:\app\Administrator\product\19.0.0\dbhome_1\bin\orapwd.exe file=C:\app\Administrator\product\19.0.0\dbhome_1\database\PWDorcl.ora force=y format=12
@C:\app\Administrator\admin\orcl\scripts\CreateDB.sql
@C:\app\Administrator\admin\orcl\scripts\CreateDBFiles.sql
@C:\app\Administrator\admin\orcl\scripts\CreateDBCatalog.sql
@C:\app\Administrator\admin\orcl\scripts\JServer.sql
@C:\app\Administrator\admin\orcl\scripts\context.sql
@C:\app\Administrator\admin\orcl\scripts\ordinst.sql
@C:\app\Administrator\admin\orcl\scripts\interMedia.sql
@C:\app\Administrator\admin\orcl\scripts\netExtensions.sql
@C:\app\Administrator\admin\orcl\scripts\CreateClustDBViews.sql
@C:\app\Administrator\admin\orcl\scripts\lockAccount.sql
@C:\app\Administrator\admin\orcl\scripts\postDBCreation.sql
@C:\app\Administrator\admin\orcl\scripts\PDBCreation.sql
@C:\app\Administrator\admin\orcl\scripts\plug_PLGDB.sql
@C:\app\Administrator\admin\orcl\scripts\postPDBCreation_PLGDB.sql
