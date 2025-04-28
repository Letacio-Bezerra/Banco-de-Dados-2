create database aulaTransacao;

use aulaTransacao;

create table contas(
	idConta int primary key,
	saldo decimal(10,2)
);

insert into contas (idConta, saldo) values (1, 1000.00);
insert into contas (idConta, saldo) values (2, 500.00);

select * from contas;

begin transaction;

update contas set saldo = saldo - 100 where idConta = 1;
update contas set saldo = saldo + 100 where idConta = 2;

rollback;

commit;

select * from contas;