SHOW DATABASES;
CREATE DATABASE mi_bd;
use mi_bd;
show tables;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

SELECT constraint_name,
    table_name,
    column_name,
    referenced_table_name,
    referenced_column_name
FROM information_schema.key_column_usage
WHERE table_name = "empleados";

desc empleados;

ALTER TABLE empleados MODIFY COLUMN edad INT NOT NULL;

DESC EMPLEADOS;

ALTER TABLE empleados MODIFY COLUMN salario DECIMAL(10,2) DEFAULT 0;

DESC EMPLEADOS;

ALTER TABLE empleados ADD COLUMN departamento VARCHAR(50);

DESC EMPLEADOS;

ALTER TABLE empleados DROP COLUMN fecha_contratacion;

DESC EMPLEADOS;

ALTER TABLE empleados ADD COLUMN fecha_contratacion DATE DEFAULT (CURRENT_DATE);

DESC EMPLEADOS;

CREATE TABLE departamentos 
(id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL);

DESC DEPARTAMENTOS;

ALTER TABLE EMPLEADOS ADD COLUMN departamento_id INT;

ALTER TABLE EMPLEADOS ADD 
FOREIGN KEY (departamento_id) 
REFERENCES departamentos(id);

DESC EMPLEADOS;

ALTER TABLE EMPLEADOS DROP COLUMN DEPARTAMENTO;


DESC EMPLEADOS;

INSERT INTO empleados 
(nombre, apellido, edad, salario) 
VALUES ('Juan', 'Pérez', 30, 2500.50);

SELECT * FROM EMPLEADOS;

UPDATE empleados 
SET salario = 2700.00 
WHERE nombre = 'Juan';

SELECT * FROM EMPLEADOS;

DELETE FROM empleados 
WHERE nombre = 'Juan';

SELECT * FROM EMPLEADOS;

DESC DEPARTAMENTOS;

INSERT INTO DEPARTAMENTOS (NOMBRE) VALUES ('Ventas');

INSERT INTO DEPARTAMENTOS (NOMBRE) VALUES ('Recursos Humanos');

SELECT * FROM departamentos;

DESC empleados;

ALTER TABLE EMPLEADOS ADD COLUMN correo VARCHAR(100) UNIQUE AFTER SALARIO;

DESC empleados;

INSERT INTO EMPLEADOS 
(nombre, apellido, edad, salario, correo, departamento_id)
VALUES
("Ana", "Rodriguez", 28, 3000.00, "anarodriguez@mail.com", 1);

SELECT * FROM empleados;

INSERT INTO EMPLEADOS 
(nombre, apellido, edad, salario, correo, departamento_id)
VALUES
("Carlos", "Lopez", 32, 3200.50, "carloslopez@mail.com", 2);

SELECT * FROM empleados;

INSERT INTO EMPLEADOS 
(nombre, apellido, edad, salario, correo, departamento_id)
VALUES
("Laura", "Perez", 26, 2800.75, "lauraperez@mail.com", 1),
("Martin", "Gonzalez", 30, 3100.25, "martingonzalez@mail.com", 2);

SELECT * FROM empleados;

UPDATE empleados 
SET salario = (salario + salario*0.1)
WHERE NOMBRE = "Ana";

SELECT * FROM empleados;

INSERT INTO departamentos (nombre) VALUES ("Contabilidad");

UPDATE empleados 
SET departamento_id = 3 
WHERE nombre = "Carlos";

DELETE FROM EMPLEADOS WHERE NOMBRE = "Laura";

SELECT * FROM empleados;

SELECT * FROM departamentos;

CREATE TABLE clientes 
(id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
direccion VARCHAR(100));

CREATE TABLE productos 
(id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10,2));

CREATE TABLE ventas 
(id INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT,
cliente_id INT,
cantidad INT,
precio_unitario DECIMAL(10,2),
monto_total DECIMAL(10,2),
empleado_id INT);

ALTER TABLE ventas ADD FOREIGN KEY (producto_id) REFERENCES productos(id);
ALTER TABLE ventas ADD FOREIGN KEY (cliente_id) REFERENCES clientes(id);
ALTER TABLE ventas ADD FOREIGN KEY (empleado_id) REFERENCES empleados(id);

DESC ventas;

INSERT INTO clientes (nombre, direccion)
VALUES ("Juan Perez", "Libertad 3215 Mar del Plata");

INSERT INTO productos (nombre, precio)
VALUES ("Laptop", 1200.00);

ALTER TABLE ventas MODIFY COLUMN monto_total DECIMAL(10,2) DEFAULT (cantidad*precio_unitario);

SELECT * FROM productos;
SELECT * FROM clientes;
SELECT * FROM empleados;


INSERT INTO ventas 
(producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
(1, 1, 2, 1200.00, 2);

SELECT * FROM ventas;




