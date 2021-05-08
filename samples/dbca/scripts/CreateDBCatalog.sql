SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\CreateDBCatalog.log append
alter session set "_oracle_script"=true;
alter pluggable database pdb$seed close;
alter pluggable database pdb$seed open;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catalog  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catalog.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catproc  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catproc.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catoctk  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catoctk.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b owminst  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\owminst.plb;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b pupbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\sqlplus\admin\pupbld.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b pupdel -u SYS/&&sysPassword  -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\sqlplus\admin\pupdel.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool C:\app\Administrator\admin\orcl\scripts\sqlPlusHelp.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b hlpbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" -a 1  C:\app\Administrator\product\19.0.0\dbhome_1\sqlplus\admin\help\hlpbld.sql 1helpus.sql;
spool off
spool off
