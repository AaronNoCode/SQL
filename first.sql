-- Se crea la base de datos con su nombre
create database holamundo;
-- Comando para mostrar todas las bases de datos activas
show databases;
-- Se selecciona la base de datos donde se ejecutarán los siguientes comandos SQL
use holamundo;
-- Crear tabla con su nombre, su identificador (obligatorio) con sus filas y columnas deseadas
CREATE TABLE animales (
	id int,
    tipo varchar(255),
    estado varchar(255),
    -- Se declara cuál va a ser la llave primaria de la tabla 
    PRIMARY KEY (id)
);
-- Comando para insertar un nuevo dato en una fila de la tabla
INSERT into animales (tipo, estado) VALUES ('chanchito', 'feliz');
/* El id tiene que auto incrementarse pero no viene definido por defecto, por eso se
   modifica la columna haciéndola auto incrementada */
ALTER TABLE animales MODIFY COLUMN id int auto_increment;
/* Comando para mostrar el comando (4th wall broken) para crear la tabla de arriba sin tener que 
   configurar el auto incremento */
SHOW CREATE TABLE animales;
/* Por defecto al copiar el comando del pop up de abajo sale entre comillas, se las debemos 
   quitar y también el texto que viene después del paréntesis (no es obligatorio en este momento) */
'CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

-- Sin las comillas y el texto sobrante queda así, los backticks indica lo que es string
CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT, -- Agrega el auto increment con este comando extra y que no puede ser nula
  -- El valor por defecto es null (más explícito) y no es necesario agregarlo nosotros (al menos en SQL)
  `tipo` varchar(255) DEFAULT NULL, 
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
 
-- Inserción de tres registros
INSERT into animales (tipo, estado) VALUES ('chanchito', 'feliz');
INSERT into animales (tipo, estado) VALUES ('dragon', 'enojado');
INSERT into animales (tipo, estado) VALUES ('perro', 'triste');

-- Listar todos los registros que hemos creado
SELECT * FROM animales; 
-- Listar registro donde el id sea 1 (sólo debe regresar un valor)
SELECT * FROM animales WHERE id = 1;
-- Listar registro donde el estado sea triste
SELECT * FROM animales WHERE estado = 'triste';
-- Con AND se agregan condiciones extra 
SELECT * FROM animales WHERE estado = 'enojado' AND tipo = 'dragon';

-- Actualizar registros (antes era 'triste')
UPDATE animales SET estado = 'feliz' WHERE id = 3; 

-- Eliminar
DELETE FROM animales WHERE estado = 'feliz';
 /* Error Code: 1175. You are using safe update mode and you tried to update a table 
 without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in 
 Preferences -> SQL Editor and reconnect.
*/
-- Ya con la KEY se puede eliminar
DELETE FROM animales WHERE id = 3;
-- Muestra todos los registros y ya no aparece el que tenía id = 3
SELECT * FROM animales; 

-- Pasa lo mismo con UPDATE
UPDATE animales SET estado ='enojado' WHERE tipo ='dragon';
/* Error Code: 1175. You are using safe update mode and you tried to update a table 
 without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in 
 Preferences -> SQL Editor and reconnect.
*/
