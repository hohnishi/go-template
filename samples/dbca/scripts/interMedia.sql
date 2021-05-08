SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\interMedia.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b iminst -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\ord\im\admin\iminst.sql;
spool off
