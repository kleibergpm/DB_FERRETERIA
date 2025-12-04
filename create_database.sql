-- Script: 01_create_pdb_ferreteria_db.sql
-- Crea una nueva PDB y asigna C##KLEIBER como usuario principal

--  contenedor raíz
ALTER SESSION SET CONTAINER = CDB$ROOT;

-- Crear la nueva PDB.. -- cambiar las rutas segun su instalacion de Oracle.. si no funciona, pruebe sin las rutas
CREATE PLUGGABLE DATABASE FERRETERIA_DB
ADMIN USER C##KLEIBER IDENTIFIED BY root   
ROLES = (DBA)
DEFAULT TABLESPACE users
DATAFILE 'C:\app\kleib\oradata\XE\ferreteria_db\users01.dbf' SIZE 500M AUTOEXTEND ON
FILE_NAME_CONVERT = (
  'C:\app\kleib\oradata\XE\pdbseed\',  
  'C:\app\kleib\oradata\XE\ferreteria_db\'
); 

-- Abrir la PDB y guardar su estado
ALTER PLUGGABLE DATABASE FERRETERIA_DB OPEN;
ALTER PLUGGABLE DATABASE FERRETERIA_DB SAVE STATE;

