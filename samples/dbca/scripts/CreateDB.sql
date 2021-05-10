CREATE DATABASE "orcl"
  USER SYS IDENTIFIED BY "manager"
  USER SYSTEM IDENTIFIED BY "manager"
  CONTROLFILE REUSE
  MAXDATAFILES 1024
  MAXINSTANCES 8
  CHARACTER SET AL32UTF8
  NATIONAL CHARACTER SET AL16UTF16
  SET DEFAULT SMALLFILE TABLESPACE
-- <<** database_logging_clauses
  LOGFILE 
    GROUP 1 ( 'C:\app\Administrator\oradata\ORCL\redo01.log', 'C:\app\Administrator\oradata\ORCL\redo02.log', 'C:\app\Administrator\oradata\ORCL\redo03.log') SIZE 200M BLOCKSIZE 16K REUSE,
    GROUP 2 ( 'C:\app\Administrator\oradata\ORCL\redo01.log', 'C:\app\Administrator\oradata\ORCL\redo02.log', 'C:\app\Administrator\oradata\ORCL\redo03.log') SIZE 200M BLOCKSIZE 16K REUSE,
    GROUP 3 ( 'C:\app\Administrator\oradata\ORCL\redo01.log', 'C:\app\Administrator\oradata\ORCL\redo02.log', 'C:\app\Administrator\oradata\ORCL\redo03.log') SIZE 200M BLOCKSIZE 16K REUSE

  MAXLOGFILES 16
  MAXLOGMEMBERS 3
  MAXLOGHISTORY 1
  ARCHIVELOG
  FORCE LOGGING
  SET STANDBY NOLOGGING FOR DATA AVAILABILITY
-- **>> database_logging_clauses
-- <<** tablespace_clauses
  EXTENT MANAGEMENT LOCAL
  DATAFILE
     'C:\app\Administrator\oradata\ORCL\system01.dbf' SIZE 700M REUSE AUTOEXTEND ON NEXT 10240K MAXSIZE UNLIMITED,
     'C:\app\Administrator\oradata\ORCL\system02.dbf' SIZE 700M REUSE AUTOEXTEND ON NEXT 10240K MAXSIZE UNLIMITED
  SYSAUX DATAFILE
     'C:\app\Administrator\oradata\ORCL\sysaux01.dbf' SIZE 550M REUSE AUTOEXTEND ON NEXT 10240K MAXSIZE UNLIMITED,
     'C:\app\Administrator\oradata\ORCL\sysaux02.dbf' SIZE 550M REUSE AUTOEXTEND ON NEXT 10240K MAXSIZE UNLIMITED
  DEFAULT TABLESPACE USERS
    DATAFILE  'C:\app\Administrator\oradata\ORCL\users01.dbf' SIZE 5M REUSE AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL
  SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP
    TEMPFILE
     'C:\app\Administrator\oradata\ORCL\temp01.dbf' SIZE 20M REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED,
     'C:\app\Administrator\oradata\ORCL\temp02.dbf' SIZE 20M REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL
  SMALLFILE UNDO TABLESPACE UNDOTBS1
    DATAFILE
     'C:\app\Administrator\oradata\ORCL\undotbs01.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT 5120K MAXSIZE UNLIMITED,
     'C:\app\Administrator\oradata\ORCL\undotbs02.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT 5120K MAXSIZE UNLIMITED
  -- **>> tablespace_clauses
  SET TIME_ZONE = 'Asia/Tokyo'
  SMALLFILE USER_DATA TABLESPACE USERDATA
    DATAFILE
     'C:\app\Administrator\oradata\ORCL\user01.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT 5120K MAXSIZE UNLIMITED,
     'C:\app\Administrator\oradata\ORCL\user02.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT 5120K MAXSIZE UNLIMITED
  

  ENABLE PLUGGABLE DATABASE
   SEED
    SYSTEM DATAFILE 5M AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
SYSAUX DATAFILE 5M AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
LOCAL UNDO ON





