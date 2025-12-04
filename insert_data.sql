   
-- Insertar los proveedores

INSERT INTO proveedores (id_proveedor, nombre_proveedor) VALUES (seq_proveedores.NEXTVAL, 'Proveedor Nacional de Herramientas');
INSERT INTO proveedores (id_proveedor, nombre_proveedor) VALUES (seq_proveedores.NEXTVAL, 'Suministros Industriales Caribe');
INSERT INTO proveedores (id_proveedor, nombre_proveedor) VALUES (seq_proveedores.NEXTVAL, 'Materiales de Construcción del Sur');


-- Insertar las categorías de productos

INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Herramientas Manuales');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Herramientas Eléctricas');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Materiales Construcción');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Pinturas');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Plomería');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Electricidad');
INSERT INTO categorias_producto (id_categoria, nombre_categoria) VALUES (seq_categorias_producto.NEXTVAL, 'Ferretería General');

-- insertar los almacenes

INSERT INTO almacenes (id_almacen, nombre, direccion, ciudad, telefono, email, capacidad_max, fecha_apertura)
VALUES (seq_almacenes.NEXTVAL, 'Almacen Principal Centro', 'Av. Duarte 123', 'Santo Domingo', '809-555-0001', 'central@ferreteria.com', 20000, TO_DATE('2018-01-15','YYYY-MM-DD'));

INSERT INTO almacenes (id_almacen, nombre, direccion, ciudad, telefono, email, capacidad_max, fecha_apertura)
VALUES (seq_almacenes.NEXTVAL, 'Almacen Zona Norte', 'Calle Restauración 456', 'Santiago', '809-555-0002', 'norte@ferreteria.com', 12000, TO_DATE('2019-03-20','YYYY-MM-DD'));

INSERT INTO almacenes (id_almacen, nombre, direccion, ciudad, telefono, email, capacidad_max, fecha_apertura)
VALUES (seq_almacenes.NEXTVAL, 'Almacen Zona Este', 'Av. Libertad 789', 'La Romana', '809-555-0003', 'este@ferreteria.com', 8000, TO_DATE('2020-06-10','YYYY-MM-DD'));

INSERT INTO almacenes (id_almacen, nombre, direccion, ciudad, telefono, email, capacidad_max, fecha_apertura)
VALUES (seq_almacenes.NEXTVAL, 'Almacen Sur', 'Calle Principal 321', 'San Cristóbal', '809-555-0004', 'sur@ferreteria.com', 9000, TO_DATE('2021-02-01','YYYY-MM-DD'));


-- Insertar empleados

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena) 
VALUES (seq_empleados.NEXTVAL, 'Kleiber Perez', 'Cajero', 'kperez', '1234');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena) 
VALUES (seq_empleados.NEXTVAL, 'Vladimir Mendez', 'Vendedor', 'vmendez', 'abcd');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena) 
VALUES (seq_empleados.NEXTVAL, 'Carlos Mota', 'Administrador', 'cgomez', 'admin');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena) 
VALUES (seq_empleados.NEXTVAL, 'Enoc Suarez', 'Vendedor', 'esuarez', 'pass123');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena) 
VALUES (seq_empleados.NEXTVAL, 'Enmanuel Henriquez', 'Administrador', 'EHenriquez', 'root');

-- Propietario / Gerente General
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (1, 'Juan Perez', 'Gerente General', 'jperez', 'pass123');

-- Gerente Administrativo / Contabilidad
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (2, 'Maria Lopez', 'Gerente Administrativo / Contabilidad', 'mlopez', 'pass123');

-- Jefe de Almacén (Administrativo)
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (3, 'Manuel Diaz', 'Jefe de Almacén', 'mdiaz', 'pass123');

-- Gerente de Operaciones
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (4, 'Ana Torres', 'Gerente de Operaciones', 'atorres', 'pass123');

-- Jefe de Almacén (Operaciones)
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (5, 'Luis Gomez', 'Jefe de Almacén', 'lgomez', 'pass123');

-- Personal de Recepción e Inventario
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (6, 'Paula Martinez', 'Recepción e Inventario', 'pmartinez', 'pass123');

-- Gerente Comercial
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (7, 'Jose Ramirez', 'Gerente Comercial', 'jramirez', 'pass123');

