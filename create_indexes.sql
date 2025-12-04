-- Indices unicos
CREATE UNIQUE INDEX uk_stock ON stock(id_almacen, id_producto);

-- indices para busquedas frecuentes
CREATE INDEX idx_productos_nombre ON productos(nombre);
CREATE INDEX idx_clientes_cedula ON clientes(cedula);
CREATE INDEX idx_promociones_producto ON promociones(id_producto);
