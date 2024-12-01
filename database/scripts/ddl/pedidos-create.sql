/* This script creates the tables for the pedidos database */

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INTEGER NOT NULL PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL,
    calle VARCHAR(20),
    ciudad VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS empleado (
    id_empleado INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    calle VARCHAR(20),
    ciudad VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS producto ( 
    id_producto INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    existencias INTEGER,
    precio INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INTEGER NOT NULL PRIMARY KEY,
    id_cliente INTEGER,
    id_empleado INTEGER,
    fecha_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
