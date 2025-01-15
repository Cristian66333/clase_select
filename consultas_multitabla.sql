USE mi_bd;

DESC ventas;

SELECT v.id,p.nombre,c.nombre,CONCAT(e.nombre,' ',e.apellido) AS NOMBRE_EMPLEADO, v.cantidad, v.precio_unitario, v.monto_total
FROM ventas v, empleados e, productos p, clientes c
WHERE v.producto_id = p.id AND v.empleado_id = e.id AND v.producto_id = p.id AND v.cliente_id = c.id;

SELECT d.nombre, max(e.salario) FROM departamentos d, empleados e
WHERE e.departamento_id = d.id
GROUP BY departamento_id;

SELECT d.nombre, sum(v.monto_total) FROM departamentos d, empleados e, ventas v
WHERE e.departamento_id = d.id AND v.empleado_id = e.id
GROUP BY departamento_id;

SELECT d.nombre, min(e.edad) FROM departamentos d, empleados e
WHERE e.departamento_id = d.id
GROUP BY departamento_id;

SELECT p.nombre, sum(v.cantidad),
CASE WHEN sum(v.cantidad) < 5 THEN 'bajo'
WHEN sum(v.cantidad) < 8 and sum(v.cantidad)>=5 THEN 'medio'
WHEN sum(v.cantidad)>=8 THEN 'alto' END 
FROM ventas v, productos p
WHERE v.producto_id = p.id
GROUP BY nombre;

SELECT c.nombre, SUM(v.monto_total) FROM ventas v, clientes c
WHERE v.cliente_id = c.id
GROUP BY v.cliente_id
ORDER BY SUM(v.monto_total) DESC
LIMIT 1;


SELECT c.nombre, max(v.monto_total) FROM ventas v, clientes c
WHERE v.cliente_id = c.id
GROUP BY v.cliente_id;

SELECT CONCAT(e.nombre, ' ',e.apellido), AVG(v.precio_unitario)
from ventas v, empleados e
WHERE v.empleado_id = e.id
GROUP BY v.empleado_id;

SELECT d.nombre, min(e.salario)
from departamentos d, empleados e
WHERE e.departamento_id = d.id
GROUP BY e.departamento_id;

SELECT d.nombre, avg(e.salario)
from departamentos d, empleados e
WHERE e.departamento_id = d.id and e.edad>30
GROUP BY e.departamento_id
HAVING avg(e.salario)>3320;