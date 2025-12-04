-- Elimina el usuario si existe -- este paso es opcional, pero util para pruebas repetidas 
BEGIN
  EXECUTE IMMEDIATE 'DROP USER C##KLEIBER CASCADE';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- Crea el usuaruio  -- pueden cambiar el password al igual que el user y usen el prefijo C## para el usuario
CREATE USER C##KLEIBER IDENTIFIED BY root123
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users
  CONTAINER = ALL;

GRANT CONNECT, RESOURCE TO C##KLEIBER CONTAINER = ALL;

ALTER SESSION SET CURRENT_SCHEMA = C##KLEIBER;
/
