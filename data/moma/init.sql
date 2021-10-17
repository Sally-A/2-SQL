CREATE DATABASE week4;
\c week4

CREATE TABLE moma_artists (
    id SERIAL PRIMARY KEY,
    constituent_id INTEGER UNIQUE NOT NULL,
    display_name TEXT NOT NULL,
    artist_bio TEXT,
    nationality TEXT,
    gender TEXT,
    begin_date SMALLINT NOT NULL,
    end_date SMALLINT NOT NULL,
    wiki_qid TEXT,
    ulan INT
);

\copy moma_artists (constituent_id, display_name, artist_bio, nationality, gender, begin_date, end_date, wiki_qid, ulan) from '/data/moma/Artists.csv' WITH CSV HEADER QUOTE '"'


CREATE TABLE moma_artworks (
    id SERIAL PRIMARY KEY,
    title TEXT,
    artist TEXT,
    constituent_id TEXT, -- sometimes is multiple e.g. "1234, 3394"
    artist_bio TEXT,
    nationality TEXT,
    begin_date TEXT,
    end_date TEXT,
    gender TEXT,
    date TEXT,
    medium TEXT,
    dimensions TEXT,
    creditline TEXT,
    accessionnumber TEXT,
    classification TEXT,
    department TEXT,
    date_acquired DATE,
    cataloged TEXT,
    object_id INT,
    url TEXT,
    thumbnail_url TEXT,
    circumference NUMERIC,
    depth NUMERIC,
    diameter NUMERIC,
    height NUMERIC,
    length NUMERIC,
    weight NUMERIC,
    width NUMERIC,
    seat_height NUMERIC,
    duration NUMERIC
);

\copy moma_artworks (title, artist, constituent_id, artist_bio, nationality, begin_date, end_date, gender, date, medium, dimensions, creditline, accessionnumber, classification, department, date_acquired, cataloged, object_id, url, thumbnail_url, circumference, depth, diameter, height, length, weight, width, seat_height, duration) from '/data/moma/Artworks.csv' WITH CSV HEADER QUOTE '"'
