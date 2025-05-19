CREATE DATABASE empresa;

USE empresa;


CREATE TABLE Pecas (
    ID_Peca INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Preco FLOAT NOT NULL
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefone CHAR(11) NOT NULL
);

CREATE TABLE Computador (
    ID_Computador INT NOT NULL,
    ID_Cliente INT NOT NULL,
    CONSTRAINT fk_computador_cliente FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Computador_Pecas (
    ID_Computador INT NOT NULL,
    ID_Peca INT NOT NULL,
    CONSTRAINT fk_computadorpecas_peca FOREIGN KEY (ID_Peca) REFERENCES Pecas(ID_Peca),
);

--Clientes
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Jorge', 'Rua Jorge, 111', 'jorge@gmail.com', '11111111111');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Sett', 'Rua Sett, 222', 'sett@gmail.com', '22222222222');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Voliba', 'Rua Voliba, 333', 'voliba@gmail.com', '33333333333');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Mordeka', 'Rua Mordeka, 444', 'mordeka@gmail.com', '44444444444');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Briar', 'Rua Briar, 555', 'briar@gmail.com', '55555555555');

--Peças
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete ATX', 'Gabinete', 499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete Mid Tower', 'Gabinete', 399.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete Full Tower', 'Gabinete', 599.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete Mini ITX', 'Gabinete', 299.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Gabinete Micro ATX', 'Gabinete', 349.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador Intel i9', 'Processador', 2499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador AMD Ryzen 9', 'Processador', 2299.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador Intel i7', 'Processador', 1999.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador AMD Ryzen 7', 'Processador', 1799.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador Intel i5', 'Processador', 1499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RTX 3080', 'Placa de Vídeo', 3499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RX 6800 XT', 'Placa de Vídeo', 3299.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RTX 3070', 'Placa de Vídeo', 2999.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RX 6700 XT', 'Placa de Vídeo', 2799.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa de Vídeo RTX 3060', 'Placa de Vídeo', 2499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('HD 2TB', 'Armazenamento', 499.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('HD 4TB', 'Armazenamento', 799.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('SSD 500GB', 'Armazenamento', 599.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('SSD 2TB', 'Armazenamento', 1199.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('HD 1TB', 'Armazenamento', 999.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe Mini ITX', 'Placa-Mãe', 799.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe Micro ATX', 'Placa-Mãe', 899.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe LGA1200', 'Placa-Mãe', 1099.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe AM4', 'Placa-Mãe', 999.99);
INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Placa-Mãe B550', 'Placa-Mãe', 949.99);

--Computador
INSERT INTO Computador (ID_Computador,ID_Cliente) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

--Computador com as peças
INSERT INTO Computador_Pecas (ID_Computador, ID_Peca) VALUES
(1,1),
(1,6),
(1,11),
(1,16),
(1,21);
INSERT INTO Computador_Pecas (ID_Computador, ID_Peca) VALUES
(2,2),
(2,7),
(2,12),
(2,17),
(2,22);
INSERT INTO Computador_Pecas (ID_Computador, ID_Peca) VALUES
(3,3),
(3,8),
(3,13),
(3,18),
(3,23);
INSERT INTO Computador_Pecas (ID_Computador, ID_Peca) VALUES
(4,4),
(4,9),
(4,14),
(4,19),
(4,24);
INSERT INTO Computador_Pecas (ID_Computador, ID_Peca) VALUES
(5,5),
(5,10),
(5,15),
(5,20),
(5,25);

INSERT INTO Computador (ID_Computador, ID_Cliente) VALUES
(2,1);

SELECT * FROM Clientes
SELECT * FROM Computador_Pecas
SELECT * FROM Pecas

-- 1
SELECT * FROM Computador;
SELECT * FROM Clientes;


-- 2
SELECT Clientes.ID_Cliente, Clientes.Nome, Computador.ID_Computador
FROM Computador
JOIN Clientes ON Computador.ID_Cliente = Clientes.ID_Cliente
WHERE Clientes.ID_Cliente = 1;

-- 3
SELECT Computador_Pecas.ID_Computador
FROM Computador_Pecas
WHERE ID_Peca = 1;

-- 4
SELECT Computador.ID_Computador, Clientes.Nome, Clientes.Endereco, Clientes.Email, Clientes.Telefone
FROM Computador
JOIN Clientes ON Computador.ID_Cliente = Clientes.ID_Cliente
WHERE Computador.ID_Computador = 2;

-- 5
SELECT Clientes.ID_Cliente, Clientes.Nome, Clientes.Endereco, Clientes.Email, Clientes.Telefone
FROM Computador_Pecas
JOIN Computador ON Computador_Pecas.ID_Computador = Computador.ID_Computador
JOIN Clientes ON Computador.ID_Cliente = Clientes.ID_Cliente
WHERE Computador_Pecas.ID_Peca = 1;
