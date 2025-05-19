CREATE TABLE Carros (
 CarroID INT PRIMARY KEY identity (1,1),
 Placa VARCHAR(10),
 Modelo VARCHAR(50),
 Ano INT,
 MotoristaID INT,
 FOREIGN KEY (MotoristaID) REFERENCES Motoristas(MotoristaID)
);
CREATE TABLE Motoristas (
 MotoristaID INT PRIMARY KEY identity (1,1),
 Nome VARCHAR(100),
 CNH VARCHAR(20),
 PontosCNH INT DEFAULT 0
);
CREATE TABLE Multas (
 MultaID INT PRIMARY KEY identity (1,1),
 CarroID INT,
 DataMulta DATE,
 Pontos INT,
 FOREIGN KEY (CarroID) REFERENCES Carros(CarroID)
);
CREATE TABLE Prontuarios (
 ProntuarioID INT PRIMARY KEY identity (1,1),
 MotoristaID INT,
 MultaID INT,
 DataAssociacao DATE,
 FOREIGN KEY (MotoristaID) REFERENCES Motoristas(MotoristaID),
 FOREIGN KEY (MultaID) REFERENCES Multas(MultaID)
);
CREATE TRIGGER inserirMulta
ON multas
AFTER INSERT
AS
BEGIN
 DECLARE @MultaID INT;
 DECLARE @CarroID INT;
 DECLARE @Pontos INT;
 DECLARE @MotoristaID INT;
 
 SELECT
 @MultaID = MultaID,
 @CarroID = CarroID,
 @Pontos = Pontos
 FROM inserted;
 
 SELECT @MotoristaID = Carros.MotoristaID
 FROM Carros
 WHERE Carros.CarroID = @CarroID;
 
 INSERT INTO Prontuarios (MotoristaID, MultaID, DataAssociacao)
 VALUES (@MotoristaID, @MultaID, GETDATE());
 
 UPDATE Motoristas
 SET PontosCNH = PontosCNH + @Pontos
 WHERE Motoristas.MotoristaID = @MotoristaID;
END;
CREATE PROCEDURE TodosMotoristasEMultas
AS BEGIN
 SELECT Motoristas.Nome, Carros.Placa, Multas.DataMulta, Multas.Pontos
 FROM Motoristas
 JOIN Carros ON Motoristas.MotoristaID = Carros.MotoristaID
 JOIN Multas ON Carros.CarroID = Multas.CarroID;
END
CREATE PROCEDURE MotoristaESuasMultas
@motorista_ID INT
AS BEGIN
 SELECT Motoristas.Nome, Carros.Placa, Multas.DataMulta, Multas.Pontos
 FROM Motoristas
 JOIN Carros ON Motoristas.MotoristaID = Carros.MotoristaID
 JOIN Multas ON Carros.CarroID = Multas.CarroID
 WHERE Motoristas.MotoristaID = @motorista_id;
END
CREATE PROCEDURE TotalPontosCNH
@motorista_id INT
AS BEGIN
 SELECT PontosCNH
 FROM Motoristas
 WHERE MotoristaID = @motorista_id;
END