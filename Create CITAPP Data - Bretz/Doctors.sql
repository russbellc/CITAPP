ALTER PROCEDURE spGenerateDoctors @Doctors INT
AS
DECLARE @Id INT
DECLARE @Especialidad VARCHAR(40)

BEGIN
WHILE @Doctors > 0
	BEGIN
	SET @Id = (SELECT TOP 1 ISNULL(Id,0) FROM Usuario ORDER BY NEWID())
	WHILE (EXISTS(SELECT UsuarioId FROM Doctor WHERE UsuarioId = @Id))
		BEGIN
		SET @Id = (SELECT TOP 1 Id FROM Usuario ORDER BY NEWID())
		END
	SET @Especialidad = (SELECT TOP 1 Especialidad FROM Especialidades ORDER BY NEWID())
	INSERT INTO Doctor VALUES (@Id, @Especialidad)
	SET @Doctors = @Doctors - 1
	END
END

EXEC spGenerateDoctors 900