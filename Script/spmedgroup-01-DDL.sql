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
Email varchar(200) unique,
Senha varchar(200),
IdTipoUsuario int foreign key references TipoUsuario(IdTipoUsuario)
);
go

create table Paciente (
IdPaciente int primary key identity,
Nome varchar(200),
CPF varchar(200) unique ,
RG varchar(200)unique,
Endereco varchar (200),
DataNas date,
IdUsuario int foreign key references Usuario(IdUsuario)
);
go

create table Medico (
IdMedico int primary key identity,
Nome varchar(200),
CRM varchar (200) unique,
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

create procedure idadePacientes
as 
select 
Nome,
CPF,
format (DataNas, 'MM/dd/yyyy') as DataNascimento,
convert(varchar,GETDATE(),1) as [DataHoje],
datediff (YY,DataNas,getdate()) -
case 
	when dateadd(YY,datediff(YY,DataNas,getdate()), DataNas)
		> getdate() then 1
	else 0
end as [Idade]
from Paciente;
go