CREATE DATABASE empresa

use empresa

CREATE TABLE Pecas (
    ID_Peca INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    Fabricante VARCHAR(100),
    Preco float
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Email VARCHAR(50),
    Telefone char(11)
);

CREATE TABLE Computadores (
    ID_Computador INT IDENTITY(1,1),
    ID_Cliente INT,
    ID_Peca INT,
    PRIMARY KEY (ID_Computador, ID_Peca),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Peca) REFERENCES Pecas(ID_Peca)
);

INSERT INTO Pecas (Nome, Tipo, Fabricante, Preco) VALUES
('Processador X', 'Processador', 'Intel', 1000.00);
INSERT INTO Pecas (Nome, Tipo, Fabricante, Preco) VALUES
('Placa de Vídeo', 'GPU', 'Nvidia', 1500.00);
INSERT INTO Pecas (Nome, Tipo, Fabricante, Preco) VALUES
('Gabinete Y', 'Gabinete', 'Corsair', 300.00);
INSERT INTO Pecas (Nome, Tipo, Fabricante, Preco) VALUES
('Memória RAM Z', 'Memória', 'Kingston', 200.00);
INSERT INTO Pecas (Nome, Tipo, Fabricante, Preco) VALUES
('SSD A', 'Armazenamento', 'Samsung', 250.00);

INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('João Silva', 'Rua A, 123', 'joao@gmail.com', '11111111111');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Maria Souza', 'Avenida B, 456', 'maria@yahoo.com', '22222222222');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Carlos Pereira', 'Rua C, 789', 'carlos@hotmail.com', '33333333333');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Ana Oliveira', 'Praça D, 101', 'ana@outlook.com', '44444444444');
INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('Pedro Lima', 'Avenida E, 202', 'pedro@gmail.com', '55555555555');


INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(1, 1);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(1, 2);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(1, 3);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(1, 4);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(1, 5);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(2, 1);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(2, 2);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(2, 3);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(2, 4);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(2, 5);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(3, 1);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(3, 2);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(3, 3);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(4, 2);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(4, 3);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(4, 4);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(5, 1);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(5, 2);
INSERT INTO Computadores (ID_Cliente, ID_Peca) VALUES
(5, 5);


--SELECT 1
SELECT * FROM Computadores
SELECT * FROM Clientes

--SELECT 2
SELECT * FROM Computadores 
WHERE ID_Cliente = 1;

--SELECT 3
SELECT DISTINCT ID_Computador FROM Computadores 
WHERE ID_Peca = 1;

--SELECT 4
SELECT c.*, cl.* FROM Computadores c JOIN Clientes cl
ON c.ID_Cliente = cl.ID_Cliente
WHERE c.ID_Computador = 1;

--SELECT 5
SELECT DISTINCT cl.* FROM Computadores c JOIN Clientes cl 
ON c.ID_Cliente = cl.ID_Cliente
WHERE c.ID_Peca = 5;