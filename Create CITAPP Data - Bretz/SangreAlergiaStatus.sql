CREATE TABLE TiposDeSangre
(
	Id INT,
	TipoSangre VARCHAR(50)
)
INSERT INTO TiposDeSangre VALUES (1, 'O Negativo');
INSERT INTO TiposDeSangre VALUES (2, 'O Positivo');
INSERT INTO TiposDeSangre VALUES (3, 'A Negativo');
INSERT INTO TiposDeSangre VALUES (4, 'A Positivo');
INSERT INTO TiposDeSangre VALUES (5, 'B Negativo');
INSERT INTO TiposDeSangre VALUES (6, 'B Positivo');
INSERT INTO TiposDeSangre VALUES (7, 'AB Negativo');
INSERT INTO TiposDeSangre VALUES (8, 'AB Positivo');

------------------------------------------------------------------------------
CREATE TABLE Alergias
(
	Id INT,
	Alergia VARCHAR(50)
)
INSERT INTO Alergias VALUES (1, 'Polen');
INSERT INTO Alergias VALUES (2, 'Latex');
INSERT INTO Alergias VALUES (3, 'Pelo');
INSERT INTO Alergias VALUES (4, 'Polvo');
INSERT INTO Alergias VALUES (5, 'Humedad');
INSERT INTO Alergias VALUES (6, 'Sol');
INSERT INTO Alergias VALUES (7, 'Abejas');
INSERT INTO Alergias VALUES (8, 'Huevos');
INSERT INTO Alergias VALUES (9, 'Nueces');
INSERT INTO Alergias VALUES (10, 'Mariscos');
INSERT INTO Alergias VALUES (11, 'Perfumes');
INSERT INTO Alergias VALUES (12, 'Animales');
INSERT INTO Alergias VALUES (13, 'Niquel');
INSERT INTO Alergias VALUES (14, 'Telas');
INSERT INTO Alergias VALUES (15, 'Cosmeticos');
INSERT INTO Alergias VALUES (16, 'Protector solar');
INSERT INTO Alergias VALUES (17, 'Adhesivos');
INSERT INTO Alergias VALUES (18, 'Pulmonar');
INSERT INTO Alergias VALUES (19, 'Acaros');
INSERT INTO Alergias VALUES (20, 'Penicilina'); 
INSERT INTO Alergias VALUES (21, 'Moho'); 
INSERT INTO Alergias VALUES (22, 'Arañas'); 
INSERT INTO Alergias VALUES (23, 'Cucarachas'); 
INSERT INTO Alergias VALUES (24, 'Agua'); 
INSERT INTO Alergias VALUES (25, 'Hormonas'); 
INSERT INTO Alergias VALUES (26, 'Frio'); 
INSERT INTO Alergias VALUES (27, 'Hongos'); 
INSERT INTO Alergias VALUES (28, 'Insulina'); 
INSERT INTO Alergias VALUES (29, 'Anestecia'); 
INSERT INTO Alergias VALUES (30, 'Sulfamidas'); 
INSERT INTO Alergias VALUES (31, 'Ninguna'); 
INSERT INTO Alergias VALUES (32, 'Ninguna'); 
INSERT INTO Alergias VALUES (33, 'Ninguna'); 
INSERT INTO Alergias VALUES (34, 'Ninguna'); 
INSERT INTO Alergias VALUES (35, 'Ninguna'); 
INSERT INTO Alergias VALUES (36, 'Ninguna'); 
INSERT INTO Alergias VALUES (37, 'Ninguna'); 
INSERT INTO Alergias VALUES (38, 'Ninguna'); 
INSERT INTO Alergias VALUES (39, 'Ninguna'); 
INSERT INTO Alergias VALUES (40, 'Ninguna'); 
INSERT INTO Alergias VALUES (41, 'Ninguna'); 
INSERT INTO Alergias VALUES (42, 'Ninguna'); 
INSERT INTO Alergias VALUES (43, 'Ninguna'); 
INSERT INTO Alergias VALUES (44, 'Ninguna'); 
INSERT INTO Alergias VALUES (45, 'Ninguna'); 
INSERT INTO Alergias VALUES (46, 'Ninguna'); 
INSERT INTO Alergias VALUES (47, 'Ninguna'); 
INSERT INTO Alergias VALUES (48, 'Ninguna'); 
INSERT INTO Alergias VALUES (49, 'Ninguna'); 
INSERT INTO Alergias VALUES (50, 'Ninguna'); 
INSERT INTO Alergias VALUES (51, 'Ninguna'); 
INSERT INTO Alergias VALUES (52, 'Ninguna'); 
INSERT INTO Alergias VALUES (53, 'Ninguna'); 
INSERT INTO Alergias VALUES (54, 'Ninguna'); 
INSERT INTO Alergias VALUES (55, 'Ninguna'); 
INSERT INTO Alergias VALUES (56, 'Ninguna'); 
INSERT INTO Alergias VALUES (57, 'Ninguna'); 
INSERT INTO Alergias VALUES (58, 'Ninguna'); 
INSERT INTO Alergias VALUES (59, 'Ninguna'); 
INSERT INTO Alergias VALUES (60, 'Ninguna'); 


