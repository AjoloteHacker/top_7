SET DEFINE OFF;
-- Desactiva las variables de sustitucion (&) para que "Dungeons & Dragons" y "D&D" se inserten como texto.

-- Poblado de datos de ejemplo - Tienda de juegos de mesa (Chile, 3 sucursales)
-- Ejecutar DESPUES de creacion_tablas_top_7.sql (tablas vacias).
-- Los IDs son GENERATED ALWAYS, por lo que se asignan en orden de insercion (1, 2, 3...).
-- Los FKs de este script asumen ese orden: no cambiar el orden de los INSERTs.

-- PAIS
INSERT INTO PAIS (nombre) VALUES ('Chile');

-- REGION
INSERT INTO REGION (nombre, PAIS_id) VALUES ('Región Metropolitana de Santiago', 1);
INSERT INTO REGION (nombre, PAIS_id) VALUES ('Región de Valparaíso', 1);
INSERT INTO REGION (nombre, PAIS_id) VALUES ('Región del Biobío', 1);

-- CIUDAD
INSERT INTO CIUDAD (nombre, REGION_id) VALUES ('Santiago', 1);
INSERT INTO CIUDAD (nombre, REGION_id) VALUES ('Viña del Mar', 2);
INSERT INTO CIUDAD (nombre, REGION_id) VALUES ('Concepción', 3);

-- LOCALIDAD
INSERT INTO LOCALIDAD (nombre, REGION_id) VALUES ('Providencia', 1);
INSERT INTO LOCALIDAD (nombre, REGION_id) VALUES ('Ñuñoa', 1);
INSERT INTO LOCALIDAD (nombre, REGION_id) VALUES ('Viña del Mar Centro', 2);
INSERT INTO LOCALIDAD (nombre, REGION_id) VALUES ('Concepción Centro', 3);

-- CALLE
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('Av. Providencia 1234', 1, 1);
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('Av. Irarrázaval 2450', 1, 2);
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('Av. San Martín 520', 2, 3);
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('Calle Valparaíso 310', 2, 3);
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('Barros Arana 780', 3, 4);
INSERT INTO CALLE (nombre, CIUDAD_id, LOCALIDAD_id) VALUES ('O''Higgins 645', 3, 4);

-- SUCURSAL
INSERT INTO SUCURSAL (nombre, numero_contacto, email_contacto, hora_apertura, hora_cierre, CALLE_id) VALUES ('Mesa Épica Providencia', '+56 2 2345 6701', 'providencia@mesaepica.cl', TIMESTAMP '2000-01-01 10:30:00', TIMESTAMP '2000-01-01 20:30:00', 1);
INSERT INTO SUCURSAL (nombre, numero_contacto, email_contacto, hora_apertura, hora_cierre, CALLE_id) VALUES ('Mesa Épica Viña del Mar', '+56 32 276 5502', 'vina@mesaepica.cl', TIMESTAMP '2000-01-01 11:00:00', TIMESTAMP '2000-01-01 21:00:00', 3);
INSERT INTO SUCURSAL (nombre, numero_contacto, email_contacto, hora_apertura, hora_cierre, CALLE_id) VALUES ('Mesa Épica Concepción', '+56 41 291 8803', 'concepcion@mesaepica.cl', TIMESTAMP '2000-01-01 10:00:00', TIMESTAMP '2000-01-01 20:00:00', 5);

-- CARGO
INSERT INTO CARGO (nombre, descripción) VALUES ('Gerente de Sucursal', 'Responsable de la operación, el equipo y los resultados de la sucursal.');
INSERT INTO CARGO (nombre, descripción) VALUES ('Vendedor', 'Atiende a clientes, recomienda juegos y gestiona ventas en sala.');
INSERT INTO CARGO (nombre, descripción) VALUES ('Cajero', 'Procesa pagos, emite boletas y realiza el cierre de caja diario.');
INSERT INTO CARGO (nombre, descripción) VALUES ('Encargado de Bodega', 'Recibe mercadería, controla inventario y repone el stock de sala.');
INSERT INTO CARGO (nombre, descripción) VALUES ('Anfitrión de Eventos', 'Organiza y modera torneos, talleres y noches de juegos.');
INSERT INTO CARGO (nombre, descripción) VALUES ('Administrador', 'Gestiona proveedores, compras y la administración general.');

