COPY universidad (id, nombre, tipo)
FROM '/csv/universidad.csv'
DELIMITER ';' CSV HEADER;

-- COPY facultad (id, nombre, id_universidad, direccion, codigo_postal, telefono, web, email)
COPY facultad (id, nombre, id_universidad, direccion, telefono, web, email)
FROM '/csv/facultad.csv'
DELIMITER ';' CSV HEADER;

COPY rama (id, nombre)
FROM '/csv/ramas.csv'
DELIMITER ';' CSV HEADER;

COPY area (id, nombre, id_rama)
FROM '/csv/areas.csv'
DELIMITER ';' CSV HEADER;

COPY grado (id, nombre, id_area, descripcion, salidas)
FROM '/csv/grados.csv'
DELIMITER ';' CSV HEADER;

COPY grado_ofertado (id, id_grado, id_facultad)
FROM '/csv/grados_ofertados.csv' 
DELIMITER ';' CSV HEADER;

COPY nota_corte (id, id_grado_ofertado, año, convocatoria, grupo, nota)
FROM '/csv/nota_corte.csv' 
DELIMITER ',' CSV HEADER;
