CREATE PROCEDURE GetClients @DoctorID INT
AS

SELECT * FROM Paciente WHERE UsuarioId IN
	(SELECT PacienteUsuarioId FROM Cita WHERE CitasDispobiblesIdCitaDisp IN
	(SELECT IdCitaDisp FROM CitasDisponibles WHERE DoctorUsuarioId = @DoctorID))