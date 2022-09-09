-- Copyright (C) 2022, BatID.

-- This program is licensed under the Apache License version 2.
-- See LICENSE or go to <https://www.apache.org/licenses/LICENSE-2.0.txt> for full license details.

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
	id_tup serial PRIMARY KEY,
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
	id_parcelle serial PRIMARY KEY,
	code_parcelle text,
	id_tup integer REFERENCES tup (id_tup)
);

COMMENT ON TABLE parcelle IS 'Parcelles au sens du cadastre';

COMMENT ON COLUMN parcelle.id_parcelle IS 'clef primaire';
COMMENT ON COLUMN parcelle.code_parcelle IS 'Identifiant de parcelle';
COMMENT ON COLUMN parcelle.id_tup IS 'clef étrangère de la table des TUPs';



-- Enveloppe batiment
--------------------

--table
CREATE TABLE enveloppe_batiment(
	id_enveloppe serial PRIMARY KEY,
	source text,
	id_source text,
	geomenv geometry(multipolygon, 2154) NOT NULL,
	surface_m2 integer
);

--table documentation
COMMENT ON TABLE enveloppe_batiment IS 'Table des enveloppes de batiment'; --to revise

COMMENT ON COLUMN enveloppe_batiment.id_enveloppe IS 'clef primaire.';
COMMENT ON COLUMN enveloppe_batiment.source IS 'Base source, par exemple, BDTOPObatiment / BDNB / LiDAR etc.';
COMMENT ON COLUMN enveloppe_batiment.geomenv IS 'Géometrie de l enveloppe du batiment.';



-- Batiment
--------------------

-- create some status type
CREATE TYPE statut_batiment AS ENUM (
	'temporaire', 'en_projet', 'annule', 'en_construction', 'construit', 'demoli');  -- To revise

CREATE TYPE fiabilite_batiment AS ENUM (
	'fiable', 'moyennement fiable', 'probleme');  -- To revise

-- table creation
CREATE TABLE batiment(
	id_bat serial PRIMARY KEY,
	description text NULL,
	validation bool NULL,
	fiable fiabilite_batiment,
	id_enveloppe text REFERENCES enveloppe_batiment(id_enveloppe),
	entree_principale text,
	code_iris text,
	code_commune text,
	code_epci text,
	code_dpt text,
	statut statut_batiment,
	localisation geometry(point, 2154),
	DT_DEB date,
	DT_FIN date,
	id_tup text REFERENCES tup (id_tup),
	id_bdnb text,
	geombat geometry(multipolygon, 2154) NULL
);

-- table documentation
COMMENT ON TABLE batiment IS 'Batiment au sens de la définition du référentiel national des batiments.';

COMMENT ON COLUMN batiment.id_bat IS 'clef primaire';
COMMENT ON COLUMN batiment.description IS 'Description du batiment, nom commmun. La tour effeil ?';
COMMENT ON COLUMN batiment.validation IS 'Booléen. 1 si batiment proposé a été validé. 0 sinon.';
COMMENT ON COLUMN batiment.fiable IS 'degré de fiablité du batiment issu du croisement initial';
COMMENT ON COLUMN batiment.id_enveloppe IS 'clef étrangère de la table des enveloppes';
COMMENT ON COLUMN batiment.entree_principale IS 'Entrée principale du batiment. Clef étrangère de la table des entrées.';
COMMENT ON COLUMN batiment.code_iris IS 'Code IRIS INSEE';
COMMENT ON COLUMN batiment.code_commune IS 'Identifiant commune INSEE';
COMMENT ON COLUMN batiment.code_epci IS 'Identifiant EPCI (établissements publics de coopération intercommunale) INSEE';
COMMENT ON COLUMN batiment.code_dpt IS 'Code département';
COMMENT ON COLUMN batiment.statut IS 'Statut du batiment relativement à la liste des champs possible';
COMMENT ON COLUMN batiment.localisation IS 'Localisant du batiment. Par défaut, il s agit du point à l inteieur du batiment, le plus proche du centroide de la géométrie du batiment';
COMMENT ON COLUMN batiment.DT_DEB IS '';
COMMENT ON COLUMN batiment.DT_FIN IS '';
COMMENT ON COLUMN batiment.id_tup IS 'clef étrangère de la table des TUPs';
COMMENT ON COLUMN batiment.id_bdnb IS 'clef étrangère de l id batiment bdnb du CSTB';
COMMENT ON COLUMN batiment.geombat IS 'Géometrie du batiment';



-- Relation Batiment Parcelle
--------------------

CREATE TABLE rel_batiment_parcelle (
id_parcelle text references parcelle (id_parcelle),
id_bat text REFERENCES batiment (id_bat),
PRIMARY key (id_bat, id_parcelle)
);



-- Filiation batiment
--------------------

