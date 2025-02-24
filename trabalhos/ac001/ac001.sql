CREATE DATABASE empresa;

USE empresa;


CREATE TABLE Pecas (
    ID_Peca INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    Preco FLOAT
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Email VARCHAR(50),
    Telefone CHAR(11)
);

CREATE TABLE Computador (
    ID_Computador INT PRIMARY KEY IDENTITY(1,1),
    ID_Gabinete INT,
    ID_Processador INT,
    ID_Placa_Video INT,
    ID_Armazenamento INT,
    ID_Placa_Mae INT,
    FOREIGN KEY (ID_Gabinete) REFERENCES Pecas(ID_Peca),
    FOREIGN KEY (ID_Processador) REFERENCES Pecas(ID_Peca),
    FOREIGN KEY (ID_Placa_Video) REFERENCES Pecas(ID_Peca),
    FOREIGN KEY (ID_Armazenamento) REFERENCES Pecas(ID_Peca),
    FOREIGN KEY (ID_Placa_Mae) REFERENCES Pecas(ID_Peca)
);

CREATE TABLE Clientes_Computadores (
    ID_Cliente INT,
    ID_Computador INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Computador) REFERENCES Computador(ID_Computador)
);

INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('João Silva', 'Rua A, 111', 'joao@gmail.com', '11111111111'),
('Maria Souza', 'Rua B, 222', 'maria@yahoo.com', '22222222222'),
('Carlos Pereira', 'Rua C, 333', 'carlos@hotmail.com', '33333333333'),
('Ana Oliveira', 'Rua D, 444', 'ana@outlook.com', '44444444444'),
('Pedro Lima', 'Rua E, 555', 'pedro@gmail.com', '55555555555');

INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete ATX', 'Gabinete', 499.99),
('Gabinete Mid Tower', 'Gabinete', 399.99),
('Gabinete Full Tower', 'Gabinete', 599.99),
('Gabinete Mini ITX', 'Gabinete', 299.99),
('Gabinete Micro ATX', 'Gabinete', 349.99);

INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador Intel i9', 'Processador', 2499.99),
('Processador AMD Ryzen 9', 'Processador', 2299.99),
('Processador Intel i7', 'Processador', 1999.99),
('Processador AMD Ryzen 7', 'Processador', 1799.99),
('Processador Intel i5', 'Processador', 1499.99);

INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RTX 3080', 'Placa de Vídeo', 3499.99),
('Placa de Vídeo RX 6800 XT', 'Placa de Vídeo', 3299.99),
('Placa de Vídeo RTX 3070', 'Placa de Vídeo', 2999.99),
('Placa de Vídeo RX 6700 XT', 'Placa de Vídeo', 2799.99),
('Placa de Vídeo RTX 3060', 'Placa de Vídeo', 2499.99);

INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('HDD 2TB', 'Armazenamento', 499.99),
('HDD 4TB', 'Armazenamento', 799.99),
('SSD 500GB', 'Armazenamento', 599.99),
('SSD 2TB', 'Armazenamento', 1199.99),
('NVMe 1TB', 'Armazenamento', 999.99);

INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe Mini ITX', 'Placa-Mãe', 799.99),
('Placa-Mãe Micro ATX', 'Placa-Mãe', 899.99),
('Placa-Mãe LGA1200', 'Placa-Mãe', 1099.99),
('Placa-Mãe AM4', 'Placa-Mãe', 999.99),
('Placa-Mãe B550', 'Placa-Mãe', 949.99);

INSERT INTO Computador (ID_Gabinete, ID_Processador, ID_Placa_Video, ID_Armazenamento, ID_Placa_Mae) VALUES
(1, 6, 11, 16, 21),
(2, 7, 12, 17, 22),
(3, 8, 13, 18, 23),
(4, 9, 14, 19, 24),
(5, 10, 15, 20, 25);

INSERT INTO Clientes_Computadores (ID_Cliente, ID_Computador) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- 1
SELECT * FROM Computador;
SELECT * FROM Clientes;


-- 2
SELECT Computador.*
FROM Computador JOIN Clientes_Computadores ON Computador.ID_Computador = Clientes_Computadores.ID_Computador
WHERE Clientes_Computadores.ID_Cliente = 1;


-- 3
SELECT * FROM Computador
WHERE ID_Gabinete = 2;


-- 4
SELECT Clientes.*, Computador.*
FROM Computador
JOIN Clientes_Computadores ON Computador.ID_Computador = Clientes_Computadores.ID_Computador
JOIN Clientes ON Clientes_Computadores.ID_Cliente = Clientes.ID_Cliente
WHERE Computador.ID_Computador = 1;


-- 5
SELECT DISTINCT Clientes.*
FROM Clientes
JOIN Clientes_Computadores ON Clientes.ID_Cliente = Clientes_Computadores.ID_Cliente
JOIN Computador ON Clientes_Computadores.ID_Computador = Computador.ID_Computador
WHERE Computador.ID_Gabinete = 3;
