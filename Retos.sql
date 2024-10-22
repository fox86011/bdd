--Script 1

CREATE TABLE productos (
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    precio MONEY NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (codigo)
);

INSERT INTO productos (codigo, nombre, descripcion, precio, stock) VALUES 
(1, 'Producto A', 'Descripción del producto A', 10.00, 100),
(2, 'Producto B', 'Descripción del producto B', 15.50, 200),
(3, 'Producto C', 'Descripción del producto C', 7.99, 150),
(4, 'Producto D', 'Descripción del producto D', 20.00, 80),
(5, 'Producto E', 'Descripción del producto E', 5.50, 300);
INSERT INTO productos (codigo, nombre, precio, stock) VALUES 
(6, 'Producto F', 12.00, 120),
(7, 'Producto G', 8.50, 60),
(8, 'Producto H', 25.00, 90);

SELECT * FROM productos WHERE nombre LIKE 'Q%';
SELECT * FROM productos WHERE descripcion IS NULL;
SELECT * FROM productos WHERE precio BETWEEN MONEY(2) AND MONEY(3);
UPDATE productos 
SET stock = 0 
WHERE descripcion IS NULL;
DELETE FROM productos 
WHERE descripcion IS NULL;
--Script 2
CREATE TABLE cuentas (
    numero_cuenta CHAR(5) NOT NULL,
    cedula_propietario CHAR(5) NOT NULL,
    fecha_creacion DATE NOT NULL,
    saldo MONEY NOT NULL,
    CONSTRAINT cuentas_pk PRIMARY KEY (numero_cuenta)
);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creacion, saldo) VALUES 
('00001', '12345', '2023-01-01', 1000.00),
('00002', '54321', '2023-01-02', 1500.50),
('00003', '67890', '2023-01-03', 2000.00),
('00004', '09876', '2023-01-04', 2500.75),
('00005', '11223', '2023-01-05', 3000.00),
('00006', '44556', '2023-01-06', 3500.25),
('00007', '77889', '2023-01-07', 4000.50),
('00008', '33445', '2023-01-08', 4500.00),
('00009', '55667', '2023-01-09', 5000.00),
('00010', '88990', '2023-01-10', 5500.00);
SELECT numero_cuenta, saldo FROM cuentas;
SELECT * FROM cuentas WHERE fecha_creacion >= CURRENT_DATE - INTERVAL '2 months';
SELECT numero_cuenta, saldo FROM cuentas WHERE fecha_creacion >= CURRENT_DATE - INTERVAL '2 months';
UPDATE cuentas 
SET saldo = 10 
WHERE cedula_propietario LIKE '17%';
DELETE FROM cuentas 
WHERE cedula_propietario LIKE '10%';
--Script 3
CREATE TABLE estudiantes (
    cedula CHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT estudiantes_pk PRIMARY KEY (cedula)
);

INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento) VALUES 
('1234567890', 'Juan', 'Pérez', 'juan.perez@example.com', '2000-01-01'),
('0987654321', 'María', 'Gómez', 'maria.gomez@example.com', '1999-05-15'),
('1122334455', 'Carlos', 'López', 'carlos.lopez@example.com', '2001-03-20'),
('2233445566', 'Ana', 'Martínez', 'ana.martinez@example.com', '2002-07-25'),
('3344556677', 'Luis', 'Hernández', 'luis.hernandez@example.com', '1998-11-30'),
('4455667788', 'Elena', 'Ramírez', 'elena.ramirez@example.com', '2003-12-10'),
('5566778899', 'Pedro', 'Torres', 'pedro.torres@example.com', '1997-02-14'),
('6677889900', 'Sofía', 'Mendoza', 'sofia.mendoza@example.com', '2004-08-05');
SELECT nombre, cedula FROM estudiantes;
SELECT nombre FROM estudiantes WHERE cedula LIKE '17%';
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM estudiantes WHERE nombre LIKE 'A%';
UPDATE estudiantes 
SET apellido = 'Hernández' 
WHERE cedula LIKE '17%';
DELETE FROM estudiantes 
WHERE cedula LIKE '%05';
--Script 4
CREATE TABLE registros_entrada (
    codigo_registro INT NOT NULL,
    cedula_empleado CHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT registros_entrada_pk PRIMARY KEY (codigo_registro)
);
INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora) VALUES 
(1, '1234567890', '2023-01-01', '08:00:00'),
(2, '0987654321', '2023-01-02', '09:00:00'),
(3, '1122334455', '2023-01-03', '10:00:00'),
(4, '2233445566', '2023-01-04', '11:00:00'),
(5, '3344556677', '2023-01-05', '12:00:00'),
(6, '4455667788', '2023-01-06', '13:00:00'),
(7, '5566778899', '2023-01-07', '14:00:00'),
(8, '6677889900', '2023-01-08', '15:00:00'),
(9, '1234567890', '2023-01-09', '16:00:00'),
(10, '0987654321', '2023-01-10', '17:00:00');
SELECT cedula_empleado, fecha, hora FROM registros_entrada;
SELECT * FROM registros_entrada WHERE hora BETWEEN '07:00:00' AND '14:00:00';
SELECT * FROM registros_entrada WHERE hora > '08:00:00';
UPDATE registros_entrada 
SET cedula_empleado = '082345679' 
WHERE EXTRACT(MONTH FROM fecha) = 8 AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM CURRENT_DATE);
DELETE FROM registros_entrada 
WHERE EXTRACT(MONTH FROM fecha) = 6 
  AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM CURRENT_DATE);