-- create some status type
CREATE TYPE filiation_type AS ENUM (
	'fusion', 'scisssion', 'correction');  -- To revise

-- table
CREATE TABLE filiation_batiment (
	PRIMARY KEY (id_parent, id_enfant),
	id_parent text REFERENCES batiment (id_bat),
	id_enfant text REFERENCES batiment (id_bat),
	type_filiation filiation_type,
	dt_filiation date
);
-- table documentation
COMMENT ON TABLE filiation_batiment IS 'Table de filiation de la table batiment';

COMMENT ON COLUMN filiation_batiment.id_parent IS 'id du batment parent. clef étrangère de la table des batiments';
COMMENT ON COLUMN filiation_batiment.id_enfant IS 'id du batiment enfant. clef étrangère de la table des batiments';
COMMENT ON COLUMN filiation_batiment.type_filiation IS 'type de filiation des batiments : fusion / scission / correction. Il s agit de de correction s il s agissait d une erreure d initialisation dans la base. Sinon, il s agit de préciser la transformation physique: fusion / scission';
COMMENT ON COLUMN filiation_batiment.dt_filiation IS 'Date de la filiation';



-- Adresse
--------------------

--table
CREATE TABLE addresse(
	id_adresse serial PRIMARY KEY,
	source text,
	ban_id text,
	numero text,
	suffixe text,
	nom_voie text,
	code_post text,
	nom_commune text,
	code_commune_insee text,
	nom_complementaire text
);
--table documentation



-- Entree
--------------------

--table
CREATE TABLE entree(
	id_entree serial PRIMARY KEY,
	id_bat text REFERENCES batiment (id_bat),
	id_adresse text REFERENCES addresse (id_adresse),
	localisation geometry(point, 2154) NOT NULL
);

--table documentation
COMMENT ON TABLE entree IS 'Entrées de batiment.';

COMMENT ON COLUMN entree.id_entree IS 'Clef primaire.';
COMMENT ON COLUMN entree.id_bat IS 'Clef étrangère de la table des batiments.';
COMMENT ON COLUMN entree.id_adresse IS 'Clef étrangère de la table des addresses.';
COMMENT ON COLUMN entree.localisation IS 'Localisant de l entrée.';

-- add constrain on batiment.entree_principale in being a foreign key from entree table
ALTER TABLE batiment ADD CONSTRAINT entree_principale FOREIGN KEY (entree_principale) REFERENCES entree (id_entree) MATCH FULL;



-- Local
--------------------

--table
CREATE TABLE local(
	id_local serial PRIMARY KEY,
	id_bat text REFERENCES batiment (id_bat),
	id_parcelle text REFERENCES parcelle (id_parcelle),
	id_tup text REFERENCES tup (id_tup)
);

--table documentation
COMMENT ON TABLE local IS 'Locaux au sens fichiers fonciers.';

COMMENT ON COLUMN local.id_local IS 'Clef primaire.';
COMMENT ON COLUMN local.id_bat IS 'Clef étrangère de la table des batiments.';
COMMENT ON COLUMN local.id_parcelle IS 'Clef étrangère de la table des parcelles.';
COMMENT ON COLUMN local.id_tup IS 'Clef étrangère de la table des TUPs';



-- ADS: Aurorisations du Droits des Sols
--------------------

-- create some status type
CREATE TYPE ads_type AS ENUM (
	'permis_construire', 'demolition', 'permis_amenager',
	'dact', 'doc');  -- To revise

--table
CREATE TABLE ads(
	id_ads serial PRIMARY KEY,
	type_ads ads_type,
	DT_DEB date,
	id_ads_metier text
);

--table documentation
COMMENT ON TABLE ads IS 'Aurorisations du Droits des Sols';

COMMENT ON COLUMN ads.id_ads IS 'Clef primaire.';
COMMENT ON COLUMN ads.type_ads IS 'type d autorisation du droits des sols';
COMMENT ON COLUMN ads.DT_DEB IS '';
COMMENT ON COLUMN ads.id_ads_metier IS 'id de l ads dans les processus métier';



-- rel_ads_parcelles
--------------------

CREATE TABLE rel_ads_parcelles (
	id_ads text REFERENCES ads (id_ads),
	id_parcelle text references parcelle (id_parcelle),
	PRIMARY key (id_ads, id_parcelle)
);



-- rel_ads_batiments
--------------------

CREATE TABLE rel_ads_batiments (
	id_ads text REFERENCES ads (id_ads),
	id_bat text references batiment (id_bat),
	PRIMARY key (id_ads, id_bat)
);



-- rel_ads_adresse
--------------------

CREATE TABLE rel_ads_adresse (
	id_ads text REFERENCES ads (id_ads),
	id_adresse text references addresse (id_adresse),
	PRIMARY key (id_ads, id_adresse)
);
