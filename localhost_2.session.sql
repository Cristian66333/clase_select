SHOW DATABASES;
USE mi_bd;

desc productos;

insert into productos 
(nombre, precio) 
VALUES
("Telefono movil", 450.00);

desc clientes;

insert into clientes
(nombre, direccion)
VALUES
("María García","Constitución 456, Luján");

desc empleados;

ALTER TABLE empleados 
MODIFY COLUMN correo 
VARCHAR(100) 
GENERATED ALWAYS AS 
(concat(empleados.nombre, empleados.apellido, "@mail.com")) STORED;

insert INTO empleados
(nombre, apellido, edad, salario)
VALUES
("Luis", "Fernández", 28, 2800.00);

UPDATE productos SET precio = 1350.00 WHERE nombre = "Laptop";

UPDATE clientes SET direccion = "Alberti 1789, Mar del Plata" WHERE nombre = "Juan Pérez";

UPDATE empleados SET salario = salario + (salario * 0.05);

INSERT INTO productos
(nombre, precio)
VALUES
("Tablet", 350.00);

INSERT INTO clientes
(nombre, direccion)
VALUES
("Ana López", "Beltrán 1452, Godoy Cruz");

INSERT INTO empleados
(nombre, apellido, edad, salario, departamento_id)
VALUES
("Marta", "Ramírez", 32, 3100.00, 1);

select * from productos;

UPDATE productos SET precio = 480.00 WHERE nombre = "Telefono movil";

UPDATE clientes SET direccion = "Avenida 789, Ciudad del Este" WHERE nombre = "María García";

UPDATE empleados SET salario = salario + (salario * 0.07) WHERE (SELECT id FROM departamentos WHERE nombre = "Ventas");

INSERT INTO productos
(nombre, precio)
VALUES
("Impresora", 280.00);

INSERT INTO clientes
(nombre, direccion)
VALUES
("Carlos Sánchez", "Saavedra 206, Las Heras");

INSERT INTO empleados
(nombre, apellido, edad, salario, departamento_id)
VALUES
("Lorena","Guzmán", 26, 2600.00, (SELECT id FROM departamentos WHERE nombre = "Ventas"));

SELECT * FROM empleados;

SELECT * FROM clientes;

SELECT * FROM productos;

SELECT DISTINCT edad FROM empleados WHERE edad = 28;

SELECT DISTINCT edad, nombre from empleados WHERE edad = 28;

SELECT DISTINCT correo FROM empleados;

SELECT * FROM empleados WHERE salario>3200;

SELECT * FROM empleados WHERE edad = 28;

SELECT * FROM empleados WHERE salario<2700;

DESC Ventas;

SELECT * FROM ventas WHERE cantidad>2;

SELECT * FROM ventas WHERE precio_unitario=480;

SELECT * FROM ventas WHERE empleado_id = 1;

SELECT nombre FROM empleados WHERE departamento_id = 1 AND salario>3000;

SELECT * FROM empleados WHERE edad = 32 OR departamento_id = 3;

SELECT * FROM ventas WHERE cantidad >=2 AND producto_id = 1;

SELECT * FROM ventas WHERE cliente_id = 1 OR empleado_id = 2;

SELECT * FROM ventas WHERE cliente_id = 2 AND cantidad >2;

SELECT *  FROM ventas WHERE empleado_id = 1 AND monto_total>1000;

SELECT nombre, edad FROM empleados WHERE edad BETWEEN 29 AND 30;

SELECT * FROM ventas WHERE cantidad BETWEEN 2 AND 3;

SELECT * FROM ventas WHERE precio_unitario BETWEEN 300 AND 500;

