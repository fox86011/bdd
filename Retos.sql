--Script 1

CREATE TABLE productos (
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    precio MONEY NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (codigo)
);
--Script 2
CREATE TABLE cuentas (
    numero_cuenta CHAR(5) NOT NULL,
    cedula_propietario CHAR(5) NOT NULL,
    fecha_creacion DATE NOT NULL,
    saldo MONEY NOT NULL,
    CONSTRAINT cuentas_pk PRIMARY KEY (numero_cuenta)
);
--Script 3
CREATE TABLE estudiantes (
    cedula CHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT estudiantes_pk PRIMARY KEY (cedula)
);
--Script 4
CREATE TABLE registros_entrada (
    codigo_registro INT NOT NULL,
    cedula_empleado CHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT registros_entrada_pk PRIMARY KEY (codigo_registro)
);
--Script 5
CREATE TABLE videojuegos (
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT NOT NULL,
    CONSTRAINT videojuegos_pk PRIMARY KEY (codigo)
);
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