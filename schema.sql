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