-- Base de Datos I - Unidad 4 - Ej17: HistoriaClinicaVeterinaria
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS APLICACION;
DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS VACUNA;
DROP TABLE IF EXISTS VETERINARIO;
DROP TABLE IF EXISTS MASCOTA;
DROP TABLE IF EXISTS TUTOR;

CREATE TABLE TUTOR (
    id_tutor INT PRIMARY KEY,
    dni_tutor INT,
    nombre_tutor VARCHAR(50),
    direccion_tutor VARCHAR(100),
    telefono_tutor VARCHAR(50),
    email_tutor VARCHAR(50) UNIQUE
);

CREATE TABLE MASCOTA (
    id_mascota INT PRIMARY KEY,
    id_tutor INT,
    numero_historia VARCHAR(50),
    nombre_mascota VARCHAR(50),
    especie VARCHAR(50),
    raza VARCHAR(100),
    sexo VARCHAR(100),
    fecha_nacimiento DATE,
    color_pelaje VARCHAR(100),
    FOREIGN KEY (id_tutor) REFERENCES TUTOR(id_tutor)
);

CREATE TABLE VETERINARIO (
    id_veterinario INT PRIMARY KEY,
    matricula_profesional VARCHAR(50) UNIQUE,
    nombre_veterinario VARCHAR(50),
    telefono_veterinario VARCHAR(100),
    especialidad_clinica VARCHAR(50),
    email_veterinario VARCHAR(50) UNIQUE
);

CREATE TABLE VACUNA (
    id_vacuna INT PRIMARY KEY,
    codigo_vacuna VARCHAR(50) UNIQUE,
    nombre_comercial VARCHAR(50),
    laboratorio VARCHAR(50),
    numero_lote VARCHAR(50),
    especie_destino VARCHAR(100),
    fecha_vencimiento DATE
);

CREATE TABLE CONSULTA (
    id_consulta INT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha_hora_atencion DATETIME,
    motivo_consulta VARCHAR(50),
    peso_actual DECIMAL(12,2),
    temperatura_corporal VARCHAR(100),
    diagnostico VARCHAR(100),
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

CREATE TABLE APLICACION (
    id_aplicacion INT PRIMARY KEY,
    id_mascota INT,
    id_vacuna INT,
    id_consulta INT,
    fecha_aplicacion DATE,
    fecha_proximo_refuerzo DATE,
    dosis_aplicada VARCHAR(100),
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    FOREIGN KEY (id_vacuna) REFERENCES VACUNA(id_vacuna),
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta)
);

-- Datos de TUTOR
INSERT INTO TUTOR (id_tutor, dni_tutor, nombre_tutor, telefono_tutor, email_tutor) VALUES (1, 25111222, 'Alicia Ramos', '261-4001001', 'alicia@mail.com');
INSERT INTO TUTOR (id_tutor, dni_tutor, nombre_tutor, telefono_tutor, email_tutor) VALUES (2, 27333444, 'Cecilia Vidal', '261-4003003', 'cecilia@mail.com');
INSERT INTO TUTOR (id_tutor, dni_tutor, nombre_tutor, telefono_tutor, email_tutor) VALUES (3, 28444555, 'Daniel Quiroga', '261-4004004', 'daniel@mail.com');
INSERT INTO TUTOR (id_tutor, dni_tutor, nombre_tutor, telefono_tutor, email_tutor) VALUES (4, 29555666, 'Estela Moyano', '261-4005005', 'estela@mail.com');

-- Datos de MASCOTA
INSERT INTO MASCOTA (id_mascota, id_tutor, numero_historia, nombre_mascota, especie) VALUES (1, 1, 'H-0001', 'Firulais', 'Perro');
INSERT INTO MASCOTA (id_mascota, id_tutor, numero_historia, nombre_mascota, especie) VALUES (2, 1, 'H-0002', 'Michi', 'Gato');
INSERT INTO MASCOTA (id_mascota, id_tutor, numero_historia, nombre_mascota, especie) VALUES (3, 2, 'H-0004', 'Luna', 'Gato');
INSERT INTO MASCOTA (id_mascota, id_tutor, numero_historia, nombre_mascota, especie) VALUES (4, 4, 'H-0005', 'Toby', 'Perro');

