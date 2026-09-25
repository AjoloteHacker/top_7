--SUCURSALES
INSERT INTO SUCURSAL (nombre,direccion)
VALUES('Casa Matriz', 'San Pedro 519');

INSERT INTO SUCURSAL (nombre,direccion)
VALUES('Top 9 Puerto Montt', 'Avenida Presidente Ibáñez 123');

INSERT INTO SUCURSAL (nombre, direccion)
VALUES('Top 9 Osorno', 'Patricio Lynch 1437');

--CARGO
INSERT INTO CARGO (nombre_cargo)
VALUES('Cajero');
INSERT INTO CARGO (nombre_cargo)
VALUES('Bodegero');
INSERT INTO CARGO (nombre_cargo)
VALUES('Gerente');

--IDIOMA
INSERT INTO IDIOMA (nombre)
VALUES('Español');
INSERT INTO IDIOMA (nombre)
VALUES('Ingles');
INSERT INTO IDIOMA (nombre)
VALUES('Japonés');

--PROVEEDOR
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Aliquet Libero Integer Corp.','+1992637147','tristique.senectus@yahoo.org',2,56,'Ap #460-1446 Erat, Ave');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Nunc Sed Inc.','+1960144198','augue.eu@outlook.couk',2,56,'Ap #354-6056 Leo. Avenue');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Libero Ltd','+44984615730','tellus@protonmail.ca',3,168,'122-1400 Aenean Road');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Et Magnis Foundation','+1957638974','vivamus.rhoncus@protonmail.couk',2,31,'170-1117 Et, Road');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Libero At Institute','+1953233833','posuere.at@yahoo.org',2,34,'633-2976 Duis St.');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Maecenas Incorporated','+1974619234','vehicula.risus@protonmail.com',2,80,'Ap #661-8000 Pellentesque Av.');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Odio Vel Institute','+56929878851','sed@protonmail.ca',1,2,'Ap #762-6600 Molestie. Avenue');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Tempus Scelerisque Corp.','+56954868166','purus.sapien@yahoo.ca',1,12,'Ap #492-5397 Dictum. Avenue');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Suspendisse Aliquet Sem Incorporated','+1972386134','integer.vitae@outlook.ca',2,93,'188-1674 Urna Rd.');
INSERT INTO PROVEEDOR (nombre_proveedor,telefono,email,id_pais,id_ciudad,direccion)
VALUES ('Mauris LLP','+44953876287','aenean@outlook.ca',3,169,'Ap #312-4925 Odio Rd.');

--EMPLEADOS
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('39.637.701-2','Jared','Delilah','Key','Romero',684547,'vel.arcu@google.org','Ap #730-253 Sapien Rd.',1,1);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('30.547.840-7','Amelia','Christopher','Rosa','Hines',573097,'cum@hotmail.ca','181-9677 Lectus. Street',1,1);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('29.450.450-0','Ryder','Carson','Fowler','Bradshaw',667121,'iaculis@google.net','Ap #356-3545 Lacus St.',1,1);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('2.869.420-K','Haviva','Channing','Boyer','Holman',650074,'habitant.morbi.tristique@hotmail.org','P.O. Box 110, 2530 Malesuada Road',2,1);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('23.352.797-1','Hasad','Phoebe','Gardner','Gross',688736,'tempor.arcu@icloud.edu','4755 Non Ave',3,1);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('45.230.140-7','Jeanette','Macon','Flynn','Buchanan',720958,'cursus.non@protonmail.com','3908 Nunc Ave',1,2);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('4.844.732-5','Kasimir','Moses','Vinson','Hamilton',683207,'risus.a@icloud.com','733-509 Sit Ave',1,2);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('8.864.568-5','Beatrice','Autumn','Gordon','Velazquez',596500,'tortor.nunc@google.net','Ap #437-4590 Magna, Rd.',1,2);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('26.820.192-0','Roth','Wayne','Palmer','Gallegos',611001,'sem.consequat@hotmail.couk','497-3453 Integer Rd.',2,2);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('19.426.981-1','Pandora','Breanna','Hendrix','Dudley',607440,'parturient.montes@icloud.couk','P.O. Box 141, 4444 Diam St.',3,2);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('8.398.860-0','Arthur','Raphael','Mitchell','Tyson',705583,'aliquet.lobortis.nisi@aol.com','Ap #465-1203 Pede. Rd.',1,3);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('13.706.795-1','Holly','Jermaine','Wyatt','Savage',787469,'metus.aliquam.erat@aol.net','124-878 Nonummy Road',1,3);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('3.247.624-4','Jack','Kareem','Sanders','Tucker',721128,'non.egestas@hotmail.net','Ap #546-447 Phasellus Av.',1,3);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('33.938.240-9','Jeremy','Chiquita','Short','Henson',752582,'molestie@icloud.couk','136-1329 Tristique Ave',2,3);
INSERT INTO EMPLEADO (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,sueldo,email,direccion,id_cargo,id_sucursal)
VALUES ('3.729.167-6','Josiah','Erica','Gardner','Delgado',762465,'non.feugiat.nec@protonmail.edu','564-3303 Et Rd.',3,3);

