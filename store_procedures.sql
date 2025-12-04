-- Procedimiento 1: Insertar nuevo cliente
CREATE OR REPLACE PROCEDURE sp_insertar_cliente(
  p_nombre IN VARCHAR2,
  p_cedula IN VARCHAR2,
  p_telefono IN VARCHAR2,
  p_direccion IN VARCHAR2
) AS
BEGIN
  INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion)
  VALUES (seq_clientes.NEXTVAL, p_nombre, p_cedula, p_telefono, p_direccion);
END;
/

-- Procedimiento 2: Actualizar precio de producto
CREATE OR REPLACE PROCEDURE sp_actualizar_precio_producto(
  p_id_producto IN NUMBER,
  p_nuevo_precio IN NUMBER
) AS
BEGIN
  UPDATE productos SET precio_venta = p_nuevo_precio WHERE id_producto = p_id_producto;
END;
/

-- Procedimiento 3: Calcular total factura
CREATE OR REPLACE PROCEDURE sp_calcular_total_factura(
  p_id_factura IN NUMBER
) AS
  v_total NUMBER;
BEGIN
  SELECT SUM(subtotal) INTO v_total
  FROM detalle_factura
  WHERE id_factura = p_id_factura;

  UPDATE facturas SET total = v_total WHERE id_factura = p_id_factura;
END;
/