-- EMPLEADO
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Matías', NULL, 'González', 'Rojas', 1, 1);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Camila', 'Andrea', 'Muñoz', 'Soto', 2, 1);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Felipe', NULL, 'Contreras', 'Díaz', 3, 1);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Valentina', NULL, 'Silva', 'Pérez', 5, 1);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Sebastián', 'Ignacio', 'Morales', 'Vega', 1, 2);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Javiera', NULL, 'Fuentes', 'Castro', 2, 2);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Nicolás', NULL, 'Araya', 'Núñez', 4, 2);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Francisca', 'Belén', 'Tapia', 'Reyes', 5, 2);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Diego', 'Alejandro', 'Sepúlveda', 'Parra', 1, 3);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Constanza', NULL, 'Herrera', 'Molina', 2, 3);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Tomás', NULL, 'Vargas', 'Ortiz', 3, 3);
INSERT INTO EMPLEADO (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, CARGO_id, SUCURSAL_id) VALUES ('Antonia', NULL, 'Cárdenas', 'Lagos', 4, 3);

-- CONTRATO
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2022-03-01 09:00:00', NULL, 1);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2023-01-16 09:00:00', NULL, 2);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2023-06-01 09:00:00', TIMESTAMP '2026-12-31 00:00:00', 3);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2024-02-01 09:00:00', NULL, 4);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2022-09-01 09:00:00', NULL, 5);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2023-03-15 09:00:00', NULL, 6);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2024-05-01 09:00:00', TIMESTAMP '2026-11-30 00:00:00', 7);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2025-01-02 09:00:00', NULL, 8);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2022-11-01 09:00:00', NULL, 9);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2024-08-01 09:00:00', TIMESTAMP '2027-02-28 00:00:00', 10);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2025-03-03 09:00:00', TIMESTAMP '2027-03-31 00:00:00', 11);
INSERT INTO CONTRATO (inicio_contrato, fin_contrato, EMPLEADO_id) VALUES (TIMESTAMP '2026-02-02 09:00:00', TIMESTAMP '2026-08-01 00:00:00', 12);

-- ANEXO_CONTRATO
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (1);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (1);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (2);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (4);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (5);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (8);
INSERT INTO ANEXO_CONTRATO (CONTRATO_id) VALUES (9);

-- CATEGORIA_EVENTO
INSERT INTO CATEGORIA_EVENTO (nombre, descripción) VALUES ('Torneo', 'Competencias oficiales con premios');
INSERT INTO CATEGORIA_EVENTO (nombre, descripción) VALUES ('Taller', 'Actividades de aprendizaje guiado');
INSERT INTO CATEGORIA_EVENTO (nombre, descripción) VALUES ('Noche de Juegos', 'Encuentros libres para jugar en comunidad');
INSERT INTO CATEGORIA_EVENTO (nombre, descripción) VALUES ('Lanzamiento', 'Presentación de novedades y expansiones');

