create database controleTarefas

use controleTarefas

create table tarefas(
	id int primary key identity(1,1),
	descricao varchar(300),
	stat varchar
)

create table historicoStatus(
	id int primary key identity(1,1),
	id_tarefa int,
	novoStatus varchar(100),
	dataAlteração datetime
	constraint fk_id_tarefa foreign key (id_tarefa) references tarefas(id)
)