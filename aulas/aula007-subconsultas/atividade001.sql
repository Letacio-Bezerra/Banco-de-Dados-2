create database subcolsulta

use subcolsulta

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY,
	nome VARCHAR(100),
	cidade VARCHAR(100)
)

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY,
	id_cliente INT,
	valor DECIMAL,
	data_pedido DATE,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nome, cidade) VALUES
(1, 'João', 'São Paulo'),
(2, 'Maria', 'Rio de Janeiro'),
(3, 'Pedro', 'Salvador');

INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(1, 1, 100.00, '2025-05-01'),
(2, 2, 150.00, '2025-05-02'),
(3, 3, 200.00, '2025-05-03');
(4, 4, 50.00, '2025-05-04');

SELECT nome
FROM clientes
WHERE id_cliente IN (
	SELECT id_cliente
	FROM pedidos
	WHERE valor > AVG(valor)
);