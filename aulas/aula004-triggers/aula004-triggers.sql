create database aulaTrigger

use aulaTrigger

create table caixa(
	id int primary key identity (1,1),
	dataVenda date,
	saldo_inicial float,
	saldo_final float
)

create table vendas(
	id int primary key identity(1,1),
	dataVenda date,
	codigo int,
	valor float
)

create trigger tgr_novaVenda
	on vendas for insert
	as
	begin
		declare
		@valor float,
		@data datetime
		select @data=dataVenda,@valor=valor from inserted
		update caixa set saldo_final=saldo_final+@valor
		where dataVenda=@data
	end

insert into caixa(dataVenda,saldo_inicial,saldo_final)
values(getDate(),0,0)

insert into vendas(dataVenda,codigo,valor)
values(getDate(),1,100)

insert into vendas(dataVenda,codigo,valor)
values(getDate(),1,50)

select * from caixa
select * from vendas


--ATIVIDADE


create trigger tgr_reembolsoVenda
	on vendas for delete
	as
	begin
		declare
		@id int,
		@valor float,
		@data datetime
		select @data=dataVenda,@valor=valor,@id=id from deleted
		update caixa set saldo_final=saldo_final-@valor
		where dataVenda=@data
	end

delete from vendas
where id=4