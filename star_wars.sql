SET client_encoding TO 'UTF8';

-- DROP the characters table
DROP TABLE IF EXISTS characters CASCADE;
DROP TABLE IF EXISTS lightsabers CASCADE;

-- CREATE the characters table
CREATE TABLE characters (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    darkside        BOOLEAN NOT NULL DEFAULT FALSE,
    age             INT NOT NULL
);

CREATE TABLE lightsabers (
    id              SERIAL PRIMARY KEY,
    hilt_metal      TEXT NOT NULL,
    colour          TEXT NOT NULL,
    -- NB need the NOT NULL!
    character_id    INT NOT NULL UNIQUE REFERENCES characters(id)
);

--- ALTER TABLE characters ADD FOREIGN KEY (lightsaber_id) REFERENCES lightsabers (id);

INSERT INTO characters (name, darkside, age)
    VALUES ('Obi-Wan Kenobi', FALSE, 55);
INSERT INTO characters (name, darkside, age)
    VALUES ('Anakin Skywalker', FALSE, 26);
INSERT INTO characters (name, darkside, age)
    VALUES ('Dark Maul', TRUE, 332);
-- INSERT INTO CHARACTERS (name, darkside, age)
--     VALUES (U&'\0441\043B\043E\043D', TRUE, 100);
-- INSERT INTO CHARACTERS (name, darkside, age)
--     VALUES ('слон', FALSE, 101);

SELECT name, age FROM characters ORDER BY age DESC;
SELECT COUNT(*) FROM characters;

UPDATE characters SET darkside = TRUE, name = 'Darth Vader' WHERE id = 2;

INSERT INTO characters (name, age) VALUES ('Luke Skywalker', 17);
UPDATE characters SET age = 65 WHERE name = 'Obi-Wan Kenobi';

SELECT * FROM characters ORDER BY id ASC;
