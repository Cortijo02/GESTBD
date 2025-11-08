-- ===================================================
-- ELIMINAR TABLAS ANTIGUAS (en orden correcto)
-- ===================================================
DROP TABLE IF EXISTS nota_corte CASCADE;
DROP TABLE IF EXISTS grado_ofertado CASCADE;
DROP TABLE IF EXISTS grado CASCADE;
DROP TABLE IF EXISTS area CASCADE;
DROP TABLE IF EXISTS rama CASCADE;
DROP TABLE IF EXISTS facultad CASCADE;
DROP TABLE IF EXISTS universidad CASCADE;

-- ===================================================
-- TABLA: UNIVERSIDAD
-- ===================================================
CREATE TABLE universidad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL UNIQUE,
    tipo VARCHAR(50)
);

-- ===================================================
-- TABLA: FACULTAD
-- ===================================================
 CREATE TABLE facultad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    id_universidad INTEGER NOT NULL REFERENCES universidad(id) ON DELETE CASCADE,
    direccion VARCHAR(300),
    -- codigo_postal VARCHAR(10),
    telefono VARCHAR(150),
    web VARCHAR(200),
    email VARCHAR(150),
    CONSTRAINT uq_facultad_universidad UNIQUE (nombre, id_universidad)
);

-- ===================================================
-- TABLA: RAMA
-- ===================================================
CREATE TABLE rama (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE
);

-- ===================================================
-- TABLA: ÁREA
-- ===================================================
CREATE TABLE area (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    id_rama INTEGER NOT NULL REFERENCES rama(id) ON DELETE CASCADE,
    CONSTRAINT uq_area_rama UNIQUE (nombre, id_rama)
);

-- ===================================================
-- TABLA: GRADO
-- ===================================================
CREATE TABLE grado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    id_area INTEGER NOT NULL REFERENCES area(id) ON DELETE CASCADE,
    descripcion TEXT,
    salidas TEXT
);

-- ===================================================
-- TABLA: GRADO_OFERTADO
-- ===================================================
CREATE TABLE grado_ofertado (
    id SERIAL PRIMARY KEY,
    id_grado INTEGER NOT NULL REFERENCES grado(id) ON DELETE CASCADE,
    id_facultad INTEGER NOT NULL REFERENCES facultad(id) ON DELETE CASCADE,
    CONSTRAINT uq_grado_facultad UNIQUE (id_grado, id_facultad)
);

-- ===================================================
-- NUEVA TABLA: NOTA_CORTE
-- ===================================================
CREATE TABLE nota_corte (
    id SERIAL PRIMARY KEY,
    id_grado_ofertado INTEGER NOT NULL REFERENCES grado_ofertado(id) ON DELETE CASCADE,
    año INTEGER NOT NULL,
    convocatoria VARCHAR(50) NOT NULL,
    grupo INTEGER,
    nota NUMERIC(4,2),
    CONSTRAINT uq_nota_corte UNIQUE (id, id_grado_ofertado, año, convocatoria, grupo)
);

-- ===================================================
-- ÍNDICES RECOMENDADOS
-- ===================================================
CREATE INDEX idx_facultad_universidad ON facultad(id_universidad);
CREATE INDEX idx_area_rama ON area(id_rama);
CREATE INDEX idx_grado_area ON grado(id_area);
CREATE INDEX idx_grado_ofertado_grado ON grado_ofertado(id_grado);
CREATE INDEX idx_grado_ofertado_facultad ON grado_ofertado(id_facultad);
CREATE INDEX idx_nota_corte_grado_ofertado ON nota_corte(id_grado_ofertado);
