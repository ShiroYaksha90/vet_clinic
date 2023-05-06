/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name from animals WHERE neutered=true;

SELECT * from animals WHERE name <> 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

--- First transaction

BEGIN;

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

--- Second transaction

BEGIN;
UPDATE animals SET species = 'digmon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT species FROM animals;

--- Third transaction

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

--- Fourth transaction


BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT SAVE1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVE1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

--- Queries
SELECT COUNT(*) AS "Number of Animals" FROM animals;
SELECT COUNT(*) AS "Number of Animals with no escape record" FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= 'Jan 1, 1990' AND date_of_birth <= 'Dec 31, 2000' GROUP BY species;

--- Melody Pond's pets

SELECT name 
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

--- Query for Pokemon species
SELECT animals.name, animals.species_id, animals.owner_id, species.name as pet_type FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--- Query for pets and their owners
SELECT name AS pet_name, full_name AS owners FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id;

--- Query for quantity per species
SELECT species.name, COUNT(animals.name)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

---Jennifer's Orwell pets
SELECT animals.name, owners.full_name FROM animals
JOIN species ON species.id = animals.species_id AND species.name = 'Digimon'
JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Jennifer Orwell';

---Dean's pets
SELECT name, full_name as owner_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

--- Most pets owner
SELECT owners.full_name, COUNT(animals.id) AS count FROM animals
JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;