-- CATEGORIA
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Dado','ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Sobre de cartas','Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Funda de cartas','commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non,');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Minifigura','congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Pack de inicio','molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Caja para cartas','bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Conjunto de dados','conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.');
INSERT INTO CATEGORIA (nombre_categoria,descripcion)
VALUES ('Libro de Rol','Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum');

-- EDITORIAL
INSERT INTO EDITORIAL (nombre_editorial,telefono,email)
VALUES ('wizards of the coast','+569 1851 3189','libero.mauris.aliquam@google.edu');
INSERT INTO EDITORIAL (nombre_editorial,telefono,email)
VALUES ('Liminal Games','+569 3154 7235','phasellus.at.augue@outlook.org');
INSERT INTO EDITORIAL (nombre_editorial,telefono,email)
VALUES ('Edge Studio','+569 1371 8140','velit.eget.laoreet@hotmail.couk');
INSERT INTO EDITORIAL (nombre_editorial,telefono,email)
VALUES ('Nosolorol','+569 7212 1881','tristique.pellentesque.tellus@google.edu');

-- MARCA
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Devir','+569 6881 5836','nulla.tincidunt@google.com');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Wizards of the coast','+569 4158 2367','eget.metus@protonmail.ca');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Hasbro','+569 6772 0147','suspendisse.non.leo@icloud.com');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('The Pokemon Company','+569 6865 1052','ipsum@yahoo.couk');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Liminal Games','+569 8438 6601','molestie.sed@aol.couk');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Top Deck','+569 8862 3431','amet.orci.ut@protonmail.couk');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Chessex','+569 2848 5384','cras.dolor.dolor@aol.couk');
INSERT INTO MARCA (nombre_marca,telefono,email)
VALUES ('Lego','+569 0426 5591','ac@hotmail.com');

-- METODO_PAGO
INSERT INTO METODO_PAGO (nombre)
VALUES ('Crédito');
INSERT INTO METODO_PAGO (nombre)
VALUES ('Débito');
INSERT INTO METODO_PAGO (nombre)
VALUES ('Efectivo');
INSERT INTO METODO_PAGO (nombre)
VALUES ('Transferencia');

