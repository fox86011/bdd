---Tablas Muchos a Muchos
-----1 
---RELACION MUCHOS A MUCHOS ENTRE USUARIOS Y GRUPO



insert into usuarios values (1,'Marilyn','Sagñay','05/11/2023'),
							(2,'Romel','Chamba','06/11/2023'),
							(3,'Mario','Guzñay','05/11/2023'),
							(4,'Johann','Domo','07/11/2023'),
							(5,'Monserrate','Vera','05/11/2023'),
							(6,'Lucio','Vargas','05/11/2023'),
							(7,'Martín','Arizaga','05/11/2023'),
							(8,'Fricson','Erazo','05/11/2023'),
							(9,'Jairo','Obando','05/11/2023'),
							(10,'Berni','Tomalá','05/11/2023');
							
							
insert into grupo values (1,'Maternal 1','Grupo de maternal matutino','08/03/2020'),
						 (2,'Maternal 2','Grupo de maternal vepertino','08/03/2020'),
						 (3,'Maternal 3','Grupo de maternal nocturno','08/03/2020'),
						 (4,'Incial 1 ','Grupo de inicial matutino','15/03/2021'),
						 (5,'Incial 2','Grupo de  inicial vespertino','15/03/2021'),
						 (6,'Incial 3','Grupo de  inicial  nocturno','15/03/2021'),
						 (7,'Incial intensivo','Grupo de inicial días sabados','15/03/2021'),
						 (8,'Maternal intensivo 1','Grupo de maternal matutino días sabados','15/03/2022'),
						 (9,'Maternal intensivo 2','Grupo de maternal vespertino días sabados','15/03/2022'),
						 (10,'Maternal intensivo 3','Grupo de maternal nocturno días sabados','15/03/2022');


insert into usuario_grupo values (1,8),
								 (2,3),
								 (3,8),
								 (4,9),
								 (5,1),
								 (6,2),
								 (7,8),
								 (8,8),
								 (9,10),
								 (10,1);
								 
							 
								 
------2------------
--RELACION MUCHOS A MUCHOS HABITACIONES Y HUESPEDES

 insert into habitaciones values (1,40.0,4,4),
 								 (2,20.0,4,2),
								 (3,40.0,4,4),
								 (4,40.0,3,4),
								 (5,20.0,3,2),
								 (6,20.0,3,2),
								 (7,20.0,2,2),
								 (8,20.0,2,2),
								 (9,20.0,2,2),
								 (10,15.0,1,1),
								 (11,15.0,1,1),
								 (12,15.0,1,1);
								 

insert into huespedes values    (1,'Ricardo','Montero',0980658774,'Ricmontero@gmail.com'),
								(2,'Sofía','Martinez',09887563205,'Sofimar@gmail.com'),
								(3,'Yamilteh','Guami',0998763298,'YAMGUAM@gmail.com'),
								(4,'Esther','Contreras',0995783602,'Esthcontro@gmail.com'),
								(5,'Wiliam','Mantilla',09858796320,'wmANTILLA@gmail.com'),
								(6,'Carmen','Noguera',0995876321,'Cnoguera@gmail.com'),
								(7,'Anika','Jimenez',0978965432,'AniJimenez@gmail.com'),
								(8,'Belen','Orejuela',0996365748,'BOrejuela@gmail.com'),
								(9,'Diana','Monroy',0987963214,'DianaMroy@gmail.com'),
								(10,'Bryan','Moncada',0986325741,'BrMoncada@gmail.com');
												
								
insert into reservas values ('11/05/2023','12/05/2023',2,10),
						    ('11/05/2023','12/05/2023',2,9),
							('22/06/2023','23/06/2023',1,1),
							('22/06/2023','23/06/2023',1,2),
							('22/06/2023','23/06/2023',1,3),
							('22/06/2023','23/06/2023',1,4),
							('01/01/2023','02/01/2023',12,5),
							('11/08/2023','12/08/2023',11,6),
							('11/05/2023','12/05/2023',10,7),
							('11/05/2023','12/05/2023',9,8);
							


-------------3
--RELACION MUCHOS A MUCHOS MUNICIPIO Y PROYECTOS


insert into ciudad values   (1,'Quito'),
							(2,'Ambato'),
							(3,'Guayaquil'),
							(4,'Machala'),
							(5,'Manta'),
							(6,'Loja'),
							(7,'Otavalo'),
							(8,'Cuenca'),
							(9,'Latacunga'),
							(10,'Tena');


insert into municipio values (1,'GAD MUNICIPAL QUITO',1),
							 (2,'GAD MUNICIPAL DE CUENCA',8),
							 (3,'GAD MUNICIPALIDAD DE AMBATO',2),
							 (4,'MUNICIPALIDAD DE MACAHALA ',4),
							 (5,'MUNIUCIPIO DE GUAYAQUIL',3),
							 (6,'MUNICIPIO DE OTAVALO',7),
							 (7,'MUNICIPIO DE LOJA',6),
							 (8,'MUNICIPIO DE MANTA',5),
							 (9,'MUNICIPIO DE LATACUNGA',9),
							 (10,'MUNICIPIO DE TENA',10);


insert into proyecto values (1,'Proyectos de Gestión Ambiental',9543.327,'10/02/2022','10/02/2023'),
							(2,'Proyectos en Fomento y Desarrollo Productivo',26553.264,'25/06/2022','10/08/2022'),
							(3,'Proyectos en Cambio Climático',1292.194,'01/02/2021','10/12/2023');
							