-- Datos de VETERINARIO
INSERT INTO VETERINARIO (id_veterinario, matricula_profesional, nombre_veterinario, especialidad_clinica, email_veterinario) VALUES (1, 'MP-1001', 'Dra. Ledesma', 'Clínica general', 'ledesma@vet.com');
INSERT INTO VETERINARIO (id_veterinario, matricula_profesional, nombre_veterinario, especialidad_clinica, email_veterinario) VALUES (2, 'MP-1002', 'Dr. Oviedo', 'Cirugía', 'oviedo@vet.com');
INSERT INTO VETERINARIO (id_veterinario, matricula_profesional, nombre_veterinario, especialidad_clinica, email_veterinario) VALUES (3, 'MP-1004', 'Dr. Quiroz', 'Clínica general', 'quiroz@vet.com');
INSERT INTO VETERINARIO (id_veterinario, matricula_profesional, nombre_veterinario, especialidad_clinica, email_veterinario) VALUES (4, 'MP-1005', 'Dra. Rojas', 'Cardiología', 'rojas@vet.com');

-- Datos de VACUNA
INSERT INTO VACUNA (id_vacuna, codigo_vacuna, nombre_comercial, laboratorio, numero_lote) VALUES (1, 'VAC-01', 'Quíntuple canina', 'Zoetis', 'L-2501');
INSERT INTO VACUNA (id_vacuna, codigo_vacuna, nombre_comercial, laboratorio, numero_lote) VALUES (2, 'VAC-02', 'Triple felina', 'MSD', 'L-2502');
INSERT INTO VACUNA (id_vacuna, codigo_vacuna, nombre_comercial, laboratorio, numero_lote) VALUES (3, 'VAC-03', 'Antirrábica', 'Boehringer', 'L-2503');
INSERT INTO VACUNA (id_vacuna, codigo_vacuna, nombre_comercial, laboratorio, numero_lote) VALUES (4, 'VAC-05', 'Leucemia felina', 'MSD', 'L-2505');

-- Datos de CONSULTA
INSERT INTO CONSULTA (id_consulta, id_mascota, id_veterinario, fecha_hora_atencion, motivo_consulta) VALUES (1, 1, 1, '2026-09-01 10:00', 'Control anual');
INSERT INTO CONSULTA (id_consulta, id_mascota, id_veterinario, fecha_hora_atencion, motivo_consulta) VALUES (2, 2, 2, '2026-09-03 11:30', 'Revisión de sutura');
INSERT INTO CONSULTA (id_consulta, id_mascota, id_veterinario, fecha_hora_atencion, motivo_consulta) VALUES (3, 3, 1, '2026-09-10 16:00', 'Cojera');
INSERT INTO CONSULTA (id_consulta, id_mascota, id_veterinario, fecha_hora_atencion, motivo_consulta) VALUES (4, 1, 3, '2026-09-20 12:00', 'Control post vacuna');

-- Datos de APLICACION
INSERT INTO APLICACION (id_aplicacion, id_mascota, id_vacuna, id_consulta, fecha_aplicacion) VALUES (1, 1, 1, 1, '2026-09-01');
INSERT INTO APLICACION (id_aplicacion, id_mascota, id_vacuna, id_consulta, fecha_aplicacion) VALUES (2, 2, 2, 2, '2026-09-03');
INSERT INTO APLICACION (id_aplicacion, id_mascota, id_vacuna, id_consulta, fecha_aplicacion) VALUES (3, 3, 2, NULL, '2026-09-12');
INSERT INTO APLICACION (id_aplicacion, id_mascota, id_vacuna, id_consulta, fecha_aplicacion) VALUES (4, 1, 3, 4, '2026-09-20');