-- Jefes de Tienda (Sucursal 1, Sucursal 2...)
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (8, 'Sofia Herrera', 'Jefe de Tienda Sucursal 1', 'sherrera', 'pass123');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (9, 'Ricardo Soto', 'Jefe de Tienda Sucursal 2', 'rsoto', 'pass123');

-- Equipo de Ventas y Cajas
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (10, 'Elena Vargas', 'Ventas y Cajas', 'evargas', 'pass123');

INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (11, 'Miguel Rojas', 'Ventas y Cajas', 'mrojas', 'pass123');

-- Gerente de Compras / Proveedores
INSERT INTO empleados (id_empleado, nombre_empleado, puesto, usuario, contrasena)
VALUES (12, 'Patricia Medina', 'Gerente de Compras / Proveedores', 'pmedina', 'pass123');



--- Clientes
INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion) 
VALUES (seq_clientes.NEXTVAL, 'Jose Rodriguez', '001-1234567-8', '809-555-1000', 'Av. Independencia 55');

INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion) 
VALUES (seq_clientes.NEXTVAL, 'Ana Martinez', '002-2345678-9', '809-555-2000', 'Calle El Sol 12');

INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion) 
VALUES (seq_clientes.NEXTVAL, 'Carlos Lopez', '003-3456789-0', '809-555-3000', 'Av. Bolivar 78');

INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion) 
VALUES (seq_clientes.NEXTVAL, 'Maria Garcia', '004-4567890-1', '809-555-4000', 'Calle Duarte 45');

INSERT INTO clientes (id_cliente, nombre_cliente, cedula, telefono, direccion) 
VALUES (seq_clientes.NEXTVAL, 'Pedro Sanchez', '005-5678901-2', '809-555-5000', 'Av. Mella 22');

-- 2. Facturas 
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado) VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 150.50, 1, 1);
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado) VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 89.75, 2, 2);
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado) VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 220.00, 3, 3);
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado) VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 175.25, 4, 1);
INSERT INTO facturas (id_factura, fecha, total, id_cliente, id_empleado) VALUES (seq_facturas.NEXTVAL, CURRENT_TIMESTAMP, 95.80, 5, 2);

-- Detalle_factura
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario) VALUES (seq_detalle_factura.NEXTVAL, 1, 1, 2, 75.25);
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario) VALUES (seq_detalle_factura.NEXTVAL, 2, 2, 1, 89.75);
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario) VALUES (seq_detalle_factura.NEXTVAL, 3, 3, 3, 73.33);
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario) VALUES (seq_detalle_factura.NEXTVAL, 4, 4, 1, 175.25);
INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad, precio_unitario) VALUES (seq_detalle_factura.NEXTVAL, 5, 5, 4, 23.95);

--  Pedidos_proveedor 
INSERT INTO pedidos_proveedor (id_pedido, id_proveedor, fecha_pedido, estado, total) VALUES (seq_pedidos_proveedor.NEXTVAL, 1, CURRENT_TIMESTAMP, 'PENDIENTE', 500.00);
INSERT INTO pedidos_proveedor (id_pedido, id_proveedor, fecha_pedido, estado, total) VALUES (seq_pedidos_proveedor.NEXTVAL, 2, CURRENT_TIMESTAMP, 'EN_CAMINO', 300.00);
INSERT INTO pedidos_proveedor (id_pedido, id_proveedor, fecha_pedido, estado, total) VALUES (seq_pedidos_proveedor.NEXTVAL, 3, CURRENT_TIMESTAMP, 'RECIBIDO', 750.50);
INSERT INTO pedidos_proveedor (id_pedido, id_proveedor, fecha_pedido, estado, total) VALUES (seq_pedidos_proveedor.NEXTVAL, 1, CURRENT_TIMESTAMP, 'PENDIENTE', 200.75);
INSERT INTO pedidos_proveedor (id_pedido, id_proveedor, fecha_pedido, estado, total) VALUES (seq_pedidos_proveedor.NEXTVAL, 2, CURRENT_TIMESTAMP, 'CANCELADO', 0.00);

--  Detalle_pedido 
INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_compra) VALUES (seq_detalle_pedido.NEXTVAL, 1, 1, 10, 50.00);
INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_compra) VALUES (seq_detalle_pedido.NEXTVAL, 2, 2, 5, 60.00);
INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_compra) VALUES (seq_detalle_pedido.NEXTVAL, 3, 3, 8, 93.81);
INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_compra) VALUES (seq_detalle_pedido.NEXTVAL, 4, 4, 2, 100.38);
INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_compra) VALUES (seq_detalle_pedido.NEXTVAL, 5, 5, 3, 66.67);

