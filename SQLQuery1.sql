create database MedicalClinica_Manha;
use MedicalClinica_Manha;

create table Clinica (
IdClinica int primary key identity,
NomeFant varchar(200),
RazaoSocial varchar(200),
CNPJ varchar(200),
Endereco varchar(200),
Horario varchar (200)
);

go

create table TipoUsuario(
IdTipoUsuario int primary key identity,
Titulo varchar(200)
);
go

create table Especialidade (
IdEspecialidade int primary key identity,
Especialidade varchar(200)
);
go

create table Situacao (
IdSituacao int primary key identity,
Situacao varchar (200)
);
go

create table Usuario (
IdUsuario int primary key identity,
Email varchar(200),
Senha varchar(200),
IdTipoUsuario int foreign key references TipoUsuario(IdTipoUsuario)
);
go

create table Paciente (
IdPaciente int primary key identity,
Nome varchar(200),
CPF varchar(200),
RG varchar(200),
Endereco varchar (200),
DataNas date,
IdUsuario int foreign key references Usuario(IdUsuario)
);
go

create table Medico (
IdMedico int primary key identity,
Nome varchar(200),
CRM varchar (200),
IdClinica int foreign key references Clinica(IdClinica),
IdEspecialidade int foreign key references Especialidade(IdEspecialidade),
IdUsuario int foreign key references Usuario(IdUsuario)
);
go

create table Consulta(
IdConsulta int primary key identity,
Descricao varchar(200),
DataConsulta date,
IdPaciente int foreign key references Paciente(IdPaciente),
IdMedico int foreign key references Medico (IdMedico),
IdSituacao int foreign key references Situacao (IdSituacao)
);
go

insert into Clinica(NomeFant, RazaoSocial, CNPJ,Endereco,Horario)
values ('Sp Medical Group', 'ClinicaOk', '12344321', 'R. 9 de Julho', '08h - 19h' )
go

insert into TipoUsuario (Titulo)
values ('Adm'),
	   ('Paciente'),
	   ('Médico')
go

insert into Especialidade (Especialidade)
values ('Ortopedista'),
	   ('Cardiologista'),
	   ('Neurologista'),
	   ('Ginecologista')
go

insert into Situacao (Situacao)
values ('Concluído'),
	   ('Aguardando'),
	   ('Negado')
go

insert into Usuario (Email,Senha,IdTipoUsuario)
values ( 'otario@gmail.com', 'nicolas123',1),
	   ( 'cadu@gmail.com', 'cadu123', 2),
	   ( 'eduardo@gmail.com', 'duds123', 3)
go

insert into Paciente ( Nome ,CPF, RG, Endereco, DataNas, IdUsuario)
values ('Carlos','123.456.578.89',' 45.878.254.2', 'R. jeberson kleison', '29-03-2003',2)
go

insert into Medico ( Nome, CRM, IdClinica, IdEspecialidade, IdUsuario)
values ('Eduardo','123456', 1, 2, 3)
go

insert into Consulta (DataConsulta, Descricao, IdMedico, IdPaciente, IdSituacao)
values ('10-03-2020', 'Tenho cancer', 1, 1,1)
go

select IdConsulta, Descricao, DataConsulta,Paciente.Nome as Paciente , Medico.Nome as Medico, Situacao.Situacao from Consulta
inner join Paciente on Consulta.IdPaciente = Paciente.IdPaciente
inner join Medico on Consulta.IdMedico = Medico.IdMedico
inner join Situacao on Consulta.IdSituacao = Situacao.IdSituacao

