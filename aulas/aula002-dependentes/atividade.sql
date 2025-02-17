create database multaVeiculo

use multaVeiculo

--VEICULOS (placa, marca, modelo, cor)
--MULTAS (idMulta, nomeMulta, valor)
--AUTUACAO(placaVeiculo, idMulta, data, localDaMulta)

create table veiculos(
	idVeiculo int primary key identity(1,1) not null,
	idPlaca char(7) not null,
	marca varchar(100),
	modelo varchar(100),
	cor varchar(100)
)

create table multas(
	idMulta int not null,
	nomeMulta varchar(100) not null,
	valor money not null
	constraint fk_multas_veiculos foreign key (idMulta)
	references veiculos(idVeiculo)
)

insert into veiculos(idPlaca,marca,modelo,cor)
values('AAA488','Ferrari','DDD','Amarilo')
insert into veiculos(idPlaca,marca,modelo,cor)
values('BBB816','Lambo','AAA','Azurelo')

select * from veiculos

insert into multas(idMulta,nomeMulta,valor)
value(1,'Carlinho Maia',22.00)