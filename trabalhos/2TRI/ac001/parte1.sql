create database acParte1

use acParte1


CREATE TABLE Alunos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Matriculado VARCHAR(3)
);


CREATE TABLE Matriculas (
    ID INT PRIMARY KEY IDENTITY(1,1),
    AlunoID INT NOT NULL,
    AnoLetivo INT NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pendente',
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID)
);

CREATE PROCEDURE matricularAlunos
    @AlunoID INT,
    @AnoLetivo INT
AS
BEGIN
	DECLARE @MatriculaID INT;

    BEGIN TRANSACTION Matricula;

    SELECT @MatriculaID = ID 
    FROM Matriculas 
    WHERE AlunoID = @AlunoID AND AnoLetivo = @AnoLetivo;

    IF @MatriculaID = NULL
    BEGIN
        INSERT INTO Matriculas (AlunoID, AnoLetivo, Status)
        VALUES (@AlunoID, @AnoLetivo, 'Matriculado');

        UPDATE Alunos
        SET Matriculado = 'Sim'
        WHERE ID = @AlunoID;

        COMMIT TRANSACTION Matricula;
        PRINT 'Matrícula realizada com sucesso!';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION Matricula;
        PRINT 'O aluno já está matriculado neste ano letivo.';
    END
END;


INSERT INTO Alunos (ID, Nome, Matriculado) 
VALUES (3, 'teste', 'Não');

EXEC matricularAluno @AlunoID = 3, @AnoLetivo = 2025;

SELECT * FROM Alunos
SELECT * FROM Matriculas