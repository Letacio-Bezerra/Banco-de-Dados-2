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
INSERT INTO clientes (id_cliente, nome, cidade) VALUES
(5, 'Po', 'Sr');

INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(1, 1, 100.00, '2025-05-01'),
(2, 2, 150.00, '2025-05-02'),
(3, 3, 200.00, '2025-05-03');
INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(4, 3, 300.00, '2025-05-04');


-- 1. Mostre os nomes dos clientes que fizeram pelo menos um pedido com valor superior a 100 reais, utilizando uma subconsulta com IN.
SELECT nome
FROM clientes
WHERE id_cliente IN(
	SELECT id_cliente
	FROM pedidos
	WHERE valor > 100
);

-- 2. Liste os clientes que fizeram pedidos com valor acima da média de todos os pedidos.
SELECT nome
FROM clientes
WHERE id_cliente IN (
	SELECT id_cliente
	FROM pedidos
	WHERE valor > (
		SELECT AVG(valor)
		FROM pedidos
		)
);

-- 3. Liste os nomes dos clientes que ainda não fizeram nenhum pedido.
SELECT nome
FROM clientes
WHERE id_cliente NOT IN (
	SELECT id_cliente
	FROM pedidos
);

-- 4. Exiba o nome dos clientes e o valor do maior pedido que cada um já fez, usando subconsulta no SELECT.
SELECT nome,
	(SELECT MAX(valor)
	FROM pedidos
	WHERE id_cliente = c.id_cliente) AS maior_pedido
	FROM clientes c

-- 5. Mostre o nome dos clientes e a soma total dos valores de seus pedidos, usando subconsulta em uma tabela derivada (no FROM).
SELECT nome,
	(SELECT SUM(valor)
	FROM pedidos
	WHERE id_cliente = c.id_cliente) AS soma_dos_pedidos
	FROM clientes c

-- 6. Liste o nome das cidades que possuem pelo menos um cliente que fez pedido, utilizando subconsulta com EXISTS.
SELECT DISTINCT cidade
FROM clientes c
WHERE EXISTS(
	SELECT 1
	FROM pedidos
	WHERE id_cliente = c.id_cliente
)

-- 7. Mostre os nomes dos clientes que possuem mais de um pedido registrado, usando uma subconsulta com COUNT().SELECT nomeFROM clientes cWHERE(	SELECT COUNT(*)	FROM pedidos	WHERE id_cliente = c.id_cliente) > 1;-- 8. Liste os nomes dos clientes que fizeram pedidos exatamente com o valor igual à média dos pedidosSELECT nome
FROM clientes
WHERE id_cliente IN (
	SELECT id_cliente
	FROM pedidos
	WHERE valor = (
		SELECT AVG(valor)
		FROM pedidos
	)
);-- 9. Exiba as cidades onde o maior valor de pedido feito por algum cliente da cidade é superior a R$150.SELECT nome, cidadeFROM clientes cWHERE (	SELECT MAX(valor)	FROM pedidos	WHERE id_cliente = c.id_cliente) > 150;-- 10. Mostre o nome de cada cliente junto com o valor do pedido mais recente (data mais próxima) feito por ele.SELECT nome,
	(SELECT TOP 1 valor
	FROM pedidos p
	WHERE p.id_cliente = c.id_cliente
	ORDER BY data_pedido DESC) AS pedido_mais_recente
FROM clientes c;