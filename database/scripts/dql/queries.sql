-- Obtener todos los registros de cada tabla
SELECT * FROM cliente;
SELECT * FROM empleado;
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;

-- Insertar un nuevo cliente con id_cliente = 999
INSERT INTO cliente (id_cliente, nombre, calle, ciudad) VALUES (999, 'Marcos', 'La Paz', 'Gijón');
-- Obtener el cliente con id_cliente = 999
SELECT * FROM cliente where id_cliente = 999;

-- Obtener todos los productos con existencias mayores a 500
SELECT * FROM producto WHERE existencias > 500;

-- Obtener todos los pedidos realizados por el cliente con id_cliente = 1
SELECT * FROM pedido WHERE id_cliente = 1;

-- Obtener el id y el nombre del cliente, junto a la fecha de pedido para cada pedido realizado
SELECT cliente.id_cliente, cliente.nombre, pedido.fecha_pedido
  FROM cliente
  JOIN pedido
    ON cliente.id_cliente = pedido.id_cliente;

-- Obtener el id y el nombre del cliente, junto a una lista de fechas de pedido para cada pedido realizado, agrupados por cliente
SELECT cliente.id_cliente, cliente.nombre, GROUP_CONCAT(pedido.fecha_pedido) AS fechas_pedido
  FROM cliente
  JOIN pedido
    ON cliente.id_cliente = pedido.id_cliente
  GROUP BY cliente.id_cliente;

-- Obtener el nombre del cliente y el nombre del producto para cada detalle de pedido
SELECT cliente.nombre, producto.nombre
  FROM detalle_pedido
       JOIN pedido
       ON detalle_pedido.id_pedido = pedido.id_pedido
       
       JOIN cliente
       ON pedido.id_cliente = cliente.id_cliente
       
       JOIN producto
       ON detalle_pedido.id_producto = producto.id_producto;

-- Obtener todos los empleados que trabajan en Gijón
SELECT * FROM empleado WHERE UPPER(ciudad) IN ('GIJON', 'GIJÓN');

-- Alter table para añadir una nueva columna a la tabla cliente
ALTER TABLE cliente ADD COLUMN telefono TEXT;
-- Modificar los datos de todos los clientes
UPDATE cliente SET telefono = '985000001' WHERE id_cliente = 1;
UPDATE cliente SET telefono = '985000002' WHERE id_cliente = 2;
UPDATE cliente SET telefono = '985000003' WHERE id_cliente = 3;
-- Revisar los datos de todos los clientes
SELECT * FROM cliente;

-- Obtener los productos con precio mayor o igual a 3 ordenados por fecha de pedido, junto a la cantidad de productos pedidos
SELECT producto.nombre, detalle_pedido.cantidad, pedido.fecha_pedido
  FROM producto
       JOIN detalle_pedido
       ON producto.id_producto = detalle_pedido.id_producto
       
       JOIN pedido
       ON detalle_pedido.id_pedido = pedido.id_pedido
  WHERE producto.precio >= 3
  ORDER BY pedido.fecha_pedido;

-- Obtener solamente 3 registros de la tabla cliente
SELECT * FROM cliente LIMIT 3;

-- Obtener el número de pedidos realizados por cada cliente (de aquellos que han realizado al menos un pedido),
-- ordenados por número de pedidos de forma descendente
SELECT cliente.id_cliente, cliente.nombre, COUNT(pedido.id_pedido) AS num_pedidos
  FROM cliente
       JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
  GROUP BY cliente.id_cliente
  ORDER BY num_pedidos DESC;

-- Obtener el número de pedidos realizados por cada cliente (de todos los clientes, aunque no hayan realizado ningún pedido),
-- ordenados por número de pedidos de forma descendente
SELECT cliente.id_cliente, cliente.nombre, COUNT(pedido.id_pedido) AS num_pedidos
  FROM cliente
       LEFT JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
  GROUP BY cliente.id_cliente
  ORDER BY num_pedidos DESC;

-- Obtener la cantidad de dinero gastada por cada cliente (de todos los clientes, aunque no hayan realizado ningún pedido)
-- ordenados por cantidad de dinero gastada de forma descendente
SELECT cliente.id_cliente, cliente.nombre, SUM(producto.precio * detalle_pedido.cantidad) AS dinero_gastado
  FROM cliente
       LEFT JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
       
       LEFT JOIN detalle_pedido
       ON pedido.id_pedido = detalle_pedido.id_pedido
       
       LEFT JOIN producto
       ON detalle_pedido.id_producto = producto.id_producto
  GROUP BY cliente.id_cliente
  ORDER BY dinero_gastado DESC;

-- Obtener la cantidad de dinero gastada por cada cliente
-- ordenados por cantidad de dinero gastada de forma descendente, de aquellos que han gastado más de 200€
SELECT cliente.id_cliente, cliente.nombre, SUM(producto.precio * detalle_pedido.cantidad) AS dinero_gastado
  FROM cliente
       JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
       
       JOIN detalle_pedido
       ON pedido.id_pedido = detalle_pedido.id_pedido
       
       JOIN producto
       ON detalle_pedido.id_producto = producto.id_producto
  GROUP BY cliente.id_cliente
  HAVING dinero_gastado > 200
  ORDER BY dinero_gastado DESC;

-- Obtener el producto más caro que ha comprado cada cliente, junto con el nombre del producto
-- Nota: Si varios productos tienen el mismo precio, se mostrará el primero que se encuentre en la tabla
SELECT cliente.id_cliente, cliente.nombre, producto.nombre AS producto_mas_caro, producto.precio AS precio_producto_mas_caro
  FROM cliente
       JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
       
       JOIN detalle_pedido
       ON pedido.id_pedido = detalle_pedido.id_pedido
       
       JOIN producto
       ON detalle_pedido.id_producto = producto.id_producto
  WHERE producto.precio = (
    -- Subconsulta para obtener el producto más caro comprado por cada cliente
    SELECT MAX(p2.precio)
      FROM pedido p1
           JOIN detalle_pedido dp1
           ON p1.id_pedido = dp1.id_pedido
           
           JOIN producto p2
           ON dp1.id_producto = p2.id_producto
      WHERE p1.id_cliente = cliente.id_cliente -- Se usa el id_cliente de la query externa
  ) -- El precio del producto más caro comprado por cada cliente se usa para en la query externa para obtener el producto con dicho precio
  GROUP BY cliente.id_cliente;

-- Obtener la información de los pedidos y los productos para todos los productos (aunque no hayan sido pedidos)
SELECT pedido.*,
       detalle_pedido.cantidad,
       producto.id_producto,
       producto.nombre AS nombre_producto,
       producto.precio
  FROM pedido
       RIGHT JOIN detalle_pedido
       ON pedido.id_pedido = detalle_pedido.id_pedido

       RIGHT JOIN producto
       ON detalle_pedido.id_producto = producto.id_producto;

-- Obtener la información de la relación entre clientes y empleados (para todos los clientes y empleados,
-- aunque los clientes no hayan realizado ningún pedido y los empleados no hayan atendido ningún pedido)
SELECT cliente.id_cliente, cliente.nombre AS nombre_cliente, pedido.id_pedido, empleado.id_empleado, empleado.nombre AS nombre_empleado
  FROM cliente
       FULL OUTER JOIN pedido
       ON cliente.id_cliente = pedido.id_cliente
       
       FULL OUTER JOIN empleado
       ON pedido.id_empleado = empleado.id_empleado;