-- TIPO_EVENTO
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Torneo Magic Draft de Viernes', TIMESTAMP '2026-09-18 19:00:00', TIMESTAMP '2026-09-18 23:00:00', 16, 'Draft de 8 rondas con sobres incluidos.', 1);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Torneo Mitos y Leyendas Formato Libre', TIMESTAMP '2026-09-26 15:00:00', TIMESTAMP '2026-09-26 20:00:00', 24, 'Torneo clasificatorio de Mitos y Leyendas.', 1);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Noche de Juegos de Mesa', TIMESTAMP '2026-10-02 19:00:00', TIMESTAMP '2026-10-02 23:00:00', 30, 'Noche abierta con biblioteca de juegos y anfitrión.', 3);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Taller Introductorio de D&D', TIMESTAMP '2026-10-10 11:00:00', TIMESTAMP '2026-10-10 14:00:00', 8, 'Primera aventura guiada para nuevos jugadores de rol.', 2);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Maratón de Catan', TIMESTAMP '2026-10-24 15:00:00', TIMESTAMP '2026-10-24 21:00:00', 12, 'Torneo por mesas con puntaje acumulado.', 1);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Lanzamiento Nueva Expansión', TIMESTAMP '2026-10-30 18:00:00', TIMESTAMP '2026-10-30 21:00:00', 40, 'Presentación de novedades de la temporada y preventa.', 4);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Taller Aprende a Jugar', TIMESTAMP '2026-11-07 11:00:00', TIMESTAMP '2026-11-07 14:00:00', 15, 'Explicación y partidas guiadas de juegos para principiantes.', 2);
INSERT INTO TIPO_EVENTO (nombre, inicio_evento, final_evento, cupo_maximo, descripcion, CATEGORIA_EVENTO_id) VALUES ('Tarde Familiar de Juegos', TIMESTAMP '2026-11-14 15:00:00', TIMESTAMP '2026-11-14 19:00:00', 20, 'Juegos para toda la familia con premios para niños.', 3);

-- EVENTO
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Magic Draft Providencia', 'Draft semanal en sede Providencia.', 1, 1);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Clasificatorio MyL Concepción', 'Clasificatorio regional de Mitos y Leyendas.', 2, 3);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Noche de Juegos Providencia', 'Noche de juegos abierta a la comunidad.', 3, 1);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Primera Aventura D&D Viña', 'Taller de rol para principiantes en Viña del Mar.', 4, 2);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Maratón Catan Concepción', 'Maratón de Catan por mesas.', 5, 3);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Presentación de Novedades Santiago', 'Lanzamiento de la temporada de verano.', 6, 1);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Aprende a Jugar Viña', 'Taller de juegos para principiantes.', 7, 2);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Tarde Familiar Concepción', 'Tarde de juegos familiares.', 8, 3);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Noche de Juegos Viña', 'Noche de juegos abierta a la comunidad.', 3, 2);
INSERT INTO EVENTO (nombre, descripcion, TIPO_EVENTO_id, SUCURSAL_id) VALUES ('Noche de Juegos Concepción', 'Noche de juegos abierta a la comunidad.', 3, 3);

-- INSCRIPCION
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-16 17:00:00', 'N', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-08 15:45:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-08 12:00:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-16 10:45:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-07 19:30:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-13 14:45:00', 'N', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-09 20:30:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-09 13:45:00', 'S', 1);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-15 09:30:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-19 15:45:00', 'N', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-19 21:45:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-17 15:45:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-13 18:15:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-12 20:00:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-19 11:45:00', 'N', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-12 19:45:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-14 13:45:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-21 21:45:00', 'S', 2);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-25 12:30:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-01 11:45:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-24 12:30:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-24 21:45:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-23 13:30:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-19 16:30:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-29 20:45:00', 'N', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-21 16:30:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-20 11:45:00', 'N', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-30 16:00:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-28 10:00:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-27 11:00:00', 'S', 3);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-30 20:15:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-02 18:30:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-29 11:30:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-03 17:15:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-08 10:00:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-29 21:00:00', 'S', 4);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-16 19:30:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-16 10:45:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-16 11:15:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-17 16:15:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-13 17:45:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-23 19:15:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-23 09:45:00', 'N', 5);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-16 16:00:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-27 12:15:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-27 15:30:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-23 15:00:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-23 11:30:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-27 16:45:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-17 13:45:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-27 17:45:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-22 17:30:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-16 12:15:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-29 16:30:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-23 21:15:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-29 11:30:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-21 12:00:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-20 17:15:00', 'N', 6);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-28 18:30:00', 'N', 7);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-27 11:00:00', 'N', 7);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-25 10:45:00', 'N', 7);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-04 19:00:00', 'N', 7);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-10-25 20:15:00', 'N', 7);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-03 17:30:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-09 13:30:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-11 13:00:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-13 21:30:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-07 09:00:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-10 13:00:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-12 18:30:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-08 18:00:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-11-07 18:15:00', 'N', 8);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-22 15:00:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-18 19:30:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-18 09:45:00', 'N', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-27 13:00:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-25 18:00:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-26 17:00:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-30 18:00:00', 'S', 9);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-29 14:30:00', 'S', 10);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-22 14:45:00', 'S', 10);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-28 19:15:00', 'S', 10);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-29 09:45:00', 'N', 10);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-19 12:00:00', 'S', 10);
INSERT INTO INSCRIPCION (fecha_inscripcion, asistio, EVENTO_id) VALUES (TIMESTAMP '2026-09-23 15:30:00', 'N', 10);

