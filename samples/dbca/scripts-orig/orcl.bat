mkdir C:\app\Administrator
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator -RECURSE false ) 
mkdir C:\app\Administrator\admin\orcl\adump
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\admin\orcl\adump -RECURSE false ) 
mkdir C:\app\Administrator\admin\orcl\dpdump
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\admin\orcl\dpdump -RECURSE false ) 
mkdir C:\app\Administrator\admin\orcl\pfile
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\admin\orcl\pfile -RECURSE false ) 
mkdir C:\app\Administrator\audit
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\audit -RECURSE false ) 
mkdir C:\app\Administrator\cfgtoollogs\dbca\orcl
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\cfgtoollogs\dbca\orcl -RECURSE false ) 
mkdir C:\app\Administrator\oradata\ORCL
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\oradata\ORCL -RECURSE false ) 
mkdir C:\app\Administrator\oradata\ORCL\pdbseed
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\oradata\ORCL\pdbseed -RECURSE false ) 
mkdir C:\app\Administrator\oradata\ORCL\PLGDB
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\oradata\ORCL\PLGDB -RECURSE false ) 
mkdir C:\app\Administrator\product\19.0.0\dbhome_1\database
if %ERRORLEVEL% == 0 ( C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH C:\app\Administrator\product\19.0.0\dbhome_1\database -RECURSE false ) 
set PERL5LIB=%ORACLE_HOME%/rdbms/admin;%PERL5LIB%
set ORACLE_SID=orcl
set PATH=%ORACLE_HOME%\bin;%ORACLE_HOME%\perl\bin;%PATH%
C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -new -sid ORCL -startmode manual -spfile 
C:\app\Administrator\product\19.0.0\dbhome_1\bin\oradim.exe -edit -sid ORCL -startmode auto -srvcstart system 
C:\app\Administrator\product\19.0.0\dbhome_1\bin\sqlplus /nolog @C:\app\Administrator\admin\orcl\scripts\orcl.sql
