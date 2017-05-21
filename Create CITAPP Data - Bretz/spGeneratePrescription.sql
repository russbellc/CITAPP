ALTER PROCEDURE spGeneratePrescription  
AS
DECLARE @VisitaCitaIdCita INT
DECLARE @Folio INT
DECLARE @Fecha DATETIME
DECLARE @Medicamento VARCHAR(255)
DECLARE @Frecuencia INT
DECLARE @DiasDuracion INT


DECLARE CursorVisitaId CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR SELECT DISTINCT CitaIdCita FROM Visita
BEGIN
OPEN CursorVisitaId
FETCH NEXT FROM CursorVisitaId INTO @VisitaCitaIdCita
WHILE @@FETCH_STATUS = 0
BEGIN 
	SET @Folio = (SELECT CAST(FLOOR(RAND()*(100000-1000)+1000)AS VARCHAR)AS VARCHAR) 
	SET @Fecha = (SELECT FechaCitaDisp FROM  CitasDisponibles cd  INNER JOIN  Cita c ON c.CitasDispobiblesIdCitaDisp = cd.IdCitaDisp WHERE  c.IdCita = @VisitaCitaIdCita)
	SET @Medicamento = (SELECT TOP 1 Medicamento FROM Medicamentos ORDER BY NEWID())
	SET @Frecuencia = (SELECT CAST(FLOOR(RAND()*(24-1)+1) AS INT) AS INT)
	SET @DiasDuracion = (SELECT CAST(FLOOR(RAND()*(30-1)+1) AS VARCHAR) AS VARCHAR)

	INSERT INTO Recetas VALUES (@VisitaCitaIdCita, @Folio, @Fecha, @Medicamento, @Frecuencia, @DiasDuracion)
    FETCH NEXT FROM CursorVisitaId INTO @VisitaCitaIdCita
	
END
CLOSE CursorVisitaId 
DEALLOCATE CursorVisitaId
END
 

 EXEC spGeneratePrescription