-- CATEGORIA_PRODUCTO
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Juegos Estratégicos', 'Juegos de mesa de estrategia y gestión de recursos');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Juegos Familiares', 'Juegos para todas las edades');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Juegos de Cartas', 'Juegos con mazos de cartas');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Cartas Coleccionables', 'TCG: mazos, sobres y accesorios de juego organizado');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Juegos de Rol', 'Manuales, sets de inicio y material de rol');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Rompecabezas', 'Puzzles de distintas piezas y dificultades');
INSERT INTO CATEGORIA_PRODUCTO (nombre, descripcion) VALUES ('Accesorios', 'Fundas, dados, tapetes y otros complementos');

-- EDITORIAL
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Devir Chile', '+56 2 2890 1101', 'contacto@devir.cl');
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Asmodee Chile', '+56 2 2890 1102', 'ventas@asmodee.cl');
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Ediciones MyL', '+56 2 2890 1103', 'contacto@edicionesmyl.cl');
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Wizards of the Coast Latam', '+56 2 2890 1104', 'latam@wizards.cl');
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Ravensburger Chile', '+56 2 2890 1105', 'info@ravensburger.cl');
INSERT INTO EDITORIAL (nombre, telefono, email) VALUES ('Hasbro Chile', '+56 2 2890 1106', 'clientes@hasbro.cl');

-- MARCA
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Catan Studio', '+56 2 2890 1201', 'info@catanstudio.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Days of Wonder', '+56 2 2890 1202', 'info@daysofwonder.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Ravensburger', '+56 2 2890 1203', 'info@ravensburger.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Hasbro', '+56 2 2890 1204', 'clientes@hasbro.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Wizards of the Coast', '+56 2 2890 1205', 'info@wizards.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Z-Man Games', '+56 2 2890 1206', 'info@zman.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Libellud', '+56 2 2890 1207', 'info@libellud.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Repos Production', '+56 2 2890 1208', 'info@repos.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Mitos y Leyendas', '+56 2 2890 1209', 'info@mitosyleyendas.cl');
INSERT INTO MARCA (nombre, telefono, email) VALUES ('Exploding Kittens', '+56 2 2890 1210', 'info@explodingk.cl');

-- IDIOMA
INSERT INTO IDIOMA (nombre) VALUES ('Español');
INSERT INTO IDIOMA (nombre) VALUES ('Inglés');
INSERT INTO IDIOMA (nombre) VALUES ('Portugués');
INSERT INTO IDIOMA (nombre) VALUES ('Francés');
INSERT INTO IDIOMA (nombre) VALUES ('Alemán');

-- PROVEEDOR
INSERT INTO PROVEEDOR (nombre, telefono, email) VALUES ('Distribuidora Lúdica SpA', '+56 2 2777 3001', 'ventas@ludica.cl');
INSERT INTO PROVEEDOR (nombre, telefono, email) VALUES ('Importadora Mesa Chile', '+56 2 2777 3002', 'pedidos@importmesa.cl');
INSERT INTO PROVEEDOR (nombre, telefono, email) VALUES ('Cartas y Más Distribuidora', '+56 2 2777 3003', 'contacto@cartasymas.cl');
INSERT INTO PROVEEDOR (nombre, telefono, email) VALUES ('Juegos del Sur Ltda', '+56 41 255 3004', 'ventas@juegosdelsur.cl');