-- EVENTO
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('reserva_mesa','reserva_mesa',TO_DATE('08-22-26','MM-DD-YY'),TO_DATE('08-23-26','MM-DD-YY'),4,1);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('reserva_sala','reserva_sala',TO_DATE('07-28-26','MM-DD-YY'),TO_DATE('09-22-26','MM-DD-YY'),16,1);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('cierre_festivo','local_cerrado',TO_DATE('02-16-26','MM-DD-YY'),TO_DATE('06-24-26','MM-DD-YY'),0,2);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('torneo_pokemon','torneo',TO_DATE('09-15-26','MM-DD-YY'),TO_DATE('09-16-26','MM-DD-YY'),16,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('torneo_yugioh','torneo',TO_DATE('08-09-26','MM-DD-YY'),TO_DATE('08-24-26','MM-DD-YY'),16,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('torneo_magic','torneo',TO_DATE('08-14-26','MM-DD-YY'),TO_DATE('06-25-27','MM-DD-YY'),16,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('torneo_mitos_leyendas','torneo',TO_DATE('04-28-26','MM-DD-YY'),TO_DATE('03-25-27','MM-DD-YY'),16,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('descuentos_remate','descuento',TO_DATE('04-04-26','MM-DD-YY'),TO_DATE('11-29-26','MM-DD-YY'),0,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('descuentos_pokemon','descuento',TO_DATE('12-05-25','MM-DD-YY'),TO_DATE('02-08-27','MM-DD-YY'),0,3);
INSERT INTO EVENTO (nombre_evento,tipo_evento,fecha_inicio,fecha_final,cupo_maximo,id_sucursal)
VALUES ('descuentos_libros_rol','descuento',TO_DATE('02-03-26','MM-DD-YY'),TO_DATE('10-24-26','MM-DD-YY'),0,3);

-- PRODUCTO
INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('MTG-EOE-BST','Sobre Magic: The Gathering - Edge of Eternities',1,5990,2,1,1,2,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('PKM-SVP-BST','Sobre Pokemon TCG - Escarlata y Purpura',1,4990,2,2,NULL,4,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('PKM-DBX-STD','Caja de mazo Pokemon TCG',1,7990,6,3,NULL,4,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('FND-DSD-STD','Funda Dragon Shield Estandar (100 unid.)',1,8990,3,4,NULL,6,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('PKM-STR-DCK','Pack de inicio Pokemon TCG',1,9990,5,2,NULL,4,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('MTG-STR-DCK','Pack de inicio Magic: The Gathering',1,12990,5,1,1,2,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DAD-CHX-D20','Dado D20 Chessex',1,1990,1,5,NULL,7,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DAD-CHX-SET','Conjunto de dados de rol (7 dados) Chessex',1,6990,7,5,NULL,7,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('LEG-MFG-STD','Minifigura Coleccionable Lego',1,3990,4,6,NULL,8,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DND-MIN-STD','Miniatura Dungeons & Dragons',1,5990,4,7,1,3,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DND-PHB-ESP','Manual del Jugador D&D 5e',1,34990,8,1,1,3,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('AQL-COR-ESP','Libro de Rol - Aquelarre',1,28990,8,8,4,5,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('VTM-COR-ESP','Libro de Rol - Vampiro la Mascarada',1,29990,8,9,3,5,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('CAJ-MAD-STD','Caja de madera para cartas',1,14990,6,6,NULL,1,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('YGO-BST-STD','Sobre Yu-Gi-Oh!',1,4490,2,10,NULL,6,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('YGO-STR-DCK','Pack de inicio Yu-Gi-Oh!',1,8990,5,10,NULL,6,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DAD-CHX-D6S','Set de dados D6 estandar',1,2990,1,5,NULL,7,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('FND-DVR-PRM','Funda premium para cartas',1,7490,3,4,NULL,1,1);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('MTG-MFG-COL','Minifigura coleccionable Magic: The Gathering',1,6490,4,1,1,2,2);

INSERT INTO PRODUCTO (sku_producto,nombre_producto,min_jugadores,precio,id_categoria,id_proveedor,id_editorial,id_marca,id_idioma)
VALUES ('DND-MMS-ING','Manual de Monstruos D&D 5e (Ingles)',1,32990,8,7,1,3,2);

-- STOCK
INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,1,40);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,1,7);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,1,1);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,2,47);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,2,17);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,2,15);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,3,14);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,3,8);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,3,47);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,4,6);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,4,43);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,4,47);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,5,34);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,5,5);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,5,37);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,6,27);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,6,2);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,6,1);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,7,5);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,7,13);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,7,14);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,8,32);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,8,38);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,8,1);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,9,35);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,9,12);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,9,45);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,10,41);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,10,44);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,10,34);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,11,26);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,11,14);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,11,28);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,12,37);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,12,17);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,12,0);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,13,48);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,13,10);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,13,44);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,14,27);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,14,21);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,14,17);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,15,9);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,15,13);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,15,48);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,16,21);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,16,6);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,16,5);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,17,24);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,17,6);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,17,22);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,18,22);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,18,38);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,18,16);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,19,2);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,19,46);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,19,29);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (1,20,34);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (2,20,7);

