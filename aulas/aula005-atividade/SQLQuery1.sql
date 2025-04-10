create database ex2

use ex2

create table produtos(
	id_produto int primary key identity,
	nome_produto varchar(100) not null,
	estoque int not null default 0,
	preco decimal(10,2) not null
)

create table historicoEstoque(
	id_historico int primary key identity,
	id_produto int not null,
	data_alteracao datetime not null default getdate(),
	quantidade_anterior int,
	quantidade_nova int,
	constraint fk_id_produto foreign key (id_produto) references produtos(id_produto)
)


create procedure adicionarProduto
		@nome varchar(100),
		@estoque int,
		@preco decimal(10,2)
	as
		insert into produtos(nome_produto, estoque, preco)
		values (@nome, @estoque, @preco)

		select id_produto, nome_produto, estoque, preco from produtos
		order by id_produto desc

exec adicionarProduto 'banana','5','5.00'


create trigger update_produtos
on produtos after update
	as
	begin
		declare
			@id int,
			@estoque int,
			@quantidade_anterior int,
			@quantidade_nova int,

			select @id = id_produto, @estoque = estoque from updated;

			select @quantidade_anterior = @quantidade_nova - @estoque from historicoEstoque;

			insert into historicoEstoque(id_produto, quantidade_anterior, quantidade_nova)
			values (@id, @quantidade_anterior, @quantidade_nova)


