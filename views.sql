-- Vista 1: Productos con información de proveedor y categoría
CREATE OR REPLACE VIEW vista_productos_detalle AS
SELECT p.id_producto, p.nombre, p.precio_venta, c.nombre_categoria, pr.nombre_proveedor
FROM productos p
JOIN categorias_producto c ON p.id_categoria = c.id_categoria
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor;

-- Vista 2: Stock por almacén
CREATE OR REPLACE VIEW vista_stock_almacenes AS
SELECT a.nombre AS nombre_almacen, p.nombre AS producto, s.cantidad, s.cantidad_minima
FROM stock s
JOIN almacenes a ON s.id_almacen = a.id_almacen
JOIN productos p ON s.id_producto = p.id_producto;

-- Vista 3: Facturas con totales y cliente
CREATE OR REPLACE VIEW vista_facturas_cliente AS
SELECT f.id_factura, f.fecha, c.nombre_cliente, f.total
FROM facturas f
JOIN clientes c ON f.id_cliente = c.id_cliente;
