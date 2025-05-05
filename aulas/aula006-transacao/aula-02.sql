create database transacao

use transacao

-- Criando tabela de clientes
CREATE TABLE Clientes (
 ClienteID INT PRIMARY KEY,
 Nome VARCHAR(100),
 Saldo DECIMAL(10, 2)
);
-- Inserindo dados de exemplo
INSERT INTO Clientes (ClienteID, Nome, Saldo)
VALUES
 (1, 'Cliente A', 1000.00),
 (2, 'Cliente B', 500.00);

 -- Criando a stored procedure para transferência de saldo
 CREATE PROCEDURE transferirSaldoEntreClientes
	@clienteOrigem INT,
	@clienteDestino INT,
	@valorTransferencia DECIMAL(10,2)
AS
BEGIN
	BEGIN TRANSACTION tranferirSaldo;
	-- Verificando se o saldo do cliente de origem é suficiente para a transferência
	IF ((SELECT Saldo FROM Clientes WHERE ClienteID = @clienteOrigem) >= @valorTransferencia)
	BEGIN
	-- Atualizando saldo do cliente de origem
	UPDATE Clientes
	SET Saldo = Saldo - @valorTransferencia
	WHERE ClienteID = @clienteOrigem;
	-- Atualizando saldo do cliente de destino
	UPDATE Clientes
	SET Saldo = Saldo + @ValorTransferencia
	WHERE ClienteID = @ClienteDestino;	COMMIT TRANSACTION trasferirSaldo;	PRINT 'Transferência realizada com sucesso!';
 END
 ELSE
 BEGIN
 ROLLBACK TRANSACTION TransferirSaldo;
 PRINT 'Saldo insuficiente para realizar a transferência!';
 END
END;


EXEC TransferirSaldoEntreClientes
@ClienteOrigem = 1, @ClienteDestino = 2, @ValorTransferencia = 100.00;

select * from Clientes