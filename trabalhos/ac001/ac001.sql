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

CREATE TABLE Computadores (
    ID_Computador INT PRIMARY KEY IDENTITY(1,1),
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE ComputadorPeca (
    ID_Computador INT,
    ID_Peca INT,
    PRIMARY KEY (ID_Computador, ID_Peca),
    FOREIGN KEY (ID_Computador) REFERENCES Computadores(ID_Computador),
    FOREIGN KEY (ID_Peca) REFERENCES Pecas(ID_Peca)
);


INSERT INTO Pecas (Nome, Tipo, Preco) VALUES
('Processador X', 'Processador', 1000.00),
('Placa de Vídeo', 'GPU', 1500.00),
('Gabinete Y', 'Gabinete', 300.00),
('Memória RAM Z', 'Memória', 200.00),
('SSD A', 'Armazenamento', 250.00);

INSERT INTO Clientes (Nome, Endereco, Email, Telefone) VALUES
('João Silva', 'Rua A, 111', 'joao@gmail.com', '11111111111'),
('Maria Souza', 'Rua B, 222', 'maria@yahoo.com', '22222222222'),
('Carlos Pereira', 'Rua C, 333', 'carlos@hotmail.com', '33333333333'),
('Ana Oliveira', 'Rua D, 444', 'ana@outlook.com', '44444444444'),
('Pedro Lima', 'Rua E, 555', 'pedro@gmail.com', '55555555555');

INSERT INTO Computadores (ID_Cliente) VALUES
(1), (2), (3), (4), (5);

INSERT INTO ComputadorPeca (ID_Computador, ID_Peca) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
(3, 1), (3, 2), (3, 3),
(4, 2), (4, 3), (4, 4),
(5, 1), (5, 2), (5, 5);


-- 1
SELECT * FROM Computadores;
SELECT * FROM Clientes;
SELECT * FROM Pecas;

-- 2
SELECT c.* 
FROM Computadores c
WHERE c.ID_Cliente = 2;

-- 3
SELECT DISTINCT cp.ID_Computador
FROM ComputadorPeca cp
WHERE cp.ID_Peca = 5;

-- 4
SELECT c.*, cl.*
FROM Computadores c
JOIN Clientes cl ON c.ID_Cliente = cl.ID_Cliente
WHERE c.ID_Computador = 1;

-- 5
SELECT DISTINCT cl.*
FROM Clientes cl
JOIN Computadores c ON cl.ID_Cliente = c.ID_Cliente
JOIN ComputadorPeca cp ON c.ID_Computador = cp.ID_Computador
WHERE cp.ID_Peca = 5;
