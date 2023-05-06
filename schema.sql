/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int primary key not null,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null
);

ALTER TABLE animals ADD species varchar(50);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY, 
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);


CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(50),
    PRIMARY KEY(id)
);



ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    vet_id int,
    species_id int,
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets (id),
    date_of_visit date
);

select count(*) from animals 
JOIN visits on animals.id = visits.animal_id
JOIN vets on visits.vet_id = vets.id 
JOIN specializations on vets.id = specializations.vet_id
JOIN species on specialties.species_id = species.id
where animals.species_id != species.id;