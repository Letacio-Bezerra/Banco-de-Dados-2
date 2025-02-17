create database LojaDB

use LojaDB

create table Clientes(
	id int primary key identity(1,1),
	nome varchar(100) not null,
	email varchar(150),
	dataCadastro date not null,
)

create table Produtos(
	id int primary key identity(1,1),
	nomeProduto varchar(100) not null,
	preco float not null,
)

insert into Clientes(nome, email, dataCadastro)
values('Roger', 'roger@email.com', '12-08-2024')
insert into Clientes(nome, email, dataCadastro)
values('Boguer', 'boguer@email.com', '10-20-2024')
insert into Clientes(nome, email, dataCadastro)
values('Loguer', 'loguer@email.com', '11-10-2024')


insert into Produtos(nomeProduto, preco)
values('Casa', '99.22')
insert into Produtos(nomeProduto, preco)
values('Dog', '999.22')
insert into Produtos(nomeProduto, preco)
values('Cat', '89.22')

select * from Produtos
select * from Clientes

update Clientes set email='ggg@email.com'
where id=1

update Produtos set preco='22.11'
where id=2

delete from Produtos
where id=3

delete from Clientes
where id=3