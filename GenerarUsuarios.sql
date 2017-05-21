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
--Tabla blood type--
CREATE TABLE TipoSangre(
TipoSangre VARCHAR(10)
)
INSERT INTO TipoSangre VALUES('A+')
INSERT INTO TipoSangre VALUES('A-')
INSERT INTO TipoSangre VALUES('B+')
INSERT INTO TipoSangre VALUES('B-')
INSERT INTO TipoSangre VALUES('AB+')
INSERT INTO TipoSangre VALUES('AB-')
INSERT INTO TipoSangre VALUES('O+')
INSERT INTO TipoSangre VALUES('O-')

--Tabla Alergias--
CREATE TABLE Alergias(
Alergias VARCHAR(250)
)
INSERT INTO Alergias VALUES('Anticonvulsivos')
INSERT INTO Alergias VALUES('Insulina')
INSERT INTO Alergias VALUES('Penicilina')
INSERT INTO Alergias VALUES('Sulfamidas')
--Tabla Status--
CREATE TABLE STATUS(
STATUS VARCHAR(20)
)
INSERT INTO STATUS VALUES('Alive')
INSERT INTO STATUS VALUES('Deceased')
--Tabla StatusCITA--
CREATE TABLE STATUSC(
STATUSC VARCHAR(20)
)
INSERT INTO STATUSC VALUES('Disponible')
INSERT INTO STATUSC VALUES('No Disponible')
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

CREATE PROCEDURE generarpacientes
(
@numpacientes int
)
AS
declare @numactual int, @id int, @bloodtype varchar(10), @estatura int, @peso int, @allergy varchar(250),@fechanacimiento DATE,
@STATUS varchar(20)
set @numactual = (SELECT COUNT(*) FROM Paciente)
WHILE @numactual <= @numpacientes
BEGIN
	SET @id = (SELECT TOP 1 id from UsuarioAlt ORDER BY NEWID())
	SET @bloodtype = (SELECT TOP 1 TipoSangre from TipoSangre ORDER BY NEWID())
	SET @allergy = (SELECT TOP 1 Alergias from Alergias ORDER BY NEWID())
	SET @STATUS = (SELECT TOP 1 STATUS from STATUS ORDER BY NEWID())
	SET @estatura = (ROUND(((195 - 155 -1) * RAND() + 155), 0))
	SET @peso = (ROUND(((95 - 65 -1) * RAND() + 65), 0))
	SET @fechanacimiento =DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 29200), '1935-01-01')
	INSERT INTO Paciente VALUES(@id, @bloodtype,@estatura,@peso,@allergy,@STATUS,@fechanacimiento)
	DELETE FROM UsuarioAlt WHERE @id = id
	SET @numactual = @numactual + 1
END

EXEC generarpacientes @numpacientes = 10

-- Generar Citas Disponibles--

CREATE PROCEDURE crearcitasd
(
    @numbusc int
)
AS
declare  @numactual int, @doctorid varchar(50), @statuscita varchar(50), @fechacita DATE, @usuario varchar(50), 
@pass varchar(50), @telephone BIGINT
set @numactual = (SELECT COUNT(*) FROM CitasDisponibles)
DECLARE @date_from AS DATETIME = GETDATE()
DECLARE @date_to AS DATETIME = '2017-12-31'i
DECLARE @days_diff AS INT = cast(@date_to - @date_from AS INT)
WHILE @numactual <= @numbusc
BEGIN
	set @doctorid = (SELECT TOP 1 UsuarioId from Doctor ORDER BY NEWID())
	set @statuscita = (SELECT TOP 1 STATUSC from STATUSC ORDER BY NEWID())
	set @fechacita =(SELECT @date_from +
	DATEADD(hour, ABS(CHECKSUM(newid()) % 24), 0) + DATEADD(day, ABS(CHECKSUM(newid()) % @days_diff), 0))
	INSERT INTO CitasDisponibles VALUES(@numactual + 1, @doctorid, @statuscita, @fechacita, @fechacita)
	SET @numactual = @numactual + 1
END;

EXEC crearcitasd @numbusc = 100000


CREATE PROCEDURE Generarcitaoficial (@CitaDisponibleID int, @Pacienteid int, @Motivo varchar(255))
AS
DECLARE @citaid varchar(255), @status varchar(255), @visitaAnterior INT, @PacienteVerificado INT, @CitaVerificada INT
SET @citaid = 'Cita: ' + CAST((SELECT COUNT(*) FROM Cita)  AS varchar(255))
SET @PacienteVerificado = (SELECT UsuarioId FROM Paciente WHERE @Pacienteid = UsuarioId)
SET @CitaVerificada = (SELECT IdCitaDisp FROM CitasDisponibles WHERE @CitaDisponibleID = IdCitaDisp)
SET @status = 'Active'
SET @visitaAnterior = (SELECT TOP(1) IdCita FROM Cita WHERE @Pacienteid = IdCita ORDER BY  NEWID())
INSERT INTO Cita VALUES(@citaid, @CitaDisponibleID, @PacienteVerificado, @Motivo, @status, @visitaAnterior)
	


EXEC generarcitaoficial @CitaDisponibleID = 99, @Pacienteid = 10018, @Motivo = 'Visita de Rutina'