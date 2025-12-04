-- Trigger para actualizar fecha_modificacion de almacenes
CREATE OR REPLACE TRIGGER trg_update_almacenes
BEFORE UPDATE ON almacenes
FOR EACH ROW
BEGIN
   :NEW.fecha_modificacion := CURRENT_TIMESTAMP;
END;
/

-- Ejemplo de trigger de auditoría para inserciones en facturas
CREATE OR REPLACE TRIGGER trg_insert_facturas
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('Factura ' || :NEW.id_factura || ' creada el ' || :NEW.fecha);
END;
/
