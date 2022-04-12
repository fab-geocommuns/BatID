-- psql script to initiate batid data model

-- cleanups

drop schema if exists rnb cascade;


--- create schema 
create schema rnb;

-- add GIS extension
CREATE EXTENSION postgis;


-- set default schema
SET SEARCH_PATH TO rnb,public;