------------------------------------------------------------------------------
CREATE TABLE TiposStatus
(
	Id INT,
	StatusPaciente VARCHAR(50)
)
INSERT INTO TiposStatus VALUES (1, 'Activo');
INSERT INTO TiposStatus VALUES (2, 'Inactivo');
INSERT INTO TiposStatus VALUES (3, 'Suspendido');
INSERT INTO TiposStatus VALUES (4, 'Fallecido');
INSERT INTO TiposStatus VALUES (5, 'Standby');
INSERT INTO TiposStatus VALUES (6, 'Activo');
INSERT INTO TiposStatus VALUES (7, 'Activo');
INSERT INTO TiposStatus VALUES (8, 'Activo');
INSERT INTO TiposStatus VALUES (9, 'Activo');
INSERT INTO TiposStatus VALUES (10, 'Activo');
INSERT INTO TiposStatus VALUES (11, 'Activo');
INSERT INTO TiposStatus VALUES (12, 'Activo');
INSERT INTO TiposStatus VALUES (13, 'Activo');
INSERT INTO TiposStatus VALUES (14, 'Activo');
INSERT INTO TiposStatus VALUES (15, 'Activo');
INSERT INTO TiposStatus VALUES (16, 'Activo');
INSERT INTO TiposStatus VALUES (17, 'Activo');
INSERT INTO TiposStatus VALUES (18, 'Activo');
INSERT INTO TiposStatus VALUES (19, 'Activo');
INSERT INTO TiposStatus VALUES (20, 'Activo');
-------------------------------------------------------------------

CREATE TABLE StatusCitas
(
	Id INT,
	StatusCita VARCHAR(50)
)
INSERT INTO StatusCitas VALUES (1, 'Disponible');
INSERT INTO StatusCitas VALUES (2, 'Ocupada');
INSERT INTO StatusCitas VALUES (3, 'Expirada');
INSERT INTO StatusCitas VALUES (4, 'Cancelada');

