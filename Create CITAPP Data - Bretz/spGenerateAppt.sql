ALTER PROCEDURE spGenerateAppt 
AS
DECLARE @IdCita INT
DECLARE @CitasDisponiblesIdCitaDisp INT
DECLARE @PacienteUsuarioId INT
DECLARE @MotivoCita VARCHAR(255)
DECLARE @StatusCita VARCHAR(255) 
DECLARE @VisitaAnterior INT
DECLARE CursorPacienteId CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR SELECT DISTINCT UsuarioId FROM Paciente
BEGIN
OPEN CursorPacienteId
FETCH NEXT FROM CursorPacienteId INTO @PacienteUsuarioId
WHILE @@FETCH_STATUS = 0
BEGIN 
	SET @IdCita = (SELECT ISNULL(MAX(IdCita),0) FROM Cita)
	SET @IdCita = @IdCita +1
	SET @CitasDisponiblesIdCitaDisp = (SELECT TOP 1 IdCitaDisp FROM CitasDisponibles ORDER BY NEWID())
	SET @MotivoCita = (SELECT TOP 1 MotivoCita 
						FROM Doctor d INNER JOIN CitasDisponibles cd ON d.UsuarioId = cd.DoctorUsuarioId
						INNER JOIN MotivosCita mc  ON (SELECT e.Id FROM Especialidades e 
						WHERE e.Especialidad = d.Especialidad) = mc.TipoDoctor
						WHERE cd.IdCitaDisp = @CitasDisponiblesIdCitaDisp 
						ORDER BY NEWID())
	SET @StatusCita = 'Ocupada'
	SET @VisitaAnterior = NULL
	INSERT INTO Cita VALUES (@IdCita, @CitasDisponiblesIdCitaDisp, @PacienteUsuarioId, @MotivoCita, @StatusCita, @VisitaAnterior)
    FETCH NEXT FROM CursorPacienteId INTO @PacienteUsuarioId
	
END
CLOSE CursorDoctorId 
DEALLOCATE CursorDoctorId
END


 EXEC spGenerateAppt