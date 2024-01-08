CREATE TABLE user (
    id int NOT NULL AUTO_INCREMENT,
    user_name varchar(50) NOT NULL,
    age int NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (id)
);

-- Inserción de cuatro registros
INSERT INTO user (user_name, age, email)
VALUES ('Layla', 98, 'layla@gmail.com');
INSERT INTO user (user_name, age, email)
VALUES ('Omar', 30, 'omar@gmail.com');
INSERT INTO user (user_name, age, email)
VALUES ('Aaron', 21, 'aaron@gmail.com');
INSERT INTO user (user_name, age, email)
VALUES ('Daniel', 24, 'daniel@gmail.com');


-- Limita cuántos registros retorna (si hay varios valores coincidentes, regresa el primero que encuentra)
SELECT *
FROM user
LIMIT 1;


-- Condición con mayor que (se le puede agregar limit al final, si no, regresa todos los que cumplen con la condición)
-- Aplica con >=, <, <=
SELECT *
FROM user
WHERE age > 25;

-- Condición extendida con un segundo valor --
SELECT *
FROM user
WHERE age > 20
    AND email = 'omar@gmail.com';


-- Operador OR --
SELECT *
FROM user
WHERE age = 24
    OR email = 'aaron@gmail.com';


-- Retorna todos los correos EXCEPTO...
SELECT *
FROM user
WHERE email != 'aaron@gmail.com';


-- Retorna todos los regitros donde el valor del campo esté entre el rango de las dos condiciones
SELECT *
FROM user
WHERE age BETWEEN 20 AND 30;


-- Indica que quiero todos los registros que contengan la cadena, SIN IMPORTAR SU INICIO NI FINAL
SELECT *
FROM user
WHERE email LIKE '%gmail%';


-- Puede ser %gmail para que NO IMPORTA LO QUE HAYA ANTES pero que la cadena TERMINE con gmail
SELECT *
FROM user
WHERE email LIKE '%gmail';


-- O gmail% para indicar que la cadena tiene que INICIAR CON gmail y NO IMPORTA LO QUE HAYA DESPUÉS
SELECT *
FROM user
WHERE email LIKE 'gmail%';


-- Muestra los registros en un orden específico (ASCENDENTE (ASC) O DESCENDENTE (DESC))
SELECT *
FROM user
ORDER BY age ASC;
SELECT *
FROM user
ORDER BY age DESC;


-- Seleccionar el valor MÁXIMO del campo elegido y se le asocia un alias
SELECT MAX(age) AS mayor
FROM user;
-- Seleccionar el valor MÍNIMO del campo elegido y se le asocia un alias
SELECT MIN(age) AS menor
FROM user;
/* 
 Después de select se usa max o min SON FUNCIONES y por eso se usan con paréntesis 
 con el nombre de la columna dentro, Después se pone AS seguido del alias que 
 queremos ponerle, al final se especifica la tabla de donde se va a sacar el dato
*/


-- Seleccionar solamente las columnas que nos interesan
SELECT age,
    user_name
FROM user;
-- Se le puede agregar un alias también a las columnas cuando se muestran en consola
SELECT age,
    user_name AS nombre
FROM user;
