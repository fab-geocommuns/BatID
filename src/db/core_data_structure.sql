-- psql script to initiate batid data model

-- cleanups

drop schema if exists rnb cascade;


--- create schema 
create schema rnb;

-- add GIS extension
CREATE EXTENSION postgis;


-- set default schema
SET SEARCH_PATH TO rnb,public;


--------------------
--- Tables creation
--------------------



-- TUP: tables des parcelles unifiées
--------------------

--table
CREATE TABLE tup(
	id_tup text PRIMARY KEY,
	code_tup text,
	geomtup geometry(multipolygon, 2154)
);

--table documentation
COMMENT ON TABLE tup IS 'Tables des parcelles unifiées (TUP) issues du modèle CEREMA des Fichiers Fonciers';

COMMENT ON COLUMN tup.id_tup IS 'Clef primaire.';
COMMENT ON COLUMN tup.code_tup IS 'Identifiant de tup';
COMMENT ON COLUMN tup.geomtup IS 'Géometrie de la TUP.';


