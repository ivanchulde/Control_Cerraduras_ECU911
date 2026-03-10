INSERT INTO areas (nombre) VALUES
('Ingreso'),
('Tecnologia'),
('Operaciones'),
('Administrativos'),
('Admin');

INSERT INTO puertas (nombre, ubicacion) VALUES
('Ingreso_Principal','Ingreso Principal al ECU 911'),
('Salida_Principal','Salida Principal al ECU 911'),
('Ingreso_Administrativo','Puerta del 2do Piso Administrativo'),
('Ingreso_Operaciones','Puerta de Ingreso a Sala de Operaciones'),
('Tecnologia','Puerta de Ingreso a Oficina de Tecnologia');

INSERT INTO usuarios (
cedula,
nombres,
apellidos,
cargo,
tarjeta_rfid,
area_id,
activo
) VALUES (
'1600454878',
'Luis Ivan',
'Chulde Bonilla',
'Director Zonal de Tecnologia y Soporte',
12583029,
2,
true
);

INSERT INTO permisos_area_puerta (area_id, puerta_id) VALUES
(1,1),
(1,2),
(2,1),
(2,2),
(2,5),
(3,1),
(3,2),
(3,4),
(4,1),
(4,2),
(4,3),
(5,1),
(5,2),
(5,3),
(5,4),
(5,5);

INSERT INTO usuarios (
cedula,
nombres,
apellidos,
cargo,
tarjeta,
area_id,
estado
) VALUES (
'1600454878',
'Luis Ivan',
'Chulde Bonilla',
'Director Zonal de Tecnologia y Soporte',
12583029,
1,
true
);

--SELECT * FROM areas;
--SELECT * FROM puertas;
--SELECT * FROM permisos_area_puerta;
--SELECT * FROM usuarios;
--SELECT * FROM accesos;

