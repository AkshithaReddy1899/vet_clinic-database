/* Find all animals whose name ends in "mon". */

SELECT * FROM animals WHERE name LIKE '%mon%';

/* List the name of all animals born between 2016 and 2019. */

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */

SELECT * FROM animals WHERE neutered = True AND escape_attempts < 3;

/* List date of birth of all animals named either "Agumon" or "Pikachu". */

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */

SELECT * FROM animals WHERE neutered = true;

/* Find all animals not named Gabumon. */

SELECT * FROM animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* */

SELECT COUNT(*) FROM animals;

SELECT escape_attempts, COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0 GROUP BY escape_attempts;

SELECT AVG(weight_kg) FROM animals;

SELECT COUNT(escape_attempts), neutered FROM animals GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

/* */

SELECT name, full_name
FROM animals
INNER JOIN owners
ON owner_id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
INNER JOIN species
ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT name, full_name
FROM owners
LEFT JOIN animals
ON owners.id = owner_id;

SELECT species.name, COUNT(animals.name)
FROM animals
INNER JOIN species
ON species_id = species.id
GROUP BY species.name;

SELECT name, full_name
FROM animals
INNER JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species_id = 2;

SELECT name, full_name
FROM animals
INNER JOIN owners
ON owners.id = owner_id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = '0';

SELECT owners.full_name, COUNT(animals.name) AS total
FROM owners
INNER JOIN animals
ON animals.owner_id = owners.id GROUP By full_name
ORDER BY total DESC LIMIT 1;