-- PRODUCTO
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-EST-001', 'Catan', 54900, 3, 4, 'Clásico de colonización y comercio de recursos.', 1, 1, 1, 1, 1);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-FAM-002', 'Ticket to Ride Europa', 49900, 2, 5, 'Conecta ciudades europeas construyendo rutas de tren.', 2, 2, 1, 2, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-FAM-003', 'Carcassonne', 27900, 2, 5, 'Colocación de losetas para construir un paisaje medieval.', 1, 6, 1, 2, 1);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-EST-004', 'Pandemic', 44900, 2, 4, 'Juego cooperativo para detener cuatro enfermedades.', 2, 6, 1, 1, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-FAM-005', 'Dixit', 36900, 3, 6, 'Juego de imaginación con cartas ilustradas.', 2, 7, 1, 2, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-EST-006', '7 Wonders', 39900, 3, 7, 'Desarrollo de civilizaciones en tres eras.', 2, 8, 1, 1, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('TCG-MTG-007', 'Mazo Commander Magic: The Gathering', 24900, 2, 4, 'Mazo preconstruido de 100 cartas.', 4, 5, 1, 4, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('TCG-MTG-008', 'Sobre Draft Booster Magic (Inglés)', 5900, 2, 2, 'Sobre de 15 cartas para draft.', 4, 5, 2, 4, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('ROL-DND-009', 'Starter Kit Dungeons & Dragons', 29900, 3, 6, 'Kit de inicio con aventura, dados y hojas de personaje.', 4, 5, 1, 5, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('ROL-DND-010', 'Manual del Jugador D&D', 39900, NULL, NULL, 'Reglas básicas para crear personajes y jugar.', 4, 5, 1, 5, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('PUZ-RAV-011', 'Rompecabezas Paisaje 1000 piezas', 19900, 1, 4, 'Puzzle de 1000 piezas con paisaje sureño.', 5, 3, 1, 6, 4);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('PUZ-RAV-012', 'Rompecabezas Ciudad 2000 piezas', 29900, 1, 4, 'Puzzle de gran formato de 2000 piezas.', 5, 3, 1, 6, 4);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-FAM-013', 'Monopoly Clásico', 29900, 2, 6, 'Compra, vende e intercambia propiedades.', 6, 4, 1, 2, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('CAR-UNO-014', 'UNO', 7900, 2, 10, 'Clásico de cartas de colores y números.', 6, 4, 1, 3, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('JM-FAM-015', 'Jenga', 14900, 2, 8, 'Torre de bloques de madera de equilibrio.', 6, 4, 1, 2, 2);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('ACC-FUN-016', 'Fundas Protectoras 100 un.', 4900, NULL, NULL, 'Fundas estándar para proteger cartas.', 3, 9, 1, 7, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('ACC-DAD-017', 'Set de Dados Poliédricos 7 piezas', 6900, NULL, NULL, 'Set completo de dados para juegos de rol.', 4, 5, 1, 7, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('ACC-TAP-018', 'Tapete de Juego Neopreno', 14900, NULL, NULL, 'Tapete antideslizante para cartas.', 3, 9, 1, 7, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('TCG-MYL-019', 'Mazo Inicial Mitos y Leyendas', 9900, 2, 2, 'Mazo de inicio del TCG chileno Mitos y Leyendas.', 3, 9, 1, 4, 3);
INSERT INTO PRODUCTO (sku, nombre_producto, precio, min_jugadores, max_jugadores, descripción, EDITORIAL_id, MARCA_id, IDIOMA_id, CATEGORIA_PRODUCTO_id, PROVEEDOR_id) VALUES ('CAR-EXP-020', 'Exploding Kittens', 19900, 2, 5, 'Juego de cartas de riesgo con gatos explosivos.', 1, 10, 1, 3, 1);

-- STOCK (3 sucursales x 20 productos; algunos bajo el minimo para pruebas)
INSERT INTO STOCK (stock_disponible, stock_minimo, SUCURSAL_id, PRODUCTO_id)
SELECT MOD(s.id * 17 + p.id * 13, 40) + 2, 5, s.id, p.id
FROM SUCURSAL s CROSS JOIN PRODUCTO p
ORDER BY s.id, p.id;

-- CLIENTE
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Ignacio', NULL, 'Salazar', 'Mora', '14326285-5', 'isalazar81@mail.cl', '+56979839211');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('María', 'José', 'Bravo', 'Cortés', '13500668-8', 'mbravo23@mail.cl', '+56977110001');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Cristóbal', NULL, 'Espinoza', 'Leiva', '12637682-0', 'cespinoza84@mail.cl', '+56998124754');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Daniela', NULL, 'Gutiérrez', 'Paz', '20624272-8', 'dgutierrez34@mail.cl', '+56962864863');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Joaquín', 'Andrés', 'Navarro', 'Ruiz', '20731684-9', NULL, '+56990635781');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Paula', NULL, 'Campos', 'Figueroa', '17326731-2', 'pcampos8@mail.cl', '+56984148755');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Rodrigo', NULL, 'Mendoza', 'Aguilera', '12191416-6', 'rmendoza81@mail.cl', NULL);
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Fernanda', 'Paz', 'Ibáñez', 'Toro', '16073617-8', 'fibanez61@mail.cl', '+56943912239');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Gabriel', NULL, 'Escobar', 'Pino', '15721835-2', 'gescobar87@mail.cl', '+56974132927');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Catalina', NULL, 'Valdés', 'Olivares', '14530789-9', NULL, '+56990009036');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Benjamín', 'Esteban', 'Pizarro', 'Godoy', '18695356-8', 'bpizarro91@mail.cl', '+56964154571');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Isidora', NULL, 'Jara', 'Bustos', '15900916-5', 'ijara72@mail.cl', '+56995636756');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Vicente', NULL, 'Carrasco', 'Zúñiga', '16626517-7', 'vcarrasco44@mail.cl', '+56997795028');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Macarena', 'Sofía', 'Henríquez', 'Ávila', '15371874-1', 'mhenriquez48@mail.cl', NULL);
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Martín', NULL, 'Orellana', 'Fierro', '18024847-1', NULL, '+56970820935');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Sofía', NULL, 'Quezada', 'Rivas', '19676586-7', 'squezada71@mail.cl', '+56994454649');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Agustín', 'Pablo', 'Lara', 'Cabrera', '19953451-3', 'alara87@mail.cl', '+56978962044');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Trinidad', NULL, 'Maldonado', 'Vera', '17237740-8', 'tmaldonado25@mail.cl', '+56950622945');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Pablo', NULL, 'Riquelme', 'Saavedra', '18887688-9', 'priquelme20@mail.cl', '+56972538182');
INSERT INTO CLIENTE (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, rut, email, telefono) VALUES ('Florencia', NULL, 'Barrera', 'Yáñez', '12089117-0', NULL, '+56963785547');

