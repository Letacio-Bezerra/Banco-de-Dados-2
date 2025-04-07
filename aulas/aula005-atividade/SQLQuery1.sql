create database ex1

use ex1

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


create trigger update_produtos
on produtos after update
	as
	begin
		declare
			@id int,
			@estoque int,
			@quantidade_anterior int,
			@quantidade_nova int,
			@data datetime;

			select @id = id_produto, @estoque = estoque from updated;

			select @quantidade_anterior = quantidade_anterior, @quantidade_nova = quantidade_nova from historicoEstoque;