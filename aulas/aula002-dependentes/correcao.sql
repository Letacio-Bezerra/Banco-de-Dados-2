CREATE DATABASE GerenciamentoMultas

USE GerenciamentoMultas

CREATE TABLE VEICULOS (
 placa CHAR(7) PRIMARY KEY,
 marca VARCHAR(50),
 modelo VARCHAR(50),
 cor VARCHAR(20)
)

CREATE TABLE MULTAS (
 idMulta INT PRIMARY KEY IDENTITY (1,1),
 nomeMulta VARCHAR(100),
 valor DECIMAL(10, 2)
)

CREATE TABLE AUTUACAO (
idAutuacao int primary key identity(1,1),
 placaVeiculo CHAR(7),
 idMulta INT,
 data DATE,
 localDaMulta VARCHAR(100),
 CONSTRAINT fk_autuacao_veiculos FOREIGN KEY (placaVeiculo)
REFERENCES VEICULOS(placa),
 CONSTRAINT fk_autuacao_multas FOREIGN KEY (idMulta)
REFERENCES MULTAS(idMulta)
)


-- Inserir veículos
INSERT INTO VEICULOS (placa, marca, modelo, cor)
VALUES ('ABC1234', 'Fiat', 'Uno', 'Branco')
INSERT INTO VEICULOS (placa, marca, modelo, cor)
VALUES('XYZ5678', 'Volkswagen', 'Gol', 'Preto')
INSERT INTO VEICULOS (placa, marca, modelo, cor)
VALUES('LMN9876', 'Chevrolet', 'Onix', 'Prata');

-- Inserir multas
INSERT INTO MULTAS (nomeMulta, valor)
VALUES ('Excesso de velocidade', 150.00)
INSERT INTO MULTAS (nomeMulta, valor)
VALUES ('Estacionamento em local proibido', 80.00)
INSERT INTO MULTAS (nomeMulta, valor)
VALUES ('Uso de celular ao volante', 100.00)

-- Inserir autuações (relacionando veículos com as multas)
INSERT INTO AUTUACAO (placaVeiculo, idMulta, data, localDaMulta)
VALUES ('ABC1234', 1, '2025-02-10', 'Avenida Brasil')
INSERT INTO AUTUACAO (placaVeiculo, idMulta, data, localDaMulta)
VALUES ('XYZ5678', 2, '2025-02-15', 'Rua das Flores')
INSERT INTO AUTUACAO (placaVeiculo, idMulta, data, localDaMulta)
VALUES ('LMN9876', 3, '2025-02-17', 'Avenida Paulista')


--CONSULTA 1
SELECT v.placa,v.marca,v.modelo,v.cor,m.nomeMulta,m.valor,a.data,a.localDaMulta
FROM AUTUACAO a INNER JOIN VEICULOS v ON v.placa = a.placaVeiculo
INNER JOIN MULTAS m ON a.idMulta = m.idMulta
WHERE v.placa = 'ABC1234';

--CONSULTA 2
SELECT v.placa,v.marca,v.modelo,v.cor,m.nomeMulta,m.valor,a.data,a.localDaMulta
FROM AUTUACAO a INNER JOIN VEICULOS v ON v.placa = a.placaVeiculo
INNER JOIN MULTAS m ON a.idMulta = m.idMulta
WHERE m.idMulta = 2;

--CONSULTA 3
SELECT v.placa,v.marca,v.modelo,v.cor,m.nomeMulta,m.valor,a.data,a.localDaMulta
FROM AUTUACAO a INNER JOIN VEICULOS v ON v.placa = a.placaVeiculo
INNER JOIN MULTAS m ON a.idMulta = m.idMulta
WHERE v.placa = 'ABC1234' AND m.idMulta = 1;