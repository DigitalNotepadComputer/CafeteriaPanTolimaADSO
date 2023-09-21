-- Crear base de datos db_cafeteriapan
CREATE DATABASE db_cafeteriapan;

-- Usar base de datos
USE db_cafeteriapan;

-- Crear la tabla Propietario
CREATE TABLE PROPIETARIO (
    PK_propietario INT NOT NULL AUTO_INCREMENT,
    primer_nombre VARCHAR(255) NOT NULL,
    segundo_nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefono_fijo VARCHAR(20) NOT NULL,
    PRIMARY KEY (PK_propietario)
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Categoria VARCHAR(50)
);

-- Crear la tabla Mesa
CREATE TABLE Mesa (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroMesa INT,
    Capacidad INT,
    Estado VARCHAR(20)
);

-- Crear la tabla Empleado
CREATE TABLE Empleado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Cargo VARCHAR(50),
    FechaContratacion DATE,
    Salario DECIMAL(10, 2),
    MesaID INT,
    FOREIGN KEY (MesaID) REFERENCES Mesa(ID)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20),
    MesaID INT,
    FOREIGN KEY (MesaID) REFERENCES Mesa(ID)
);

-- Crear la tabla Pedido
CREATE TABLE Pedido (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FechaHora DATETIME,
    Estado VARCHAR(20),
    Total DECIMAL(10, 2),
    ClienteID INT,
    EmpleadoID INT,
    MesaID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(ID),
    FOREIGN KEY (MesaID) REFERENCES Mesa(ID)
	FOREIGN KEY (ProductoID) REFERENCES Producto(ID);
);

-- Crear la tabla Reserva
CREATE TABLE Reserva (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    MesaID INT,
    FechaHoraReserva DATETIME,
    NumeroPersonas INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (MesaID) REFERENCES Mesa(ID)
);


-- Insertar datos en PROPIETARIO
INSERT INTO PROPIETARIO (primer_nombre, segundo_nombre, apellido, email, telefono_fijo) 
VALUES ('Juan', 'Carlos', 'Garcia', 'juan@gmail.com', '123456789'),
       ('Maria', 'Luisa', 'Perez', 'maria@gmail.com', '987654321');

-- Insertar datos en Producto
INSERT INTO Producto (Nombre, Precio) VALUES ('Pizza', 15000), ('Hamburguesa', 12000), ('Ensalada', 8000);

-- Insertar datos en Cliente
INSERT INTO Cliente (Nombre, Apellido, CorreoElectronico, Telefono, MesaID) 
VALUES ('Pedro', 'Lopez', 'pedro@gmail.com', '111222333', 1),
       ('Ana', 'Gomez', 'ana@gmail.com', '444555666', 2),
       ('Carlos', 'Ramirez', 'carlos@gmail.com', '777888999', 3);

-- Insertar datos en Mesa
INSERT INTO Mesa (NumeroMesa, Capacidad, Estado) VALUES (1, 4, 'Disponible'), (2, 6, 'Disponible'), (3, 2, 'Ocupada'), (4, 4, 'Ocupada');

-- Insertar datos en Reserva
INSERT INTO Reserva (ClienteID, MesaID, FechaHoraReserva, NumeroPersonas) 
VALUES (1, 1, '2023-09-15 10:00:00', 1),
       (2, 2, '2023-09-16 11:00:00', 2),
       (3, 3, '2023-09-17 12:00:00', 3);
