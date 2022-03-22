/* Database schema to keep the structure of entire database. */

/* Create database */

CREATE DATABASE vet_clinic;

/* Connect to database */

\c vet_clinic

/* create table */

CREATE TABLE animals (
  id INT,
  name VARCHAR(150),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg FLOAT
);

/* ADD column species */

ALTER TABLE animals
ADD COLUMN species VARCHAR(40);

/* */

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(150),
  age INT
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);

ALTER TABLE animals
DROP species;

ALTER TABLE animals
ADD species_id INT,
ADD owner_id INT;