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



-- Parcelle
--------------------

CREATE TABLE parcelle(
	id_parcelle text PRIMARY KEY,
	code_parcelle text,
	id_tup text REFERENCES tup (id_tup)
);

COMMENT ON TABLE parcelle IS 'Parcelles au sens du cadastre';

COMMENT ON COLUMN parcelle.id_parcelle IS 'clef primaire';
COMMENT ON COLUMN parcelle.code_parcelle IS 'Identifiant de parcelle';
COMMENT ON COLUMN parcelle.id_tup IS 'clef étrangère de la table des TUPs';


