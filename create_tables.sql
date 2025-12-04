-- Elimina todas las secuencias existentes
BEGIN
  FOR seq_rec IN (SELECT sequence_name FROM user_sequences WHERE sequence_name LIKE 'SEQ_%') LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || seq_rec.sequence_name;
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- elimina las tablas existentes
BEGIN
  FOR tab_rec IN (SELECT table_name FROM user_tables WHERE table_name IN (
    'CATEGORIAS_PRODUCTO','PROVEEDORES','CLIENTES','EMPLEADOS','ALMACENES','PRODUCTOS','STOCK',
    'PROMOCIONES','FACTURAS','DETALLE_FACTURA','PEDIDOS_PROVEEDOR','DETALLE_PEDIDO','LOGS_AUDITORIA'
  )) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || tab_rec.table_name || ' PURGE';
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- crea las secuencias
CREATE SEQUENCE seq_categorias_producto START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_proveedores START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_empleados START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_almacenes START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_productos START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_stock START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_promociones START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_facturas START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_detalle_factura START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_pedidos_proveedor START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_detalle_pedido START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_metodos_pago START WITH 1 INCREMENT BY 1;


-- crear las tablas

CREATE TABLE categorias_producto (
    id_categoria NUMBER PRIMARY KEY,
    nombre_categoria VARCHAR2(50) NOT NULL
);

CREATE TABLE proveedores (
    id_proveedor NUMBER PRIMARY KEY,
    nombre_proveedor VARCHAR2(100) NOT NULL
);

CREATE TABLE clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre_cliente VARCHAR2(50) NOT NULL,
    cedula VARCHAR2(15) UNIQUE,
    telefono VARCHAR2(15),
    direccion VARCHAR2(100)
);

CREATE TABLE empleados (
    id_empleado NUMBER PRIMARY KEY,
    nombre_empleado VARCHAR2(50) NOT NULL,
    puesto VARCHAR2(30),
    usuario VARCHAR2(20),
    contrasena VARCHAR2(100)
);

CREATE TABLE almacenes (
    id_almacen NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    direccion VARCHAR2(200),
    ciudad VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(20),
    email VARCHAR2(100) UNIQUE,
    capacidad_max NUMBER,
    fecha_apertura DATE,
    activo NUMBER(1) DEFAULT 1 CHECK (activo IN (0,1)),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos (
    id_producto NUMBER PRIMARY KEY,
    codigo_barras VARCHAR2(50) NOT NULL UNIQUE,
    nombre VARCHAR2(150) NOT NULL,
    descripcion CLOB,
    categoria VARCHAR2(50) NOT NULL,
    precio_compra NUMBER(10,2) NOT NULL,
    precio_venta NUMBER(10,2) NOT NULL,
    peso NUMBER(8,2),
    activo NUMBER(1) DEFAULT 1 CHECK (activo IN (0,1)),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria NUMBER,
    id_proveedor NUMBER,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias_producto(id_categoria),
    CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE stock (
    id_stock NUMBER PRIMARY KEY,
    id_almacen NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    cantidad NUMBER DEFAULT 0 NOT NULL,
    cantidad_minima NUMBER DEFAULT 10 NOT NULL,
    ubicacion_fisica VARCHAR2(50),
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_stock UNIQUE (id_almacen, id_producto),
    CONSTRAINT fk_stock_almacen FOREIGN KEY (id_almacen) REFERENCES almacenes(id_almacen),
    CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE promociones (
    id_promocion NUMBER PRIMARY KEY,
    id_producto NUMBER NOT NULL,
    tipo_descuento VARCHAR2(20) DEFAULT 'PORCENTAJE' CHECK (tipo_descuento IN ('PORCENTAJE','MONTO_FIJO')),
    valor_descuento NUMBER(10,2) NOT NULL,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL,
    cantidad_minima NUMBER DEFAULT 1,
    activa NUMBER(1) DEFAULT 1 CHECK (activa IN (0,1)),
    descripcion VARCHAR2(200),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_promociones_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE facturas (
    id_factura NUMBER PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMBER(10,2),
    id_cliente NUMBER NOT NULL,
    id_empleado NUMBER NOT NULL,
    CONSTRAINT fk_facturas_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_facturas_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE detalle_factura (
    id_detalle NUMBER PRIMARY KEY,
    id_factura NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    cantidad NUMBER NOT NULL,
    precio_unitario NUMBER(10,2) NOT NULL,
    subtotal NUMBER(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) VIRTUAL,
    CONSTRAINT fk_detalle_factura FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pedidos_proveedor (
    id_pedido NUMBER PRIMARY KEY,
    id_proveedor NUMBER NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR2(20) DEFAULT 'PENDIENTE' CHECK (estado IN ('PENDIENTE','EN_CAMINO','RECIBIDO','CANCELADO')),
    total NUMBER(10,2) DEFAULT 0,
    CONSTRAINT fk_pedidos_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE detalle_pedido (
    id_detalle_pedido NUMBER PRIMARY KEY,
    id_pedido NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    cantidad NUMBER NOT NULL,
    precio_compra NUMBER(10,2) NOT NULL,
    subtotal NUMBER(10,2) GENERATED ALWAYS AS (cantidad * precio_compra) VIRTUAL,
    CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos_proveedor(id_pedido),
    CONSTRAINT fk_detalle_producto_pedido FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE logs_auditoria (
    id_log NUMBER PRIMARY KEY,
    tabla_afectada VARCHAR2(50),
    accion VARCHAR2(10),  
    usuario VARCHAR2(30),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR2(500)
);

CREATE TABLE metodos_pago (
    id_metodo_pago      NUMBER PRIMARY KEY,
    nombre_metodo       VARCHAR2(50) NOT NULL,
    descripcion         VARCHAR2(200),
    activo              NUMBER(1) DEFAULT 1,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE envios (
    id_envio            NUMBER PRIMARY KEY,
    id_factura          NUMBER NOT NULL,
    direccion_envio     VARCHAR2(200) NOT NULL,
    ciudad              VARCHAR2(100),
    fecha_envio         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    empresa_transporte  VARCHAR2(100),
    estado_envio        VARCHAR2(30) DEFAULT 'PENDIENTE',
    fecha_entrega       TIMESTAMP NULL,
    observaciones       VARCHAR2(300),
    CONSTRAINT fk_envio_factura FOREIGN KEY (id_factura)
        REFERENCES facturas(id_factura)
);
