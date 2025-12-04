-- Crear factura
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado)
VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 0, 3, 4);

-- Obtener ID
SELECT seq_facturas.CURRVAL AS id_factura_actual FROM dual;
-- Supongamos que devuelve 8

-- Insertar detalle
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario)
VALUES (seq_detalle_factura.NEXTVAL, 8, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER001'), 4, 350.00);

INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario)
VALUES (seq_detalle_factura.NEXTVAL, 8, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER015'), 6, 112.40);

-- Actualizar total
UPDATE facturas
SET total = (
    SELECT SUM(cantidad * precio_unitario)
    FROM detalle_factura
    WHERE id_factura = 10
)
WHERE id_factura = 10;

COMMIT;
