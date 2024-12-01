/* This script inserts data into the tables of the pedido database */


/* Delete all the previous data from the tables */

DELETE FROM detalle_pedido;
DELETE FROM pedido;
DELETE FROM cliente;
DELETE FROM empleado;
DELETE FROM producto;


/* Insert clients */

INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (1, 'JUAN', 'URIA', 'GIJON');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (2, 'MANUEL', 'URIA', 'OVIEDO');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (3, 'LUIS', 'PENALBA', 'MIERES');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (4, 'JOSE', 'LOS ROSALES', 'MIERES');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (5, 'FERNANDO', 'LLANEZA', 'GIJON');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (6, 'JUAN', 'LOS MOROS', 'GIJóN');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (7, 'JUAN', 'URIA', 'OVIEDO');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (8, 'PEDRO', 'BARGANIZA', 'AVILES');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (9, 'ELDA', 'LAS CLOTAS', 'GIJON');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (10, 'Juan', 'Uría', 'Gijon');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (11, 'Antonio', 'Uría', 'Gijon');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (12, 'Javier', 'Tomas y Valiente', 'Gijón');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (13, 'Efren', 'Los Moros', 'Gijon');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (14, 'Isaac', 'Coronel Aranda', 'Oviedo');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (15, 'Ramon', 'Coronel Aranda', 'Oviedo');
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (16, 'Juan', 'Sagasta', 'Madrid');


/* Insert employees */
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (1, 'JUAN', 'URIA', 'GIJON');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (2, 'PEDRO', 'VERSALLES', 'AVILES');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (3, 'MARIA', 'MIERES', 'GIJON');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (4, 'CELIA', 'GARCIA', 'GIJON');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (5, 'FELIPE', 'URIA', 'OVIEDO');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (6, 'NATALIA', 'GIL DE JAZ', 'OVIEDO');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (7, 'VICENTE', 'CERVANTES', 'OVIEDO');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (8, 'JORGE', 'QUEVEDO', 'GIJON');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (9, 'PEDRO', 'MIERES', 'GIJON');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (10, 'Juan', 'Uría', 'Gijon');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (11, 'Juan', 'Uría', 'Gijon');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (12, 'Jorge', 'Uría', 'Gijon');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (13, 'Javier', 'Uría', 'Oviedo');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (14, 'Manuel', 'Garcia', 'Gijon');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (15, 'Juan', 'Mayor', 'Aviles');
INSERT INTO empleado (id_empleado, nombre, calle, ciudad) VALUES (16, 'Juan', 'El Puerto', 'Aviles');


/* Insert products */
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (1, 'LIMON', 300, 3);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (2, 'PERA', 500, 3);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (3, 'PLATANO', 560, 2);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (4, 'CIRUELA', 400, 4);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (5, 'NARANJA', 300, 2);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (6, 'BERENJENA', 300, 3);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (7, 'CALABACIN', 450, 3);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (8, 'PEPINO', 400, 3);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (9, 'GRANADA', 280, 5);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (10, 'PATATA', 500, 3.5);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (11, 'ARROZ', 200, 9.5);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (12, 'LENTEJAS', 700, 3.6);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (13, 'LECHUGA', 200, 0.7);
INSERT INTO producto (id_producto, nombre, existencias, precio) VALUES (14, 'MANZANA', 100, 6.8);

/* Insert orders */
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (1, 1, 1, '01-01-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (2, 1, 1, '04-01-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (3, 2, 2, '01-01-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (4, 4, 1, '03-02-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (5, 3, 3, '04-02-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (6, 4, NULL, '01-01-2008');   /* an order without employee */
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (7, 5, 2, '03-09-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (8, 5, 2, '03-09-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (9, 5, 2, '03-09-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (10, NULL, 2, '03-12-2008');  /* an order without client */
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (11, 1, 3, '12-04-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (12, 1, 2, '12-01-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (13, 2, 2, '09-05-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (14, NULL, 2, '09-05-2008');  /* an order without client */
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (15, 3, 2, '09-05-2008');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (16, 3, 3, '10-03-2009');
INSERT INTO pedido (id_pedido, id_cliente, id_empleado, fecha_pedido) VALUES (17, 3, 4, '12-03-2009');

/* Insert order details */
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (1, 1, 8);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (1, 2, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (1, 3, 9);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (1, 4, 11);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (1, 5, 18);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (2, 1, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (2, 3, 12);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (2, 4, 60);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (3, 1, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (3, 4, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (3, 5, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (3, 6, 20);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (4, 1, 50);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (4, 2, 20);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (4, 3, 10);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (5, 1, 15);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (5, 2, 22);
INSERT INTO detalle_pedido (id_pedido,id_producto, cantidad) VALUES (6, 1, 9);
