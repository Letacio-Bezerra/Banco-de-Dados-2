CREATE DATABASE acParte2;

USE acParte2;

CREATE TABLE Pacientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Medicamento VARCHAR(100) DEFAULT 'Nenhum'
);

CREATE TABLE Receita(
	ID INT,
	ID_Paciente INT,
	Remedio VARCHAR(100),
	FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID)
)

CREATE PROCEDURE administrarMedicamento
    @PacienteID INT,
    @Medicamento VARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION Administracao;

	IF ((SELECT Medicamento from Pacientes WHERE @PacienteID = ID) = @Medicamento)

	BEGIN
        PRINT 'O paciente já recebeu este medicamento.';
        ROLLBACK TRANSACTION Administracao;
    END
    ELSE
    BEGIN
        UPDATE Pacientes
        SET Medicamento = @Medicamento
        WHERE ID = @PacienteID;

        COMMIT TRANSACTION Administracao;
        PRINT 'Medicação administrada com sucesso!';
    END
END;


INSERT INTO Pacientes (ID, Nome) 
VALUES (3, 'teste');

EXEC administrarMedicamento @PacienteID = 3, @Medicamento = 'Paracetamol';

SELECT * FROM Pacientes;
select * from receita