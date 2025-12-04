-- Crear factura
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado)
VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 0, 2, 2);

-- Obtener ID
SELECT seq_facturas.CURRVAL AS id_factura_actual FROM dual;
-- Supongamos que devuelve 7

-- Insertar productos (con descuento del 10% en la pintura roja FER015)
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario)
VALUES (seq_detalle_factura.NEXTVAL, 7, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER008'), 2, 18.91);

-- Aplicar promoción pintura roja (10% descuento)
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario)
VALUES (
    seq_detalle_factura.NEXTVAL,
    7,
    (SELECT id_producto FROM productos WHERE codigo_barras = 'FER015'),
    1,
    ROUND(31.68 * 0.90, 2) -- descuento aplicado
);

-- Actualizar total
UPDATE facturas
SET total = (
    SELECT SUM(cantidad * precio_unitario)
    FROM detalle_factura
    WHERE id_factura = 9
)
WHERE id_factura = 9;

COMMIT;
