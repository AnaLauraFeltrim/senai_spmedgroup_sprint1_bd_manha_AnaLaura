select IdConsulta, Descricao, DataConsulta,Paciente.Nome as Paciente , Medico.Nome as Medico, Situacao.Situacao from Consulta
inner join Paciente on Consulta.IdPaciente = Paciente.IdPaciente
inner join Medico on Consulta.IdMedico = Medico.IdMedico
inner join Situacao on Consulta.IdSituacao = Situacao.IdSituacao

select count (*) as MedicosCardiologistas from Medico 
where Medico.IdEspecialidade = 2; 

Exec idadePacientes;