CREATE DATABASE plumbing; 

-- CREACION DE TABLAS
CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE servicios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE plomeros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE facturas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    servicios_id INT NOT NULL, 
    plomero_id INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servicios_id) REFERENCES servicios(id),
    FOREIGN KEY (plomero_id) REFERENCES plomeros(id)
);

CREATE TABLE descuentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(factura_id) REFERENCES facturas(id)
);

CREATE TABLE pagos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (factura_id) REFERENCES facturas(id)
);

CREATE TABLE auditoria(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tabla VARCHAR(50) NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL
);

-- agregar campo direccion a la TABLA clientes
ALTER TABLE clientes ADD COLUMN direccion VARCHAR(25);

-- AGREGAR CAMPO FECHA A LA TABLA SERVICIOS
ALTER TABLE servicios ADD COLUMN fecha DATE;

-- AGREGAR CAMPO DIRECCION A LA TABLA PLOMEROS
ALTER TABLE facturas ADD COLUMN direccion VARCHAR(255);

-- AGREGAR CAMPO direccion A LA TABLA facturas
ALTER TABLE facturas ADD COLUMN direccion VARCHAR(255);

-- MODIFICAR LA TABLA PAGOS PARA QUE EL CAMPO FACTURA_ID SEA NO NULO
ALTER TABLE pagos MODIFY COLUMN factura_id INT NOT NULL;

-- RELACIONAR LA TABLA DESCUENTO CON LA TABLA AUDITORIA
ALTER TABLE descuentos ADD FOREIGN KEY (id) REFERENCES auditoria(id);





