/* Populate database with sample data. */
--- animals data
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '02/03/20', 0,true,10.23);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '11/15/18', 2,true,8);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '01/7/21', 1,false,15.04);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Davimon', '05/12/17', 5,true,11);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Chamandar', '02/08/20', 0, false, -11);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '11/15/21', 2, true, -5.7);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '04/02/93', 3, false, -12.13);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '06/12/05', 1, true, -45);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '06/07/05', 7, true, 20.4);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '10/13/98', 3, true, 17);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '05/14/22', 4, true, 22);

--- owners data

insert into owners (full_name, age) values ('Sam Smith', 34);

insert into owners (full_name, age) values ('Jennifer Orwell', 19);

insert into owners (full_name, age) values ('Bob', 45);

insert into owners (full_name, age) values ('Melody Pond', 77);

insert into owners (full_name, age) values ('Dean Winchester', 14);

insert into owners (full_name, age) values ('Jodie Whittaker', 38);

--- species data

insert into species (name)  values ('Pokemon');

insert into species (name)  values ('Digimon');

--- update data

UPDATE animals SET species_id =
CASE WHEN name LIKE '%mon' then (SELECT id FROM species WHERE name = 'Digimon')
ELSE (SELECT id FROM species WHERE name = 'Pokemon') END;

UPDATE animals SET owner_id = CASE
    WHEN name = 'Agumon' then (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name = 'Gabumon' OR name = 'Pikachu' then (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name = 'Devimon' OR name = 'Plantmon' then (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom' then (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name = 'Boarmon' OR name = 'Angemon' then (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;

--- vets data
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08'); 

---spesialization data
INSERT INTO specializations (vet_id, species_id) VALUES
((select id from vets where name like 'William Tatcher'),
(select id from species where name = 'Pokemon')),
((select id from vets where name like 'Stephanie Mendez'),
(select id from species where name = 'Digimon')),
((select id from vets where name like 'Stephanie Mendez'),
(select id from species where name = 'Pokemon')),
((select id from vets where name like 'Jack Harkness'),
(select id from species where name = 'Digimon'));

--- visits data
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES
  ((select id from animals where name like 'Agumon'),
    (select id from vets where name like 'William Tatcher'),
    '2020-05-24'),
  ((select id from animals where name like 'Agumon'),
    (select id from vets where name like 'Stephanie Mendez'),
    '2020-07-22'),
  ((select id from animals where name like 'Gabumon'),
    (select id from vets where name like 'Jack Harkness'),
    '2021-02-02'),
  ((select id from animals where name like 'Pikachu'),
    (select id from vets where name like 'Maisy  Smith'),
    '2020-01-05'),
  ((select id from animals where name like 'Pikachu'),
    (select id from vets where name like 'Maisy Smith'),
    '2020-03-08'),
  ((select id from animals where name like 'Pikachu'),
    (select id from vets where name like 'Maisy Smith'),
    '2020-05-14'),
  ((select id from animals where name like 'Davimon'),
    (select id from vets where name like 'Stephanie Mendez'),
    '2021-05-04'),
  ((select id from animals where name like 'Chamandar'),
    (select id from vets where name like 'Jack Harkness'),
    '2021-02-24'),
  ((select id from animals where name like 'Plantmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2019-12-21'),
  ((select id from animals where name like 'Plantmon'),
    (select id from vets where name like 'William Tatcher'),
    '2020-08-10'),
  ((select id from animals where name like 'Plantmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2021-04-07'),
  ((select id from animals where name like 'Squirtle'),
    (select id from vets where name like 'Stephanie Mendez'),
    '2019-09-29'),
  ((select id from animals where name like 'Angemon'),
    (select id from vets where name like 'Jack Harkness'),
    '2020-10-03'),
  ((select id from animals where name like 'Angemon'),
    (select id from vets where name like 'Jack Harkness'),
    '2020-11-04'),
  ((select id from animals where name like 'Boarmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2019-01-24'),
  ((select id from animals where name like 'Boarmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2019-05-15'),
  ((select id from animals where name like 'Boarmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2020-02-27'),
  ((select id from animals where name like 'Boarmon'),
    (select id from vets where name like 'Maisy Smith'),
    '2020-08-03'),
  ((select id from animals where name like 'Blossom'),
    (select id from vets where name like 'Stephanie Mendez'),
    '2020-05-24'),
  ((select id from animals where name like 'Blossom'),
    (select id from vets where name like 'William Tatcher'),
    '2021-01-11');