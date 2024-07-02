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
