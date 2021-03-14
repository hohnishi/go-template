{{/* define variables */ -}}
{{$ob := .ORACLE_BASE -}}
{{$oh := .ORACLE_HOME -}}
{{$oradim := printf "%s\\bin\\oradim.exe" $oh -}}
{{$sqlplus := printf "%s\\bin\\sqlplus" $oh -}}
{{/* ================ */ -}}
mkdir {{$ob}}
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}} -RECURSE false ) 
mkdir {{$ob}}\admin\{{.SID}}\adump
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}}\admin\{{.SID}}\adump -RECURSE false ) 
mkdir {{$ob}}\admin\{{.SID}}\dpdump
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}}\admin\{{.SID}}\dpdump -RECURSE false ) 
mkdir {{$ob}}\admin\{{.SID}}\pfile
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}}\admin\{{.SID}}\pfile -RECURSE false ) 
mkdir {{$ob}}\audit
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}}\audit -RECURSE false ) 
mkdir {{$ob}}\cfgtoollogs\dbca\{{.SID}}
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$ob}}\cfgtoollogs\dbca\{{.SID}} -RECURSE false ) 
mkdir {{.DB_BASE}}
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{.DB_BASE}} -RECURSE false ) 
mkdir {{.SEED_BASE}}
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{.SEED_BASE}} -RECURSE false ) 
mkdir {{.PDB_BASE}}
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{.PDB_BASE}} -RECURSE false ) 
mkdir {{$oh}}\database
if %ERRORLEVEL% == 0 ( {{$oradim}} -ACL -setperm diag -USER NT AUTHORITY\SYSTEM -OBJTYPE dir -OBJPATH {{$oh}}\database -RECURSE false ) 
set PERL5LIB=%ORACLE_HOME%/rdbms/admin;%PERL5LIB%
set ORACLE_SID={{.SID}}
set PATH=%ORACLE_HOME%\bin;%ORACLE_HOME%\perl\bin;%PATH%
{{$oradim}} -new -sid {{.SID_U}} -startmode manual -spfile 
{{$oradim}} -edit -sid {{.SID_U}} -startmode auto -srvcstart system 
{{$sqlplus}} /nolog @{{.SCRIPT_DIR}}\{{.SID}}.sql
