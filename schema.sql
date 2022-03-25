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

/* Create a table named owners with the following columns */

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(150),
  age INT
);

/* Create a table named species with the following columns */

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);

/* Modify animals table */

ALTER TABLE animals
DROP species;

ALTER TABLE animals
ADD species_id INT,
ADD owner_id INT;

/* Create a table names vets */

CREATE TABLE vets (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(150),
  age INT,
  date_of_graduation DATE
);

/* JOIN TALBE for species and vets */

CREATE TABLE specializations (
  id INT GENERATED ALWAYS AS IDENTITY,
  vet_id INT,
  species_id INT
);

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY,
  animals_id INT,
  vets_id INT,
  date_of_visit DATE
)