CREATE TABLE stars(
    star TEXT PRIMARY KEY, --primary key
    temp INT NOT NULL);

CREATE TABLE planets(
    planet_name TEXT PRIMARY KEY,
    orbital_period FLOAT NOT NULL,
    star_name TEXT NOT NULL REFERENCES stars); -- foreign key

CREATE TABLE moons(
    moon TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets); -- foreign key

INSERT into stars (star, temp) VALUES ('Proxima Centauri', 3042);
INSERT into stars (star, temp) VALUES ('Gliese 876', 3192);
INSERT into stars (star, temp) VALUES ('The Sun', 5800);

INSERT into planets (planet_name, orbital_period, star_name) VALUES ('Earth', 1.00, 'The Sun');
INSERT into planets (planet_name, orbital_period, star_name) VALUES ('Mars', 1.882, 'The Sun');
INSERT into planets (planet_name, orbital_period, star_name) VALUES ('Venus', 0.62, 'The Sun');
INSERT into planets (planet_name, orbital_period, star_name) VALUES ('Proxima Centauri b', 0.03, 'Proxima Centauri');
INSERT into planets (planet_name, orbital_period, star_name) VALUES ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT into moons (moon, planet) VALUES ('The Moon', 'Earth');
INSERT into moons (moon, planet) VALUES ('Phobos', 'Mars');
INSERT into moons (moon, planet) VALUES ('Deimos', 'Mars');

SELECT p.planet_name as planet, s.star, COUNT(m.moon) as moon_count
    FROM planets as p
        JOIN stars as s
            ON s.star = p.star_name -- setting foreign key to primary key
        LEFT JOIN moons as m
            ON m.planet = p.planet_name -- setting primary key to foreign key
        GROUP BY planet_name, star
        ORDER BY planet_name;