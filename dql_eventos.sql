
USE sakila;
-- InformeAlquileresMensual: Genera un informe mensual de alquileres y lo almacena automáticamente.
DELIMITER ;
CREATE TABLE informe_mensual (
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    fecha_alquiler INT,
    id_inventario INT,
    id_cliente int,
    fecha_devolucion datetime,
    id_empleado int,
    ultima_actualizacion timestamp
);
DELIMITER //
CREATE EVENT informe
ON SCHEDULE EVERY 1 MONTH 
STARTS '2025-04-12 00:00:00'
DO
BEGIN
    INSERT INTO Informe_mensual (id_alquiler, fecha_alquiler, id_inventario, id_cliente, fecha_devolucion, id_empleado, ultima_actualizacion)
    SELECT WEEK(NOW()), COUNT(*), NOW()
    FROM alquiler ;
END //
DELIMITER ;

-- AlertaPeliculasNoAlquiladas: Envía una alerta cuando una película no ha sido alquilada en el último año.

CREATE TABLE Alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    mensaje VARCHAR(255) NOT NULL,
    fecha DATETIME NOT NULL
);
DELIMITER //
CREATE EVENT alertapresupuestos
ON SCHEDULE EVERY 1 MONTH
STARTS '2025-03-20 00:00:00'
DO
BEGIN
    INSERT INTO Alerta (mensaje, fecha)
    SELECT CONCAT('pelicula no alquilada: ', titulo, ' - ', ultima_actualizacion), NOW()
    FROM pelicula
    WHERE duracion_alquiler = NULL  ;
END //