-- METODO_PAGO
INSERT INTO METODO_PAGO (nombre) VALUES ('Efectivo');
INSERT INTO METODO_PAGO (nombre) VALUES ('Tarjeta de Débito');
INSERT INTO METODO_PAGO (nombre) VALUES ('Tarjeta de Crédito');
INSERT INTO METODO_PAGO (nombre) VALUES ('Transferencia Bancaria');
INSERT INTO METODO_PAGO (nombre) VALUES ('Webpay');

-- TIPO_REVIEW
INSERT INTO TIPO_REVIEW (nombre, descripción) VALUES ('Producto', 'Opinión sobre un juego o accesorio');
INSERT INTO TIPO_REVIEW (nombre, descripción) VALUES ('Sucursal', 'Opinión sobre la tienda física');
INSERT INTO TIPO_REVIEW (nombre, descripción) VALUES ('Evento', 'Opinión sobre un torneo o taller');
INSERT INTO TIPO_REVIEW (nombre, descripción) VALUES ('Atención al cliente', 'Opinión sobre el trato recibido');

-- REVIEW
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Excelente Catan', 'Llegó en perfecto estado y la edición en español es muy buena. Ideal para jugar en familia.', 1, 1);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Gran atención', 'El vendedor me recomendó un juego perfecto para mi grupo. Muy amable y paciente.', 4, 2);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Torneo muy bien organizado', 'Las rondas partieron a la hora y el anfitrión resolvió todas las dudas de reglas.', 3, 3);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Local acogedor', 'Buen espacio para jugar, mesas cómodas y un catálogo amplio. Volveré pronto.', 2, 4);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Mazo Commander', 'Buen mazo para empezar, aunque las cartas vienen sin fundas.', 1, 5);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Taller de D&D genial', 'Nunca había jugado rol y el taller me ayudó a entender todo en una tarde.', 3, 6);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES (NULL, 'Demoraron un poco en la caja, pero el trato fue bueno.', 4, 7);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Puzzle desafiante', 'Las piezas son de muy buena calidad y la imagen se ve increíble armada.', 1, 8);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Buena sucursal en Concepción', 'Mucha variedad y precios competitivos. Recomendada para ir con amigos.', 2, 9);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Pandemic cooperativo', 'Perfecto para jugar en pareja o con amigos sin competir. Muy entretenido.', 1, 10);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Noche de juegos', 'Muy buen ambiente, conocí gente nueva y probé juegos que no conocía.', 3, 11);
INSERT INTO REVIEW (titulo, mensaje, TIPO_REVIEW_id, CLIENTE_id) VALUES ('Falta stock de accesorios', 'Fui por fundas y no había. Me ofrecieron encargarlas, pero tardaban una semana.', 2, 12);