-- Logs_auditoria 
INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_logs_auditoria.NEXTVAL, 'productos', 'UPDATE', 'CMOTA', 'Precio actualizado');
INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_logs_auditoria.NEXTVAL, 'facturas', 'INSERT', 'KPEREZ', 'Nueva factura creada');
INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_logs_auditoria.NEXTVAL, 'clientes', 'INSERT', 'VMENDEZ', 'Nuevo cliente agregado');
INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_logs_auditoria.NEXTVAL, 'pedidos_proveedor', 'UPDATE', 'CMOTA', 'Estado cambiado a RECIBIDO');
INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_logs_auditoria.NEXTVAL, 'detalle_factura', 'INSERT', 'KPEREZ', 'Detalle de factura agregado');

COMMIT;

-- Insertar productos

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor)
VALUES (seq_productos.NEXTVAL, 'FER001', 'Arena Carpintero 25kg', 'Bolsa arena Carpintero', 'Materiales Construcción', 2.57, 4.32, 26.2, 1, CURRENT_TIMESTAMP, 3, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor)
VALUES (seq_productos.NEXTVAL, 'FER002', 'Cemento Plano 50kg', 'Bolsa cemento Plano', 'Materiales Construcción', 4.19, 7.48, 51.02, 1, CURRENT_TIMESTAMP, 3, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER003', 'Cemento Flexible 50kg', 'Bolsa cemento Flexible', 'Materiales Construcción', 5.18, 11.64, 45.06, 1, CURRENT_TIMESTAMP, 3, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER004', 'Tubo PVC 3/4\"', 'Tubo PVC 3/4', 'Plomería', 9.36, 16.14, 2.18, 1, CURRENT_TIMESTAMP, 5, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER005', 'Llave Portland 12\"', 'Llave Portland', 'Herramientas Manuales', 12.53, 26.1, 0.53, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER006', 'Pintura Blanca 5L', 'Lata pintura Blanca', 'Pinturas', 16.63, 30.51, 5.13, 1, CURRENT_TIMESTAMP, 4, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER007', 'Cable Universal 50m', 'Cable eléctrico Universal', 'Electricidad', 1.23, 2.19, 0.48, 1, CURRENT_TIMESTAMP, 6, 2);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER008', 'Martillo Bola 32oz', 'Martillo Bola cabeza acero', 'Herramientas Manuales', 8.34, 18.91, 0.47, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER009', 'Llave Inglesa 12\"', 'Llave Inglesa', 'Herramientas Manuales', 11.15, 20.02, 0.5, 1, CURRENT_TIMESTAMP, 1, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER010', 'Alicate Phillips 7\"', 'Alicate Phillips', 'Herramientas Manuales', 8.02, 13.04, 0.29, 1, CURRENT_TIMESTAMP, 1, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER011', 'Alicate THHN 8\"', 'Alicate THHN', 'Herramientas Manuales', 8.62, 20.1, 0.3, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER012', 'Alicate Blanca 7\"', 'Alicate Blanca', 'Herramientas Manuales', 8.5, 20.38, 0.28, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER013', 'Cemento Inglesa 50kg', 'Bolsa cemento Inglesa', 'Materiales Construcción', 5.58, 10.81, 45.64, 1, CURRENT_TIMESTAMP, 3, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER014', 'Taladro Plano', 'Taladro Plano 500W', 'Herramientas Eléctricas', 48.25, 81.62, 2.69, 1, CURRENT_TIMESTAMP, 2, 2);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER015', 'Pintura Roja 1L', 'Lata pintura Roja', 'Pinturas', 18.35, 31.68, 4.5, 1, CURRENT_TIMESTAMP, 4, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER016', 'Pintura Roja 20L', 'Lata pintura Roja', 'Pinturas', 22.1, 44.34, 4.61, 1, CURRENT_TIMESTAMP, 4, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER017', 'Arena Portland 25kg', 'Bolsa arena Portland', 'Materiales Construcción', 3.32, 6.74, 26.39, 1, CURRENT_TIMESTAMP, 3, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER018', 'Cemento Plano 25kg', 'Bolsa cemento Plano', 'Materiales Construcción', 4.22, 7.98, 54.85, 1, CURRENT_TIMESTAMP, 3, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER019', 'Tubo PVC 1/2\"', 'Tubo PVC 1/2', 'Plomería', 8.96, 18.4, 1.83, 1, CURRENT_TIMESTAMP, 5, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER020', 'Pintura Negra 1L', 'Lata pintura Negra', 'Pinturas', 21.28, 50.17, 4.67, 1, CURRENT_TIMESTAMP, 4, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER021', 'Cemento Francesa 50kg', 'Bolsa cemento Francesa', 'Materiales Construcción', 5.43, 10.42, 51.72, 1, CURRENT_TIMESTAMP, 3, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER022', 'Llave Carpintero 12\"', 'Llave Carpintero', 'Herramientas Manuales', 9.79, 18.31, 0.51, 1, CURRENT_TIMESTAMP, 1, 3);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER023', 'Alicate Phillips 8\"', 'Alicate Phillips', 'Herramientas Manuales', 8.02, 18.64, 0.32, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER024', 'Martillo Francesa 32oz', 'Martillo Francesa cabeza acero', 'Herramientas Manuales', 8.63, 18.8, 0.54, 1, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO productos (id_producto, codigo_barras, nombre, descripcion, categoria, precio_compra, precio_venta, peso, activo, fecha_creacion, id_categoria, id_proveedor) 
VALUES (seq_productos.NEXTVAL, 'FER025', 'Arena Francesa 50kg', 'Bolsa arena Francesa', 'Materiales Construcción', 2.51, 5.34, 24.27, 1, CURRENT_TIMESTAMP, 3, 1);

-- INSERT DE PROMOCIONES
INSERT INTO promociones (id_promocion, id_producto, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, descripcion, activa, fecha_creacion)
VALUES (seq_promociones.NEXTVAL, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER001'), 'PORCENTAJE', 15.00, TIMESTAMP '2025-11-01 00:00:00', TIMESTAMP '2025-11-30 23:59:59', 'Black Friday Herramientas', 1, CURRENT_TIMESTAMP);

INSERT INTO promociones (id_promocion, id_producto, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, descripcion, activa, fecha_creacion)
VALUES (seq_promociones.NEXTVAL, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER025'), 'PORCENTAJE', 20.00, TIMESTAMP '2025-11-01 00:00:00', TIMESTAMP '2025-11-30 23:59:59', 'Descuento Esmeril', 1, CURRENT_TIMESTAMP);

INSERT INTO promociones ( id_promocion, id_producto, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, descripcion, activa, fecha_creacion)
VALUES (seq_promociones.NEXTVAL,(SELECT id_producto FROM productos WHERE codigo_barras = 'FER015'),'PORCENTAJE', 10.00, TIMESTAMP '2025-11-05 00:00:00', TIMESTAMP '2025-11-15 23:59:59','Descuento Pinturas Rojas – Semana del Color',1,CURRENT_TIMESTAMP);

INSERT INTO promociones ( id_promocion, id_producto, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, descripcion, activa, fecha_creacion)
VALUES (seq_promociones.NEXTVAL, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER008'), 'PORCENTAJE', 25.00, TIMESTAMP '2025-11-20 00:00:00', TIMESTAMP '2025-11-30 23:59:59', 'Black Friday – Martillos con 25% de descuento', 1, CURRENT_TIMESTAMP);

INSERT INTO promociones (id_promocion, id_producto, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, descripcion, activa, fecha_creacion)
VALUES (seq_promociones.NEXTVAL, (SELECT id_producto FROM productos WHERE codigo_barras = 'FER003'),'PORCENTAJE', 18.00, TIMESTAMP '2025-11-10 00:00:00', TIMESTAMP '2025-11-20 23:59:59','Promo Cemento Flexible – 18% off construcción', 1 , CURRENT_TIMESTAMP);

-- INSERT DE STOCK INICIAL
BEGIN
    FOR rec IN (SELECT id_producto FROM productos) LOOP
        INSERT INTO stock (id_stock, id_almacen, id_producto, cantidad, cantidad_minima, ubicacion_fisica, fecha_actualizacion)
        VALUES (seq_stock.NEXTVAL, 1, rec.id_producto, 100, 10, 'Pasillo 1 - Estanteria A', CURRENT_TIMESTAMP);
    END LOOP;
    COMMIT;
END;
/

