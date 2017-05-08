CREATE TABLE Usuario(
ID int,
USUARIO VARCHAR(20),
PASSWORD VARCHAR(30),
NOMBRE VARCHAR(200),
APELLIDO VARCHAR(200),
TELEFONO BIGINT
CONSTRAINT tabla_pk PRIMARY KEY (ID),

CONSTRAINT tabla_uq UNIQUE (ID)
)

create TABLE Doctor(
USUARIO_ID INTEGER PRIMARY KEY,
ESPECIALIDAD VARCHAR(200)
CONSTRAINT tabla_fk FOREIGN KEY (USUARIO_ID)

REFERENCES Usuario(ID),
)

CREATE TABLE Paciente(
USUARIO_ID INTEGER,
TIPOSANGRE VARCHAR(10),
ESTATURA INT,
PESO INT,
ALERGIAS VARCHAR(250),
STATUS VARCHAR(20),
FechaNac DATE,
PRIMARY KEY (USUARIO_ID),
CONSTRAINT tabla_foreignkey FOREIGN KEY (USUARIO_ID)

REFERENCES Usuario(ID),
)

CREATE TABLE CitasDisponibles(
idCitaDisp INT,
Doctor_Usuario_id INT,
status VARCHAR(30),
fecha DATE,
hora TIME
PRIMARY KEY(idCitaDisp),
FOREIGN KEY (Doctor_Usuario_id)
REFERENCES Doctor(USUARIO_ID)
)

CREATE TABLE Cita(
idCita VARCHAR(255),
CitasDispobibles_idCitaDisp INTEGER,
Paciente_Usuario_id INTEGER,
motivoCita varchar(255),
status VARCHAR(255),
visitaAnterior INTEGER,
PRIMARY KEY(idCita),
FOREIGN KEY (CitasDispobibles_idCitaDisp)
REFERENCES CitasDisponibles(idCitaDisp),
FOREIGN KEY (Paciente_Usuario_id)
REFERENCES Paciente(USUARIO_ID)
)

CREATE TABLE Visita(
Cita_idCita VARCHAR(255),
signosVitales VARCHAR(255),
peso INT,
estatura INT,
sintomas VARCHAR(255),
diagnostico VARCHAR(255),
PRIMARY KEY (Cita_idCita),
foreign key(Cita_idCita)
REFERENCES  Cita(idCita)
)

CREATE TABLE Historial(
Paciente_Usuario_id INT,
Visita_Cita_idCita VARCHAR(255),
PRIMARY KEY (Paciente_Usuario_id),
FOREIGN KEY (Paciente_Usuario_id)
REFERENCES Paciente(USUARIO_ID),
FOREIGN KEY (Visita_Cita_idCita)
REFERENCES Visita(Cita_idCita),
)

CREATE TABLE Recetas(
Visita_Cita_idCita VARCHAR(255),
Folio INT,
Fecha DATE,
Medicamento VARCHAR(255),
Frecuencia INT,
diasDuracion INT,
PRIMARY KEY (Visita_Cita_idCita),
FOREIGN KEY (Visita_Cita_idCita)
REFERENCES Visita(Cita_idCita)

)