-- VENTA
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-03', 167010, 'B-100205', 1, 1, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-05', 37010, 'B-100208', 2, 18, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-06', 44900, 'B-100215', 1, 12, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-06', 80400, 'B-100226', 2, 20, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-11', 59800, 'B-100229', 1, 18, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-11', 39700, 'B-100240', 2, 10, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-13', 79800, 'B-100244', 3, 18, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-14', 69700, 'B-100252', 3, 12, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-18', 152520, 'B-100259', 1, 11, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-19', 118500, 'B-100265', 3, 4, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-21', 87775, 'B-100274', 1, 16, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-23', 14220, 'B-100282', 2, 2, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-07-28', 104310, 'B-100286', 3, 9, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-03', 56520, 'B-100291', 1, 9, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-03', 28310, 'B-100302', 3, 12, 1);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-08', 14900, 'B-100308', 1, 11, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-09', 17910, 'B-100315', 2, 3, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-09', 91500, 'B-100322', 3, 17, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-12', 97610, 'B-100326', 2, 11, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-17', 183600, 'B-100337', 1, 12, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-18', 62310, 'B-100342', 3, 17, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-19', 90020, 'B-100347', 2, 12, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-20', 114025, 'B-100357', 2, 8, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-08-22', 127400, 'B-100365', 3, 13, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-04', 72720, 'B-100369', 1, 9, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-05', 59800, 'B-100380', 2, 6, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-05', 39900, 'B-100386', 3, 20, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-07', 37905, 'B-100392', 2, 18, 1);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-07', 53110, 'B-100398', 1, 2, 1);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-08', 147125, 'B-100404', 2, 7, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-09', 9800, 'B-100415', 1, 18, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-12', 71710, 'B-100418', 3, 16, 1);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-13', 44900, 'B-100424', 3, 20, 2);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-20', 49800, 'B-100432', 2, 1, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-21', 136610, 'B-100441', 2, 9, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-23', 42655, 'B-100448', 1, 12, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-28', 129300, 'B-100452', 3, 17, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-28', 87805, 'B-100459', 3, 15, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-09-30', 33710, 'B-100466', 2, 5, 1);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-02', 91710, 'B-100473', 1, 20, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-02', 145620, 'B-100481', 2, 8, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-03', 97600, 'B-100490', 3, 16, 5);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-03', 126420, 'B-100495', 1, 17, 4);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-10', 42540, 'B-100505', 3, 1, 3);
INSERT INTO VENTA (fecha_venta, total, nro_boleta, SUCURSAL_id, CLIENTE_id, METODO_PAGO_id) VALUES (DATE '2026-10-12', 131255, 'B-100511', 2, 4, 1);

