--Tabla para usuarios Table 
CREATE TABLE UsuarioAlt(
Id INT,
Usuario VARCHAR(20),
Pass VARCHAR(30),
Nombre VARCHAR(200),
Apellido VARCHAR(200),
Telefono BIGINT
PRIMARY KEY (Id),
UNIQUE (Id)--
)
--Tabla Especialidades--
CREATE TABLE Especialidad(
Especialidad VARCHAR(200)
)

--Llenar  Tabla Especialidad--
INSERT INTO Especialidad VALUES('Cardiologo')
INSERT INTO Especialidad VALUES('Neurologo')
INSERT INTO Especialidad VALUES('Medico General')
INSERT INTO Especialidad VALUES('Ginecolgo')
INSERT INTO Especialidad VALUES('Cirujano Plastico')
INSERT INTO Especialidad VALUES('Dermatologo')
INSERT INTO Especialidad VALUES('Cardiologo')
INSERT INTO Especialidad VALUES('Endocrinologo')
INSERT INTO Especialidad VALUES('Oftalmologo')
INSERT INTO Especialidad VALUES('Urolgo')
--usuarios sp--
CREATE PROCEDURE crearusuarios
(
    @numusuarios int
)
AS
declare  @numactual int, @firstname varchar(50), @lastname varchar(50), @fechanacimiento DATE, @usuario varchar(50), 
@pass varchar(50), @telephone BIGINT
set @numactual = (SELECT COUNT(*) FROM Usuario)
WHILE @numactual <= @numusuarios
BEGIN
	set @firstname = (SELECT TOP 1 first_name from Name ORDER BY NEWID())
	set @lastname = (SELECT TOP 1 last_name from Name ORDER BY NEWID())
	set @fechanacimiento =DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 29200), '1935-01-01')
	set @usuario = @firstname + @lastname + CONVERT(varchar(10), year(@fechanacimiento))
	set @pass = @lastname + CONVERT(varchar(10), year(@fechanacimiento))
	set @telephone = convert(numeric(12,0),rand() * 899999999999) + 100000000000
	INSERT INTO Usuario VALUES(@numactual + 10000, @usuario, @pass, @firstname, @lastname, @telephone)
	INSERT INTO UsuarioAlt VALUES(@numactual + 10000, @usuario, @pass, @firstname, @lastname, @telephone)
	set @numactual = @numactual + 1
END;

EXEC crearusuarios @numusuarios = 100

--Crear Sp Generar Doctores--
CREATE PROCEDURE generardoctores
(
@numdoctores int
)
AS
declare @numactual int, @id int
set @numactual = (SELECT COUNT(*) FROM Doctor)
WHILE @numactual < @numdoctores-1
BEGIN
	SET @id = (SELECT TOP 1 id from UsuarioAlt ORDER BY NEWID())
	INSERT INTO Doctor VALUES(@id, (SELECT TOP 1 Especialidad from Especialidad ORDER BY NEWID()))
	DELETE FROM UsuarioAlt WHERE @id = id
	set @numactual = @numactual + 1
END

EXEC generardoctores @numdoctores = 40

