ALTER PROCEDURE spGenerateAvailableAppt @CitasDisponibles INT
AS
DECLARE @IdCitaDisp INT
DECLARE @DoctorUsuarioId INT
DECLARE @StatusCita VARCHAR (50)
DECLARE @FechaCitaDisp DATETIME
DECLARE @FromDate DATETIME 
SET @FromDate= '2017-01-01 8:00'
DECLARE @ToDate DATETIME
SET  @ToDate= '2021-12-31 17:00'
DECLARE CursorDoctorId CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR SELECT DISTINCT UsuarioId FROM Doctor

BEGIN
OPEN CursorDoctorId
FETCH NEXT FROM CursorDoctorId INTO @DoctorUsuarioId
WHILE @@FETCH_STATUS = 0
BEGIN 
    --WHILE @CitasDisponibles > 0
	--BEGIN 
	SET @IdCitaDisp = (SELECT ISNULL(MAX(IdCitaDisp),0) FROM CitasDisponibles)
	SET @IdCitaDisp = @IdCitaDisp +1
	SET @StatusCita = 'Disponible'
	SET @FechaCitaDisp = (SELECT DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @FromDate, @ToDate)), DATEADD(SECOND,(RAND()*(1+28800)),@FromDate)))
	INSERT INTO CitasDisponibles VALUES (@IdCitaDisp, @DoctorUsuarioId, @StatusCita, @FechaCitaDisp)
	SET @CitasDisponibles = @CitasDisponibles -1
    FETCH NEXT FROM CursorDoctorId INTO @DoctorUsuarioId
	--END
END
CLOSE CursorDoctorId 
DEALLOCATE CursorDoctorId
END
 
 ----RUN THIS EXEC MULTIPLE TIMES, IT CREATES ONE OPENING FOR EACH DOCTOR
EXEC spGenerateAvailableAppt 1



