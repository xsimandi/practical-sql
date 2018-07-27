/* create the myzoo database */ 

CREATE DATABASE myzoo;

/* psql myzoo
or
psql
and
/c myzoo */

CREATE USER simijagu WITH PASSWORD 'passwd';
ALTER USER simijagu WITH superuser;


/* table to track animals*/

CREATE TABLE animals (
    id bigserial,
    animal_name_en varchar(50),
    animal_name_lat varchar(100),
    acquisition_date date   
);

/*table to track the specifics of each animals*/

CREATE TABLE animal_details (
    animal_name_en varchar(50),
    department varchar(50),
    family varchar(25),
    size_cat varchar (15),
    size_kg numeric
);

/* inserts*/

INSERT INTO animals (animal_name_en, animal_name_lat, acquisition_date)
VALUES ('Dingo', 'Canis lupus dingo', '2016-05-30'),
       ('Lesser mole-rat', 'Spalax leucodon', '2017-05-22'),
       ('Common moorhen', 'Gallinula chloropus', '2015-08-01'),
       ('Bare-faced ibis', 'Phimosus infuscatus', '2018-07-15'),
       ('Wildcat', 'Felis silvestris', '2017-01-30'),
       ('Walrus', 'Odobenus rosmarus', '2016-12-22');
       

INSERT INTO animal_details(animal_name_en, department, family, size_cat, size_kg)
VALUES ('Dingo', 'Australia', 'Canidae', 'medium', 25),
       ('Lesser mole-rat', 'Southern Europe', 'Spalacidae', 'small', 2),
       ('Common moorhen', 'Eurasia', 'Rallidae', 'small', 3),
       ('Bare-faced ibis', 'South America', 'Threskiornithidae', 'small', 5),
       ('Wildcat', 'Europe', 'Felidae', 'small-medium', 7),
       ('Walrus', 'North Atlantic', 'Odobenidae', 'huge', 2000);
       
/* incorrect */
INSERT INTO animal_details(animal_name_en, department, family, size_cat, size_kg)
VALUES ('Hawaiian monk seal', 'Pacific', 'Phocidae', 'medium');

/* gives error: 
ERROR:  INSERT has more target columns than expressions
LINE 1: ...tails(animal_name_en, department, family, size_cat, size_kg)
                                                               ^
SQL state: 42601
Character: 74
*/
/* correct query */
INSERT INTO animal_details(animal_name_en, department, family, size_cat, size_kg)
VALUES ('Hawaiian monk seal', 'Pacific', 'Phocidae', 'medium', 1000);