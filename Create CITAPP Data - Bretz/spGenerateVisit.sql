ALTER PROCEDURE spGeneratePrescription
AS
DECLARE @CitaIdCita INT
DECLARE @SignosVitales VARCHAR(255)
DECLARE @Peso DECIMAL(18,4)
DECLARE @Estatura DECIMAL(18,4)
DECLARE @Sintomas VARCHAR(255)
DECLARE @Diagnostico VARCHAR(255)

DECLARE CursorCitaId CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR SELECT DISTINCT IdCita FROM  Cita c  INNER JOIN CitasDisponibles cd ON c.CitasDispobiblesIdCitaDisp = cd.IdCitaDisp WHERE cd.FechaCitaDisp < GETDATE()
BEGIN
OPEN CursorCitaId
FETCH NEXT FROM CursorCitaId INTO @CitaIdCita
WHILE @@FETCH_STATUS = 0
BEGIN 
	SET @SignosVitales = (SELECT CAST(FLOOR(RAND()*(150-100)+100)AS VARCHAR)AS VARCHAR) +'/' +  (SELECT CAST(FLOOR(RAND()*(100-65)+65)AS VARCHAR)AS VARCHAR)
	SET @Peso = (SELECT CAST(RAND()*(150-45)+45 AS FLOAT) AS 'Peso')
	SET @Estatura = (SELECT CAST(RAND()*(2-1)+1 AS FLOAT) AS 'Estatura')
	SET @Sintomas = 'Presenta sintomas de ' + (SELECT MotivoCita FROM Cita WHERE IdCita = @CitaIdCita)
	SET @Diagnostico = 'Diagnostico correcto de ' + @Sintomas

	INSERT INTO Visita VALUES (@CitaIdCita, @SignosVitales, @Sintomas, @Diagnostico, @Peso, @Estatura)
    FETCH NEXT FROM CursorCitaId INTO @CitaIdCita
	
END
CLOSE CursorCitaId 
DEALLOCATE CursorCitaId
END
 

 EXEC spGenerateVisit