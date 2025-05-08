create database atividade

use atividade

CREATE TABLE produtos (
	id_Produto INT PRIMARY KEY,
	nome VARCHAR(100),
	estoque INT
)

CREATE TABLE transacoes (
	id_Transacao INT PRIMARY KEY,
	id_Produto INT,
	venda INT,
	foreign key (id_Produto) references produtos(id_produto)
)

CREATE PROCEDURE adicionar_Produto
	@id int,
	@nome varchar(100),
	@estoque int
	as
		insert into produtos(id_Produto, nome, estoque)
		values (@id, @nome, @estoque)

		select * from produtos
		order by id_Produto desc

exec adicionar_Produto 1, 'banana', 10

CREATE PROCEDURE conferir_Estoque
	@idP INT,
	@idT INT,
	@venda INT
	as
	BEGIN
		BEGIN TRANSACTION;
			IF ((SELECT estoque FROM produtos WHERE id_Produto = @idP) >= @venda)
			BEGIN
				UPDATE produtos
				SET estoque = estoque - @venda
				WHERE id_Produto = @idP;

				INSERT INTO transacoes (id_Transacao, id_Produto, venda)
				VALUES (@idT, @idP, @venda);

			COMMIT TRANSACTION;
			PRINT 'Pedido Realizado';
			END
			ELSE
			BEGIN
			ROLLBACK TRANSACTION;
			PRINT 'Sem estoque suficiente';
			END
	END;

exec conferir_Estoque @idP = 1, @idT = 1, @venda = 5;

SELECT * FROM produtos
SELECT * FROM transacoes