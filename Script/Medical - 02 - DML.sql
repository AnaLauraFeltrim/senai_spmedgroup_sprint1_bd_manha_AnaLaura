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