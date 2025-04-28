create database atividadeTransacao2;

use atividadeTransacao2;

CREATE TABLE clientes(
	id INT PRIMARY KEY NOT NULL,
	nome varchar(200),
	saldo DECIMAL(10,2)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL,
	clienteID INT NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	statos VARCHAR(100) NOT NULL,
	foreign key (clienteID) references clientes(id)
);

BEGIN TRANSACTION;

	INSERT INTO clientes(id, nome, saldo)
	VALUES (1,'Joseph', 10.00);
	INSERT INTO clientes(id, nome, saldo)
	VALUES (2,'Mono', 0.00);
	INSERT INTO clientes(id, nome, saldo)
	VALUES (3,'Voli', 0.00);

	INSERT INTO pedidos(id, clienteID, valor, statos)
	VALUES (1, 1, 10.00, 'FINALIZADO');
	INSERT INTO pedidos(id, clienteID, valor, statos)
	VALUES (2, 2, 20.00, 'CANCELADO');
	INSERT INTO pedidos(id, clienteID, valor, statos)
	VALUES (3, 3, 0.00, 'FINALIZADO');

	INSERT INTO pedidos(id, clienteID, valor, statos)
	VALUES (4, 3, 500.00, 'PENDENTE');
	UPDATE clientes SET saldo = saldo - 500 WHERE id = 3;
	UPDATE pedidos SET statos = 'FINALIZADO' WHERE id = 4;

	INSERT INTO clientes(id, nome, saldo)
	VALUES (4,'Jorge', 100.00);
	INSERT INTO pedidos(id, clienteID, valor, statos)
	VALUES (5, 4, 10.00, 'FINALIZADO');
	UPDATE clientes SET saldo = saldo + 10 WHERE id = 4;

ROLLBACK;

COMMIT;

SELECT * FROM clientes;
SELECT * FROM pedidos;