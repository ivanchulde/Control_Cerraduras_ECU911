CREATE TABLE areas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE puertas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100)
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    cargo VARCHAR(100),
    tarjeta BIGINT UNIQUE,
    area_id INT REFERENCES areas(id),
    estado BOOLEAN DEFAULT TRUE
);

CREATE TABLE permisos_area_puerta (
    id SERIAL PRIMARY KEY,
    area_id INT REFERENCES areas(id),
    puerta_id INT REFERENCES puertas(id)
);

CREATE TABLE accesos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    puerta_id INT REFERENCES puertas(id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resultado VARCHAR(20)
);