insert into proyecto_municipio values (1,5),
									  (3,5),
									  (1,2),
									  (2,1),
									  (1,4),
									  (2,9),
									  (1,10),
									  (3,6),
									  (1,3),
									  (2,7);
-- 1. RELACIÓN MUCHOS A MUCHOS ENTRE USUARIOS Y GRUPO

-- Consulta básica
SELECT usuarios.nombre, usuarios.apellido, grupo.nombre as nombre_grupo
FROM usuarios
JOIN usuario_grupo ON usuarios.id = usuario_grupo.us_id
JOIN grupo ON grupo.id = usuario_grupo.gr_id;

-- Subconsulta
SELECT nombre, apellido
FROM usuarios
WHERE id IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 1);

-- Función de agregación
SELECT grupo.nombre, COUNT(usuario_grupo.us_id) as total_usuarios
FROM grupo
JOIN usuario_grupo ON grupo.id = usuario_grupo.gr_id
GROUP BY grupo.nombre;

-- Consulta 2: Grupos intensivos
SELECT usuarios.nombre, usuarios.apellido, grupo.nombre as nombre_grupo
FROM usuarios
JOIN usuario_grupo ON usuarios.id = usuario_grupo.us_id
JOIN grupo ON grupo.id = usuario_grupo.gr_id
WHERE grupo.nombre LIKE '%intensivo%';

-- Función de agregación 2: MAX y MIN de usuarios por grupo
SELECT grupo.nombre,
       MAX(usuario_grupo.us_id) as max_usuario_id,
       MIN(usuario_grupo.us_id) as min_usuario_id
FROM grupo
JOIN usuario_grupo ON grupo.id = usuario_grupo.gr_id
GROUP BY grupo.nombre;

-- Consulta 3: Filtro por fecha
SELECT usuarios.nombre, usuarios.apellido, grupo.fecha_creacion
FROM usuarios
JOIN usuario_grupo ON usuarios.id = usuario_grupo.us_id
JOIN grupo ON grupo.id = usuario_grupo.gr_id
WHERE grupo.fecha_creacion BETWEEN '2020-03-08' AND '2022-03-08';

-- 2. RELACIÓN MUCHOS A MUCHOS ENTRE HABITACIONES Y HUÉSPEDES

-- Consulta básica
SELECT habitaciones.habitacion_numero, huespedes.nombres, huespedes.apellidos
FROM habitaciones
JOIN reservas ON habitaciones.habitacion_numero = reservas.habitacion
JOIN huespedes ON huespedes.id = reservas.huesped_id;

-- Subconsulta
SELECT nombres, apellidos
FROM huespedes
WHERE id IN (SELECT huesped_id FROM reservas WHERE habitacion = 2);

-- Función de agregación
SELECT habitaciones.habitacion_numero, COUNT(reservas.huesped_id) as total_huespedes
FROM habitaciones
JOIN reservas ON habitaciones.habitacion_numero = reservas.habitacion
GROUP BY habitaciones.habitacion_numero;

-- Consulta por piso
SELECT habitaciones.habitacion_numero, habitaciones.piso, 
       huespedes.nombres, huespedes.apellidos
FROM habitaciones
JOIN reservas ON habitaciones.habitacion_numero = reservas.habitacion
JOIN huespedes ON huespedes.id = reservas.huesped_id
WHERE habitaciones.piso = 4;

-- Función de agregación con precio
SELECT habitaciones.habitacion_numero, 
       SUM(habitaciones.precio_por_noche) as total_recaudado
FROM habitaciones
JOIN reservas ON habitaciones.habitacion_numero = reservas.habitacion
GROUP BY habitaciones.habitacion_numero;

-- 3. RELACIÓN MUCHOS A MUCHOS ENTRE MUNICIPIO Y PROYECTOS

-- Consulta básica
SELECT municipio.nombre as nombre_municipio, proyecto.proyecto as nombre_proyecto
FROM municipio
JOIN proyecto_municipio ON municipio.id = proyecto_municipio.municipio_id
JOIN proyecto ON proyecto.id = proyecto_municipio.proyecto_id;

-- Subconsulta
SELECT proyecto
FROM proyecto
WHERE id IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 1);

-- Función de agregación
SELECT municipio.nombre, COUNT(proyecto_municipio.proyecto_id) as total_proyectos
FROM municipio
JOIN proyecto_municipio ON municipio.id = proyecto_municipio.municipio_id
GROUP BY municipio.nombre;

-- Consulta GAD
SELECT municipio.nombre as nombre_municipio, proyecto.proyecto as nombre_proyecto
FROM municipio
JOIN proyecto_municipio ON municipio.id = proyecto_municipio.municipio_id
JOIN proyecto ON proyecto.id = proyecto_municipio.proyecto_id
WHERE municipio.nombre LIKE '%GAD%';

-- Consulta con ciudad
SELECT municipio.nombre as nombre_municipio, ciudad.nombre as nombre_ciudad
FROM municipio
JOIN ciudad ON municipio.ciudad_id = ciudad.id;

-- Función de agregación con MAX
SELECT municipio.nombre, 
       MAX(proyecto_municipio.proyecto_id) as max_proyecto_id
FROM municipio
JOIN proyecto_municipio ON municipio.id = proyecto_municipio.municipio_id
GROUP BY municipio.nombre;