INSERT INTO STOCK (id_sucursal,id_producto,cantidad_producto)
VALUES (3,20,24);

-- VENTA
INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('02-18-26','MM-DD-YY'),59910,'BOL-1001',19,14,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('10-07-26','MM-DD-YY'),107940,'BOL-1002',46,2,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('11-08-26','MM-DD-YY'),40470,'BOL-1003',50,5,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('04-28-26','MM-DD-YY'),34990,'BOL-1004',7,7,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('08-21-26','MM-DD-YY'),13480,'BOL-1005',24,3,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('06-07-26','MM-DD-YY'),6990,'BOL-1006',43,5,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('10-21-26','MM-DD-YY'),34990,'BOL-1007',11,9,2);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-15-26','MM-DD-YY'),30960,'BOL-1008',25,5,2);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('11-11-26','MM-DD-YY'),45970,'BOL-1009',50,13,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('04-27-26','MM-DD-YY'),81910,'BOL-1010',3,13,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('07-09-26','MM-DD-YY'),48420,'BOL-1011',5,4,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('04-21-26','MM-DD-YY'),71950,'BOL-1012',32,7,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-09-26','MM-DD-YY'),55960,'BOL-1013',9,4,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('12-19-26','MM-DD-YY'),28460,'BOL-1014',28,15,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('06-08-26','MM-DD-YY'),7490,'BOL-1015',9,9,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('02-25-26','MM-DD-YY'),6990,'BOL-1016',4,14,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-21-26','MM-DD-YY'),75950,'BOL-1017',11,13,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('10-03-26','MM-DD-YY'),88380,'BOL-1018',25,7,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('09-09-26','MM-DD-YY'),53400,'BOL-1019',36,14,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('11-24-26','MM-DD-YY'),34990,'BOL-1020',8,11,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('11-11-26','MM-DD-YY'),12980,'BOL-1021',8,5,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-15-26','MM-DD-YY'),7980,'BOL-1022',1,12,3);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('09-25-26','MM-DD-YY'),32990,'BOL-1023',12,9,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('11-10-26','MM-DD-YY'),98960,'BOL-1024',41,9,2);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-12-26','MM-DD-YY'),32990,'BOL-1025',49,3,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('10-11-26','MM-DD-YY'),159910,'BOL-1026',32,1,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('06-27-26','MM-DD-YY'),108930,'BOL-1027',20,4,1);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('04-19-26','MM-DD-YY'),98440,'BOL-1028',6,2,4);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('02-25-26','MM-DD-YY'),23970,'BOL-1029',35,13,2);

INSERT INTO VENTA (fecha_venta,total,nro_boleta,id_cliente,id_empleado,id_metodo_pago)
VALUES (TO_DATE('03-22-26','MM-DD-YY'),10970,'BOL-1030',31,9,2);

-- DETALLE_VENTA
INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,2990,1,17);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,14990,1,14);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,1990,1,7);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,5990,2,10);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,29990,2,13);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,4490,3,15);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,2990,3,17);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,3,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,34990,4,11);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6490,5,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6990,5,8);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6990,6,8);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,34990,7,11);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,3990,8,9);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,8990,8,16);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,6490,9,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,9,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,14990,10,14);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,1990,10,7);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,8990,10,4);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,7490,10,18);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,4490,11,15);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,4990,11,2);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,8990,11,4);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6490,11,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,1990,12,7);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,32990,12,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,14990,13,14);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,12990,13,6);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,7990,14,3);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,4490,14,15);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,7490,15,18);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6990,16,8);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,8990,17,16);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,17,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,1990,17,7);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,29990,17,13);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,3990,18,9);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,4490,18,15);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,5990,18,10);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,14990,18,14);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,9990,19,5);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,1990,19,7);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,5990,19,10);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,6490,19,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,34990,20,11);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,6490,21,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,4990,22,2);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,2990,22,17);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,23,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,29990,24,13);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,8990,24,4);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,25,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,6490,26,19);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,32990,26,20);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,2990,26,17);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,34990,26,11);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,6990,27,8);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,3990,27,9);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,29990,27,13);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,4490,28,15);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,34990,28,11);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,7990,28,3);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (3,7990,29,3);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (1,2990,30,17);

