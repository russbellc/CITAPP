ALTER PROCEDURE spGenerateHistory  
AS
DECLARE @PacienteUsuarioId INT
DECLARE @VisitaCitaIdCita INT
DECLARE @IdRegistro INT
DECLARE CursorVisitaId CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR SELECT DISTINCT CitaIdCita FROM Visita
BEGIN
OPEN CursorVisitaId
FETCH NEXT FROM CursorVisitaId INTO @VisitaCitaIdCita
WHILE @@FETCH_STATUS = 0
BEGIN 
	SET @IdRegistro = (SELECT TOP 1 ISNULL(IdRegistro,0) FROM Historial ORDER BY NEWID())
	SET @IdRegistro = @IdRegistro + 1
	SET @PacienteUsuarioId = (SELECT UsuarioId FROM Paciente p INNER JOIN Cita c ON p.UsuarioId = c.PacienteUsuarioId WHERE c.idCita = @VisitaCitaIdCita)
	INSERT INTO Historial VALUES (@PacienteUsuarioId, @VisitaCitaIdCita, @IdRegistro)
    FETCH NEXT FROM CursorVisitaId INTO @VisitaCitaIdCita
	
END
CLOSE CursorVisitaId 
DEALLOCATE CursorVisitaId
END
 
 
EXEC spGenerateHistory
