CREATE TABLE stars(
    star TEXT PRIMARY KEY,
    temp INT NOT NULL
);

CREATE TABLE moons(
    moon TEXT PRIMARY KEY
);

CREATE TABLE planets(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period FLOAT NOT NULL,
    -- star_name TEXT NOT NULL REFERENCES stars,
    -- moon_name TEXT DEFAULT NULL REFERENCES moons,

    -- UNIQUE(star_name)
);

