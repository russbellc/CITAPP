CREATE PROCEDURE ApptUpToDate
AS
BEGIN
DELETE FROM CitasDisponibles WHERE Fecha < GETDATE()
END