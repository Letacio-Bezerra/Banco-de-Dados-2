--criar um banco de dados
create database revisao

--abrir um banco
use revisao

--criar uma tabela
create table alunos(
	rm int primary key identity (1,1),
	nome varchar(60) not null,
	email varchar(50),
	telefone char(11),
	dataNasc date not null
)

--inserindo um registro na tabela
insert into alunos(nome,email,telefone,dataNasc)
values('José da Silva','jose@fiap.com.br','11998875544','10-30-2009')