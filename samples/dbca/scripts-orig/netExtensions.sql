SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\netExtensions.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b dbmsclr -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\dbmsclr.plb;
spool off