-- N_N_VENTA_PRODUCTO
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (1, 7);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (1, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (1, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (2, 14);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (2, 12);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (3, 4);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (4, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (4, 8);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (4, 20);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (5, 12);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (6, 15);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (6, 19);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (7, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (8, 13);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (8, 11);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (9, 13);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (9, 7);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (9, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (10, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (10, 18);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (11, 15);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (11, 13);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (11, 19);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (12, 14);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (13, 1);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (14, 20);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (14, 14);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (14, 16);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (15, 15);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (16, 18);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (17, 20);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (18, 19);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (18, 18);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (18, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (19, 11);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (19, 12);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (20, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (20, 1);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (21, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (21, 7);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (22, 20);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (22, 3);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (23, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (23, 9);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (23, 17);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (24, 17);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (24, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (24, 20);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (25, 7);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (25, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (25, 18);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (26, 9);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (27, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (28, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (29, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (29, 11);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (30, 9);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (30, 11);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (30, 1);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (31, 16);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (32, 15);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (32, 12);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (33, 4);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (34, 7);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (35, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (35, 12);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (36, 4);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (37, 19);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (37, 2);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (37, 18);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (38, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (38, 2);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (39, 19);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (39, 15);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (40, 3);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (40, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (41, 5);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (41, 10);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (42, 11);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (42, 14);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (42, 2);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (43, 17);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (43, 1);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (44, 8);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (44, 17);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (45, 6);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (45, 17);
INSERT INTO N_N_VENTA_PRODUCTO (VENTA_id, PRODUCTO_id) VALUES (45, 4);

-- PAGO (una linea por producto vendido; descuento en %)
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 24900, 5, 1);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 0, 1);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 0, 1);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 7900, 10, 2);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 29900, 0, 2);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 44900, 0, 3);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 36900, 0, 4);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (4, 5900, 0, 4);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 19900, 0, 4);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 0, 5);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 14900, 0, 6);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 9900, 0, 6);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 0, 7);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 29900, 0, 8);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 0, 8);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 10, 9);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 24900, 0, 9);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 36900, 0, 9);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 36900, 0, 10);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (3, 14900, 0, 10);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 14900, 5, 11);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 10, 11);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 9900, 0, 11);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 7900, 10, 12);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 54900, 5, 13);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 0, 14);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 7900, 0, 14);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 4900, 10, 14);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 14900, 5, 15);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 14900, 0, 16);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 19900, 10, 17);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 9900, 0, 18);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (3, 14900, 0, 18);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 36900, 0, 18);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 5, 19);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 0, 19);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 36900, 0, 20);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 54900, 0, 20);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 0, 21);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 24900, 10, 21);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 0, 22);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 27900, 10, 22);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 10, 23);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 29900, 5, 23);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 6900, 0, 23);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 6900, 0, 24);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 36900, 0, 24);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 0, 24);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 24900, 10, 25);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 36900, 0, 25);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 14900, 10, 25);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 0, 26);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 0, 27);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 5, 28);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 36900, 10, 29);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 19900, 0, 29);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 29900, 5, 30);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 19900, 0, 30);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 54900, 10, 30);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 4900, 0, 31);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 14900, 0, 32);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 5, 32);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 44900, 0, 33);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 24900, 0, 34);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 0, 35);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 29900, 5, 35);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 44900, 5, 36);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 9900, 0, 37);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 49900, 0, 37);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (4, 14900, 0, 37);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 5, 38);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 49900, 0, 38);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 9900, 5, 39);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 14900, 0, 39);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 27900, 0, 40);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 39900, 10, 40);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 36900, 0, 41);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 10, 41);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 19900, 0, 42);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 7900, 0, 42);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 49900, 0, 42);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (4, 6900, 0, 43);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 54900, 10, 43);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (3, 5900, 0, 44);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (4, 6900, 10, 44);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (2, 39900, 0, 45);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 6900, 5, 45);
INSERT INTO PAGO (cantidad, precio_unitario, descuento_aplicado, VENTA_id) VALUES (1, 44900, 0, 45);

COMMIT;
