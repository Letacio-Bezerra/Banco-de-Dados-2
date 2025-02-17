create database relacionamentos

use relacionamentos

create table funcionarios(
	id int primary key identity(1,1),
	nome varchar(60),
	telefone char(9)
)

create table dependentes(
	id int primary key identity(1,1),
	nome varchar(60) not null,
	grauParent varchar(20) not null,
	idFunc int not null,
	constraint fk_dependentes_funcionarios foreign key (idFunc)
	references funcionarios(id)
)

insert into funcionarios(nome,telefone)
values('João da Silva','988554411')

select * from funcionarios
select * from dependentes

insert into dependentes(nome,grauParent,idFunc)
values('João da Silva Junior','Filho',1)

select dependentes.nome,dependentes.grauParent,funcionarios.nome
from dependentes inner join funcionarios on
dependentes.idFunc=funcionarios.id