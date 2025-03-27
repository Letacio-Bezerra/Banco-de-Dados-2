create database ac2;

use ac2;

create table motoristas(
    motoristaID int primary key identity(1,1),
    nome varchar(50),
    CNH varchar(20),
    pontosCNH int
);

create table carros(
    carroID int primary key identity(1,1),
	motoristaID int,
    placa char(7),
    modelo varchar(50),
    ano int,
	CONSTRAINT fk_carros_motoristas FOREIGN KEY (motoristaID) REFERENCES motoristas(motoristaID)
);

create table multas(
    multaID int primary key identity(1,1),
    carroID int,
    DataMulta date,
    Pontos int,
    CONSTRAINT fk_multas_veiculos FOREIGN KEY (carroID) REFERENCES carros(carroID)
);

create table prontuarios(
    prontuarioID int primary key identity(1,1),
    motoristaID int,
    multaID int,
    DataAssociacao date,
    CONSTRAINT fk_prontuarios_motoristas FOREIGN KEY (motoristaID) REFERENCES motoristas(motoristaID),
    CONSTRAINT fk_prontuarios_multas FOREIGN KEY (multaID) REFERENCES multas(multaID)
);


create trigger tgr_novaMulta
on multas after insert
	as
	begin
		declare
			@carroID int,
			@pontos int,
			@multaID int,
			@motoristaID int;

			select @carroID = carroID, @pontos = pontos, @multaID = multaID from inserted;

			select @motoristaID = motoristaID from carros
			where carroID = @carroID;

			insert into prontuarios (motoristaID, multaID, DataAssociacao)
			values (@motoristaID, @multaID, getdate());

			update motoristas
			set pontosCNH = pontosCNH + @pontos
			where motoristaID = @motoristaID;
	end;

create procedure inserirMotorista
	@nome varchar(50),
    @CNH varchar(20),
    @pontosCNH int
as
insert into motoristas(nome, CNH, pontosCNH)
values (@nome, @CNH, @pontosCNH)
select motoristaID, nome, CNH, pontosCNH from motoristas
order by motoristaID desc

exec inserirMotorista 'Jorge','123456789', 0
exec inserirMotorista 'Volibear','987654321', 0


create procedure inserirCarro
	@motoristaID int,
    @placa varchar(7),
    @modelo varchar(50),
	@ano int
as
insert into carros(motoristaID, placa, modelo, ano)
values (@motoristaID, @placa, @modelo, @ano)
select carroID, motoristaID, placa, modelo, ano from carros
order by carroID desc

exec inserirCarro 1, 'ABC1234', 'Honda Civic', 2020
exec inserirCarro 2, 'XYZ5678', 'Toyota Corolla', 2021


create procedure inserirMulta
	@carroID int,
    @dataMulta date,
	@pontos int
as
insert into multas(carroID, DataMulta, Pontos)
values (@carroID, @dataMulta, @pontos)
select multaID, carroID, dataMulta, pontos from multas
order by multaID desc

exec inserirMulta 1, '2025-03-25', 3
exec inserirMulta 2, '2025-03-26', 5
exec inserirMulta 1, '2025-03-25', 3


create procedure selectMotoristaMulta
as
    select 
        m.motoristaID, m.nome, m.CNH, m.pontosCNH, multa.multaID, multa.DataMulta, multa.Pontos
    from motoristas m
    inner join prontuarios p on m.motoristaID = p.motoristaID
    inner join multas multa on p.multaID = multa.multaID;

exec selectMotoristaMulta


create procedure selectMotoristaMultaEspecifico
	@motoristaID int
as
    select 
        m.motoristaID, m.nome, m.CNH, m.pontosCNH, multa.multaID, multa.DataMulta, multa.Pontos
    from motoristas m
	inner join prontuarios p on m.motoristaID = p.motoristaID
    inner join multas multa on p.multaID = multa.multaID
    where m.motoristaID = @motoristaID;

exec selectMotoristaMultaEspecifico 1


create procedure selectPontoTotal
	@motoristaID int
as
    select 
        m.motoristaID, m.nome, m.pontosCNH
    from motoristas m
    where m.motoristaID = @motoristaID;

exec selectPontoTotal 1