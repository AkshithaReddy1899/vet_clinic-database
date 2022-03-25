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
VALUES('Plantmon', '2021-11-15', 2, True, -5.7);

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

/* */

INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34);

INSERT INTO owners(full_name, age)
VALUES('Jennifer Orwell', 19);

INSERT INTO owners(full_name, age)
VALUES('Bob', 45);

INSERT INTO owners(full_name, age)
VALUES('Melody', 77);

INSERT INTO owners(full_name, age)
VALUES('Dean Winchester', 14);

INSERT INTO owners(full_name, age)
VALUES('Jodie Whittaker', 38);



INSERT INTO species (name)
VALUES('Pokemon');

INSERT INTO species(name)
VALUES('Digimon');

UPDATE animals SET species_id = SELECT id FROM species WHERE name = 'Digimon' AND animals.name LIKE '%mon%' OR name = 'Pokemon' AND animals.name NOT LIKE '%mon%';

UPDATE animals SET owner_id = owners.id FROM owners WHERE name = 'Agumon' AND owners.full_name = 'Sam Smith';

UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';

UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';

UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';

UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';

/* Add data to vets */

INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Maisy Smith', 26, '2019-01-19');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Jack Harkness', 38, '2008-06-08');

/**/

INSERT INTO specializations (vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name ='Pokemon'));

INSERT INTO specializations (vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name ='Pokemon'));

INSERT INTO specializations (vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name ='Digimon'));

INSERT INTO specializations (vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name ='Digimon'));

/* */

INSERT INTO visits(animals_id, vet_id, date_of_visit)
VALUES((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24')

VALUES((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-06-22')

VALUES((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02')

VALUES((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05')

VALUES((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08')

VALUES((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14')

VALUES((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-14')

VALUES((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24')

VALUES((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21')

VALUES((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10')

VALUES((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07')

VALUES((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29')

VALUES((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03')

VALUES((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04')

VALUES((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24')

VALUES((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-04-15')

VALUES((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27')

VALUES((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id 
FROM vets WHERE name = 'Maisy Smith'), '2020-08-03')

VALUES((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24')

VALUES((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');