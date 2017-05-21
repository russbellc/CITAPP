ALTER PROCEDURE spGenerateUser @Users INT
AS
DECLARE @Id INT
DECLARE @Usuario VARCHAR(20)
DECLARE @Pass VARCHAR(30)
DECLARE @Nombre VARCHAR(200)
DECLARE @Apellido VARCHAR(200)
DECLARE @Telefono BIGINT

BEGIN
WHILE @Users > 0
	BEGIN
	SET @Id = (SELECT ISNULL(MAX(Id),0) FROM Usuario)
	SET @Id = @Id+1
	SET @Nombre = (SELECT TOP 1 FirstName FROM FirstNames ORDER BY NEWID())
	SET @Apellido = (SELECT TOP 1 LastName FROM LastNames ORDER BY NEWID())
	SET @Usuario = @Nombre + '.' + @Apellido
	IF EXISTS(SELECT Usuario FROM Usuario WHERE Usuario = @Usuario)
		BEGIN
		SET @Usuario = @Usuario + CAST(FLOOR(RAND()*(10000-1)+1) AS VARCHAR(16))
		END
	SET @Pass = (SELECT SUBSTRING(CONVERT(varchar(255), NEWID()), 0, 9))
	SET @Telefono = (SELECT FLOOR(RAND() * POWER(CAST(10 as BIGINT), 10)))
	INSERT INTO Usuario VALUES (@Id, @Usuario, @Pass, @Nombre, @Apellido, @Telefono)
	SET @Users = @Users - 1
	END
END


EXEC spGenerateUser 200000


SELECT COUNT(Id) FROM Usuario
