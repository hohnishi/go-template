SET VERIFY OFF
spool C:\app\Administrator\admin\orcl\scripts\postDBCreation.log append
host C:\app\Administrator\product\19.0.0\dbhome_1\OPatch\datapatch.bat -skip_upgrade_check -db orcl;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='C:\app\Administrator\product\19.0.0\dbhome_1\database\spfileorcl.ora' FROM pfile='C:\app\Administrator\admin\orcl\scripts\init.ora';
connect "SYS"/"&&sysPassword" as SYSDBA
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b utlrp  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\utlrp.sql;
select comp_id, status from dba_registry;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
spool off
