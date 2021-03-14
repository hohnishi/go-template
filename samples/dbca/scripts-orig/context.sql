SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\context.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catctx -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" -a 1  C:\app\Administrator\product\19.0.0\dbhome_1\ctx\admin\catctx.sql 1Xbkfsdcdf1ggh_123 1SYSAUX 1TEMP 1LOCK;
alter user CTXSYS account unlock identified by "CTXSYS";
connect "CTXSYS"/"CTXSYS"
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b dr0defin -c  'PDB$SEED CDB$ROOT'  -u CTXSYS/CTXSYS  -U "SYS"/"&&sysPassword" -a 1  C:\app\Administrator\product\19.0.0\dbhome_1\ctx\admin\defaults\dr0defin.sql 1\"JAPANESE\";
connect "SYS"/"&&sysPassword" as SYSDBA
alter user CTXSYS password expire account lock;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b dbmsxdbt -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\dbmsxdbt.sql;
spool off
