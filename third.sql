CREATE TABLE products (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    created_by int NOT NULL,
    marca varchar(50) NOT NULL,
    PRIMARY KEY(id),
    -- La llave foránea es una ligadura a otra tabla, se referencía nombrando la tabla y la columna
    FOREIGN KEY(created_by) REFERENCES user(id)
);

-- Cómo renombrar una tabla
RENAME TABLE products to product;

-- Cómo insertar múltiples registros con una sola llamada
INSERT INTO product (name, created_by, marca)
values
	('ipad', 1, 'apple'),
    ('iphone', 1, 'apple'),
    ('macbook', 1, 'apple'),
    ('applewatch', 2, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');
    

-- LEFT JOIN --
/* Primero seleccionas las columnas que se van a mostrar, luego la primera tabla, luego indicas el alias(opcional), 
   luego va el LEFT JOIN, luego el nombre de la segunda tabla, alias (opcional) y la condición para que la información 
   complementaria de la segunda tabla se muestre (si no se cumple, se muestra NULL) 
*/
/* 
   La primera tabla es la base, y la segunda complementa con su información 
   (agrega el nombre del producto en los registros que tengan el mismo id (lo que está después del ON)) 
   En pocas palabras: retorna toda la información de las columnas mencionadas de la primera tabla 
   y agrega COMO EXTRA la información de la segunda tabla que cumpla con la condición después del ON 
*/
select u.id, u.user_name, p.name from user u left join product p ON u.id = p.created_by;
-- Forma alternativa sin alias a las tablas
select user.id, user.user_name, product.name from user left join product ON user.id = product.created_by;
-- Fancy way cambiando los nombres de los encabezados, agregando alias para las tablas en el query y ordenando la tabla por id ascendente
select u.id as ID, u.user_name as Productor, p.name as Producto from user u left join product p ON u.id = p.created_by order by id asc;


-- RIGHT JOIN --
/*
   En vez de que la tabla1 sea complementada con la tabla2, tabla2 es complementada con la tabla1 
   (por lo tanto los valores en la tabla1 que no estén relacionados con la tabla2, no se van a mostrar)
*/
select user.id, user.user_name, product.name from user right join product ON user.id = product.created_by;

-- INNER JOIN --
/*
	Muestra solamente los registros que coincidan 
*/
select user.id, user.user_name, product.name from user inner join product ON user.id = product.created_by;

-- CROSS JOIN --
/*
	Retorna el producto cartesiano de las dos tablas (todas las filas combinadas con las filas de la otra tabla)
    Ejemplo: tienes en una tabla 2 alumnos y en otra tabla 3 clases, cross join va a pasar esos dos alumnos por todas
			 las clases, dando como resultado una tabla con 6 filas de cada alumno en cada clase (el mismo alumno en las
             tres clases y el otro alumno también en las tres clases)
    CUIDADO porque puede devolver muchísimos registros
*/
-- No necesita especificarse un ON 
select user.id,  user.user_name, product.id, product.name from user cross join product;


-- GROUP BY --
/*
	Agrupar elementos por columna, se usa acompañado de count
*/
-- Cuenta cuántos productos agregó cada id de user, para eso necesitas hacer un join y mostrar los user name
select count(p.id), u.user_name from product p left join user u ON u.id = p.created_by group by p.created_by;
-- Cuenta los nombres del producto que hemos agregado 
select count(name), marca from product group by marca;

-- HAVING --
/*
	Se agrega al final de la query 
	Para arrojar resultados que sean relevantes, donde su conteo sea mayor que un número (por ejemplo), 
    aplican todas las condicionantes ya vistas.
*/
select count(p.id), u.user_name from product p left join user u ON u.id = p.created_by group by p.created_by having count(u.id) >= 2;

-- DROP TABLE--
/*
	Para eliminar una tabla
*/

drop table product;
-- Para eliminar varias tablas
drop table animales, user;









