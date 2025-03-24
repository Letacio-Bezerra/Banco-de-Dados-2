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