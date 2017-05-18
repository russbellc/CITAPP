CREATE TABLE Usuario(
Id INT,
Usuario VARCHAR(20),
Pass VARCHAR(30),
Nombre VARCHAR(200),
Apellido VARCHAR(200),
Telefono BIGINT
CONSTRAINT tablaPK PRIMARY KEY (Id),
CONSTRAINT tablaUQ UNIQUE (Id)
)

create TABLE Doctor(
UsuarioId INTEGER PRIMARY KEY,
Especialidad VARCHAR(200)
CONSTRAINT tablaFK FOREIGN KEY (UsuarioId)
REFERENCES Usuario(Id),
)

CREATE TABLE Paciente(
UsuarioId INTEGER,
TipoSangre VARCHAR(20),
Estatura DECIMAL(18,4),
Peso DECIMAL(18,4),
Alergias VARCHAR(250),
StatusPaciente VARCHAR(20),
FechaNac DATETIME,
PRIMARY KEY (UsuarioId),
CONSTRAINT TablaForeignKey FOREIGN KEY (UsuarioId)
REFERENCES Usuario(Id),
)

CREATE TABLE CitasDisponibles(
IdCitaDisp INT,
DoctorUsuarioId INT,
StatusCita VARCHAR(30),
FechaCitaDisp DATETIME
PRIMARY KEY(IdCitaDisp),
FOREIGN KEY (DoctorUsuarioId)
REFERENCES Doctor(UsuarioId)
)


CREATE TABLE Cita(
IdCita INT,
CitasDispobiblesIdCitaDisp INTEGER,
PacienteUsuarioId INTEGER,
MotivoCita VARCHAR(255),
StatusCita VARCHAR(255),
VisitaAnterior INTEGER,
PRIMARY KEY(IdCita),
FOREIGN KEY (CitasDispobiblesIdCitaDisp)
REFERENCES CitasDisponibles(IdCitaDisp),
FOREIGN KEY (PacienteUsuarioId)
REFERENCES Paciente(UsuarioId)
)

CREATE TABLE Visita(
CitaIdCita INT,
SignosVitales VARCHAR(255),
Peso DECIMAL(18,4),
Estatura DECIMAL(18,4),
Sintomas VARCHAR(255),
Diagnostico VARCHAR(255),
PRIMARY KEY (CitaIdCita),
FOREIGN KEY(CitaIdCita)
REFERENCES  Cita(IdCita)
)

CREATE TABLE Historial(
IdRegistro INT,
PacienteUsuarioId INT,
VisitaCitaIdCita INT,
PRIMARY KEY (PacienteUsuarioId),
FOREIGN KEY (PacienteUsuarioId)
REFERENCES Paciente(UsuarioId),
FOREIGN KEY (VisitaCitaIdCita)
REFERENCES Visita(CitaIdCita),
)

CREATE TABLE Recetas(
VisitaCitaIdCita INT,
Folio INT,
Fecha DATETIME,
Medicamento VARCHAR(255),
Frecuencia INT,
DiasDuracion INT,
PRIMARY KEY (VisitaCitaIdCita),
FOREIGN KEY (VisitaCitaIdCita)
REFERENCES Visita(CitaIdCita)

)