INSERT INTO DETALLE_VENTA (cantidad,precio_unitario,id_venta,id_producto)
VALUES (2,3990,30,9);

-- INSCRIPCION
INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('06-10-26','MM-DD-YY'),'S',5,4);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('12-10-26','MM-DD-YY'),'S',29,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('05-22-26','MM-DD-YY'),'S',43,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('02-04-26','MM-DD-YY'),'S',9,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('10-07-26','MM-DD-YY'),'N',18,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('09-16-26','MM-DD-YY'),'N',14,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('11-14-26','MM-DD-YY'),'N',4,2);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('06-25-26','MM-DD-YY'),'S',3,1);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('03-24-26','MM-DD-YY'),'N',41,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('09-01-26','MM-DD-YY'),'S',36,7);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('09-02-26','MM-DD-YY'),'N',5,3);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('03-14-26','MM-DD-YY'),'S',38,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('06-26-26','MM-DD-YY'),'S',3,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('11-08-26','MM-DD-YY'),'S',23,4);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('07-20-26','MM-DD-YY'),'S',23,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('03-14-26','MM-DD-YY'),'S',16,3);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('07-26-26','MM-DD-YY'),'S',12,6);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('12-04-26','MM-DD-YY'),'N',18,3);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('04-07-26','MM-DD-YY'),'N',3,8);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('04-08-26','MM-DD-YY'),'S',23,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('07-11-26','MM-DD-YY'),'N',43,4);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('06-21-26','MM-DD-YY'),'N',5,5);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('06-01-26','MM-DD-YY'),'S',44,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('10-09-26','MM-DD-YY'),'S',17,3);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('07-12-26','MM-DD-YY'),'N',7,10);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('09-04-26','MM-DD-YY'),'N',28,10);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('05-02-26','MM-DD-YY'),'N',37,4);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('09-22-26','MM-DD-YY'),'S',1,9);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('02-22-26','MM-DD-YY'),'N',24,7);

INSERT INTO INSCRIPCION (fecha_inscripcion,asistio,id_cliente,id_evento)
VALUES (TO_DATE('11-28-26','MM-DD-YY'),'S',40,6);

-- REVIEW
INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Aprendi mucho participando en este evento.',47,NULL,9);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Recomendado para principiantes.',43,13,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('El acabado del dado es de buena calidad.',36,14,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy recomendable, volvere a inscribirme.',44,NULL,3);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Excelente calidad, llego bien empacado.',37,18,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Buena relacion precio calidad.',20,14,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Genial para conocer gente con los mismos gustos.',39,NULL,8);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Genial para conocer gente con los mismos gustos.',29,NULL,9);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Recomendado para principiantes.',48,3,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Los premios estuvieron muy buenos.',33,NULL,10);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Aprendi mucho participando en este evento.',6,NULL,4);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy buena organizacion del torneo.',15,NULL,3);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Buena relacion precio calidad.',3,16,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Buena relacion precio calidad.',50,14,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Genial para conocer gente con los mismos gustos.',13,NULL,7);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy buen producto, cumple lo esperado.',26,1,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Perfecto para regalar a un fanatico del juego.',50,6,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy buen producto, cumple lo esperado.',30,8,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Perfecto para regalar a un fanatico del juego.',30,15,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy recomendable, volvere a inscribirme.',36,NULL,8);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('El descuento aplicado fue tal como se prometio.',47,NULL,7);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Genial para conocer gente con los mismos gustos.',29,NULL,8);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('El descuento aplicado fue tal como se prometio.',17,NULL,5);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Genial para conocer gente con los mismos gustos.',32,NULL,5);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Aprendi mucho participando en este evento.',5,NULL,4);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy buen producto, cumple lo esperado.',22,18,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('El precio esta un poco alto pero vale la pena.',9,13,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('El acabado del dado es de buena calidad.',46,14,NULL);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy buena organizacion del torneo.',22,NULL,7);

INSERT INTO REVIEW (descripcion,id_cliente,id_producto,id_evento)
VALUES ('Muy recomendable, volvere a inscribirme.',14,NULL,7);
