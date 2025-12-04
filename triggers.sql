-- Trigger 1: Actualiza fecha de modificación en almacenes
CREATE OR REPLACE TRIGGER trg_almacenes_mod
BEFORE UPDATE ON almacenes
FOR EACH ROW
BEGIN
  :NEW.fecha_modificacion := CURRENT_TIMESTAMP;
END;
/

-- Trigger 2: Auditoría general
CREATE OR REPLACE TRIGGER trg_auditoria
AFTER INSERT OR UPDATE OR DELETE ON productos
FOR EACH ROW
DECLARE
  v_accion VARCHAR2(10);
BEGIN
  IF INSERTING THEN v_accion := 'INSERT';
  ELSIF UPDATING THEN v_accion := 'UPDATE';
  ELSIF DELETING THEN v_accion := 'DELETE';
  END IF;

  INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion)
  VALUES (seq_detalle_factura.NEXTVAL, 'PRODUCTOS', v_accion, USER, 'Cambio en tabla productos');
END;
/

-- Trigger 3: Actualiza stock al insertar detalle_factura
CREATE OR REPLACE TRIGGER trg_update_stock_factura
AFTER INSERT ON detalle_factura
FOR EACH ROW
BEGIN
  UPDATE stock
  SET cantidad = cantidad - :NEW.cantidad,
      fecha_actualizacion = CURRENT_TIMESTAMP
  WHERE id_producto = :NEW.id_producto;
END;
/

-- trigger 4: Auditoría detallada para productos

CREATE OR REPLACE TRIGGER trg_auditoria_productos
AFTER INSERT OR UPDATE OR DELETE ON productos
FOR EACH ROW
DECLARE
    v_accion       VARCHAR2(10);
    v_descripcion  VARCHAR2(500);
BEGIN
    IF INSERTING THEN
        v_accion := 'INSERT';
        v_descripcion := 'Se insertó un nuevo producto: ' || :NEW.nombre;
    ELSIF UPDATING THEN
        v_accion := 'UPDATE';
        v_descripcion := 'Se actualizó producto: ' || :OLD.nombre;
    ELSIF DELETING THEN
        v_accion := 'DELETE';
        v_descripcion := 'Se eliminó producto: ' || :OLD.nombre;
    END IF;

    INSERT INTO logs_auditoria (
        id_log,
        tabla_afectada,
        accion,
        usuario,
        descripcion
    ) VALUES (
        seq_logs_auditoria.NEXTVAL,
        'PRODUCTOS',
        v_accion,
        SYS_CONTEXT('USERENV','SESSION_USER'),
        v_descripcion
    );
END;
/
-- trigger 5: Auditoría detallada para facturas

CREATE OR REPLACE TRIGGER trg_auditoria_facturas
AFTER INSERT OR UPDATE OR DELETE ON facturas
FOR EACH ROW
DECLARE
    v_accion       VARCHAR2(10);
    v_descripcion  VARCHAR2(500);
BEGIN
    IF INSERTING THEN
        v_accion := 'INSERT';
        v_descripcion := 'Factura creada ID: ' || :NEW.id_factura;
    ELSIF UPDATING THEN
        v_accion := 'UPDATE';
        v_descripcion := 'Factura modificada ID: ' || :OLD.id_factura;
    ELSIF DELETING THEN
        v_accion := 'DELETE';
        v_descripcion := 'Factura eliminada ID: ' || :OLD.id_factura;
    END IF;

    INSERT INTO logs_auditoria (
        id_log,
        tabla_afectada,
        accion,
        usuario,
        descripcion
    ) VALUES (
        seq_logs_auditoria.NEXTVAL,
        'FACTURAS',
        v_accion,
        SYS_CONTEXT('USERENV','SESSION_USER'),
        v_descripcion
    );
END;
/

-- trigger 6: Asigna mtodo de pago por defecto en facturas
CREATE OR REPLACE TRIGGER trg_facturas_metodo_pago_default
BEFORE INSERT ON facturas
FOR EACH ROW
DECLARE
    v_id_metodo_pago NUMBER;
BEGIN
    BEGIN
        SELECT id_metodo_pago
        INTO v_id_metodo_pago
        FROM metodos_pago
        WHERE UPPER(nombre_metodo) = 'EFECTIVO'
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_id_metodo_pago := NULL; 
    END;

    -- Si el campo id_metodo_pago viene vacío, se asigna automáticamente
    IF :NEW.id_metodo_pago IS NULL THEN
        :NEW.id_metodo_pago := v_id_metodo_pago;
    END IF;
END;
/
