/* first value */

INSERT INTO animals (name, date_of_birth, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', True, 10.23);

/* second value */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon', '2018-11-15', 2, True, 8);

/* Third value */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-07', 1, False, 15.04);

/* Fourth value */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, True, 11);

/* */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, False, -11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Planton', '2021-11-15', 2, True, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle', '1992-04-02', 3, False, -12.3);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon', '2005-06-12', 1, True, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon', '2005-06-07', 7, True, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom', '1998-10-13', 3, True, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Ditto', '2022-05-14', 4, True, 22);

/* Transaction */

/* 1 */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* 2 */

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FRom animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT save_point1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT save_point1;
UPDATE animals SET weight_kg * -1 WHERE weight_kg < 0;
COMMIT;