--Script 5
CREATE TABLE videojuegos (
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT NOT NULL,
    CONSTRAINT videojuegos_pk PRIMARY KEY (codigo)
);
INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion) VALUES 
(1, 'Juego A', 'Descripción del Juego A', 9),
(2, 'Juego B', 'Descripción del Juego B', 8),
(3, 'Juego C', 'Descripción del Juego C', 7),
(4, 'Juego D', 'Descripción del Juego D', 10),
(5, 'Juego E', 'Descripción del Juego E', 6);
INSERT INTO videojuegos (codigo, nombre, valoracion) VALUES 
(6, 'Juego F', 8),
(7, 'Juego G', 9),
(8, 'Juego H', 7);
SELECT * FROM videojuegos WHERE nombre LIKE 'C%';
SELECT * FROM videojuegos WHERE valoracion BETWEEN 9 AND 10;
SELECT * FROM videojuegos WHERE descripcion IS NULL;
UPDATE videojuegos 
SET descripcion = 'Mejor puntuado' 
WHERE valoracion > 9;
DELETE FROM videojuegos 
WHERE valoracion < 7;
--Script 6
CREATE TABLE transacciones (
    codigo INT NOT NULL,
    numero_cuenta CHAR(5) NOT NULL,
    monto MONEY NOT NULL,
    tipo CHAR(1) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT transacciones_pk PRIMARY KEY (codigo)
);
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) VALUES 
(1, '00001', 100.00, 'C', '2023-01-01', '10:00:00'),
(2, '00002', 150.50, 'D', '2023-01-02', '11:00:00'),
(3, '00003', 200.00, 'C', '2023-01-03', '12:00:00'),
(4, '00004', 250.75, 'D', '2023-01-04', '13:00:00'),
(5, '00005', 300.00, 'C', '2023-01-05', '14:00:00'),
(6, '00006', 350.25, 'D', '2023-01-06', '15:00:00'),
(7, '00007', 400.50, 'C', '2023-01-07', '16:00:00'),
(8, '00008', 450.00, 'D', '2023-01-08', '17:00:00'),
(9, '00009', 500.00, 'C', '2023-01-09', '18:00:00'),
(10, '00010', 550.00, 'D', '2023-01-10', '19:00:00');
SELECT * FROM transacciones WHERE tipo = 'D';
SELECT * FROM transacciones WHERE monto BETWEEN MONEY(200) AND MONEY(2000);
SELECT codigo, monto, tipo, fecha FROM transacciones WHERE fecha IS NOT NULL;
UPDATE transacciones 
SET tipo = 'T' 
WHERE monto > MONEY(100) AND monto < MONEY(500) 
  AND EXTRACT(MONTH FROM fecha) = 9 
  AND EXTRACT(HOUR FROM hora) BETWEEN 14 AND 20;
DELETE FROM transacciones 
WHERE EXTRACT(MONTH FROM fecha) = 8 
  AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM CURRENT_DATE) 
  AND EXTRACT(HOUR FROM hora) BETWEEN 14 AND 18;