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