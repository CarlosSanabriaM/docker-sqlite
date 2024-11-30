/* This script creates the tables for the pedidos database */

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER NOT NULL PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL,
    calle VARCHAR(20),
    ciudad VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    calle VARCHAR(20),
    ciudad VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS productos ( 
    id_producto INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    existencias INTEGER,
    precio INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INTEGER NOT NULL PRIMARY KEY,
    id_cliente INTEGER,
    id_empleado INTEGER,
    fecha_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
);

CREATE TABLE IF NOT EXISTS detalles_pedido (
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
