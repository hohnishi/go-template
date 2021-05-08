SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\app\Administrator\admin\orcl\scripts\JServer.log append
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b initjvm -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\javavm\install\initjvm.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b initxml -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\xdk\admin\initxml.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b xmlja -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\xdk\admin\xmlja.sql;
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catjava -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catjava.sql;
connect "SYS"/"&&sysPassword" as SYSDBA
host "C:\app\Administrator\product\19.0.0\dbhome_1\perl\bin\perl.exe" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catcon.pl -n 1 -l C:\app\Administrator\admin\orcl\scripts -v  -b catxdbj -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" C:\app\Administrator\product\19.0.0\dbhome_1\rdbms\admin\catxdbj.sql;
spool off
