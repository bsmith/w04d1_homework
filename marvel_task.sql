-- Return ALL the data in the 'movies' table.
SELECT * FROM movies;

-- Return ONLY the name column from the 'people' table
SELECT name FROM people;

-- Oops! Someone spelled Krusty The Clown's name wrong! Change it to reflect the proper spelling (Crusty should be Krusty).
SELECT id FROM people WHERE name = 'Crusty the Clown';
UPDATE people SET name = 'Krusty the Clown' WHERE id = 13;
SELECT * FROM people WHERE id = 13;

-- Return ONLY Homer Simpson's name from the 'people' table.
SELECT name FROM people WHERE name LIKE 'Homer%';

-- The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.
DELETE FROM movies WHERE title = 'Batman Begins' RETURNING *;
SELECT * FROM movies WHERE title ILIKE '%batman%';

-- We forgot one of the main characters! Add Bart Simpson to the 'people' table
INSERT INTO people (name) VALUES ('Bart Simpson');

-- Eric Cartman has decided to hijack our movie evening, Remove him from the table of people.
DELETE FROM people WHERE name = 'Eric Cartman' RETURNING *;
SELECT name FROM people;

-- The cinema has just heard that they will be holding an exclusive midnight showing of 'Avengers: Infinity War'!! Create a new entry in the 'movies' table to reflect this.
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Infinity War', 2018, '00:00');

-- The cinema would like to make the Iron Man movies a triple billing. Find out the show time of "Iron Man 2" and set the show time of "Iron Man 3" to start two hours later.
SELECT show_time FROM movies WHERE title = 'Iron Man 2'; -- 18:45
UPDATE movies SET show_time = '20:45' WHERE title = 'Iron Man 3';

SELECT show_time, title FROM movies ORDER BY show_time ASC;