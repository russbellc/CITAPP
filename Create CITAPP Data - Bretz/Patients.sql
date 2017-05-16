ALTER PROCEDURE spGeneratePatients @Patients INT
AS
DECLARE @Id INT
DECLARE @Estatura DECIMAL(18,4)
DECLARE @Peso DECIMAL (18,4)
DECLARE @Alergia VARCHAR(40)
DECLARE @FechaNac DATETIME
DECLARE @StatusPaciente VARCHAR(40)
DECLARE @TipoSangre VARCHAR(20)

BEGIN
WHILE @Patients > 0
	BEGIN
	SET @Id = (SELECT TOP 1 ISNULL(Id,0) FROM Usuario ORDER BY NEWID())
	WHILE (EXISTS(SELECT UsuarioId FROM Doctor WHERE UsuarioId = @Id))
	BEGIN
		SET @Id = (SELECT TOP 1 Id FROM Usuario ORDER BY NEWID())
		WHILE (EXISTS(SELECT UsuarioId FROM Paciente WHERE UsuarioId = @Id))
			BEGIN
			SET @Id = (SELECT TOP 1 Id FROM Usuario ORDER BY NEWID())
			END
	END
	SET @Estatura = (SELECT CAST(RAND()*(2-1)+1 AS FLOAT) AS 'Estatura')
	SET @Peso = (SELECT CAST(RAND()*(150-45)+45 AS FLOAT) AS 'Peso')
	SET @Alergia = (SELECT TOP 1 Alergia FROM Alergias ORDER BY NEWID())
	SET @FechaNac = (SELECT CAST(CAST(RAND()*(40177-13514)+13514 AS INT) AS DATETIME))
	SET @StatusPaciente = (SELECT TOP 1 StatusPaciente FROM TiposStatus ORDER BY NEWID())
	SET @TipoSangre = (SELECT TOP 1 TipoSangre FROM TiposDeSangre ORDER BY NEWID())
	INSERT INTO Paciente VALUES (@Id, @Alergia, @FechaNac, @StatusPaciente, @TipoSangre, @Estatura, @Peso)
	SET @Patients = @Patients - 1
	END
END

EXEC spGeneratePatients 1000

