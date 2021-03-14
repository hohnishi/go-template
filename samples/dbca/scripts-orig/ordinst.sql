SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\ordinst.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b ordinst  -U "SYS"/"&&sysPassword" -a 1  C:\app\Administrator\product\19.0.0\dbhome_1\ord\admin\ordinst.sql 1SYSAUX 1SYSAUX;
spool off