------------------------------------------------------------------------------
CREATE TABLE Medicamentos
(
	Id INT,
	Medicamento VARCHAR(50)
)
INSERT INTO Medicamentos VALUES (1, 'Paracetamol');
INSERT INTO Medicamentos VALUES (2, 'Naloxona');
INSERT INTO Medicamentos VALUES (3, 'Acetilcisteína');
INSERT INTO Medicamentos VALUES (4, 'Pralidoxima');
INSERT INTO Medicamentos VALUES (5, 'Calcioedetato sódico ');
INSERT INTO Medicamentos VALUES (6, 'Penicilamina');
INSERT INTO Medicamentos VALUES (7, 'Dimercaprol');
INSERT INTO Medicamentos VALUES (8, 'Flumazenil');
INSERT INTO Medicamentos VALUES (9, 'Fentanilo Citrato ');
INSERT INTO Medicamentos VALUES (10, 'Droperidol');
INSERT INTO Medicamentos VALUES (11, 'Pancuronio');
INSERT INTO Medicamentos VALUES (12, 'Suxametonio');
INSERT INTO Medicamentos VALUES (13, 'Bupivacaina');
INSERT INTO Medicamentos VALUES (14, 'Lidocaína');
INSERT INTO Medicamentos VALUES (15, 'Oxígeno');
INSERT INTO Medicamentos VALUES (16, 'Sevoflurano');
INSERT INTO Medicamentos VALUES (17, 'Isoflurano');
INSERT INTO Medicamentos VALUES (18, 'Propofol');
INSERT INTO Medicamentos VALUES (19, 'Ketamina');
INSERT INTO Medicamentos VALUES (20, 'Tiopental'); 
INSERT INTO Medicamentos VALUES (21, 'Midazolam'); 
INSERT INTO Medicamentos VALUES (22, 'Atropina'); 
INSERT INTO Medicamentos VALUES (23, 'Escopolamina'); 
INSERT INTO Medicamentos VALUES (24, 'Vacuna conjugada DPT'); 
INSERT INTO Medicamentos VALUES (25, 'Vacuna DT'); 
INSERT INTO Medicamentos VALUES (26, 'Ciproterona'); 
INSERT INTO Medicamentos VALUES (27, 'Vasopresina'); 
INSERT INTO Medicamentos VALUES (28, 'Insulina'); 
INSERT INTO Medicamentos VALUES (29, 'Anestecia'); 
INSERT INTO Medicamentos VALUES (30, 'Sulfamidas'); 
INSERT INTO Medicamentos VALUES (31, 'Desmopresina'); 
INSERT INTO Medicamentos VALUES (32, 'Bromocriptina'); 
INSERT INTO Medicamentos VALUES (33, 'Mesilato'); 
INSERT INTO Medicamentos VALUES (34, 'Propranolol'); 
INSERT INTO Medicamentos VALUES (35, 'Metimazol'); 
INSERT INTO Medicamentos VALUES (36, 'Levotiroxina'); 
INSERT INTO Medicamentos VALUES (37, 'Metformina'); 
INSERT INTO Medicamentos VALUES (38, 'Insulina'); 
INSERT INTO Medicamentos VALUES (39, 'Betametasona'); 
INSERT INTO Medicamentos VALUES (40, 'Dexametasona'); 
INSERT INTO Medicamentos VALUES (41, 'Metilprednisolona'); 
INSERT INTO Medicamentos VALUES (42, 'Prednisona'); 
INSERT INTO Medicamentos VALUES (43, 'Hidrocortisona'); 
INSERT INTO Medicamentos VALUES (44, 'Diclofenac'); 
INSERT INTO Medicamentos VALUES (45, 'Ibuprofeno'); 
INSERT INTO Medicamentos VALUES (46, 'Indometacina'); 
INSERT INTO Medicamentos VALUES (47, 'Dipirona'); 
INSERT INTO Medicamentos VALUES (48, 'Morfina'); 
INSERT INTO Medicamentos VALUES (49, 'Vitamina C '); 
INSERT INTO Medicamentos VALUES (50, 'Retinol'); 
INSERT INTO Medicamentos VALUES (51, 'Nicotinamida'); 
INSERT INTO Medicamentos VALUES (52, 'Piridoxina'); 
INSERT INTO Medicamentos VALUES (53, 'Messna'); 
INSERT INTO Medicamentos VALUES (54, 'Leucovorin'); 
INSERT INTO Medicamentos VALUES (55, 'Levamisol'); 
INSERT INTO Medicamentos VALUES (56, 'Molgramostim'); 
INSERT INTO Medicamentos VALUES (57, 'Tamoxifeno'); 
INSERT INTO Medicamentos VALUES (58, 'Carboplatino'); 
INSERT INTO Medicamentos VALUES (59, 'Vimblastina'); 
INSERT INTO Medicamentos VALUES (60, 'Clorambucil'); 

