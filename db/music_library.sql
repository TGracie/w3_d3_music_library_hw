DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  artist_id INT8 REFERENCES artists(id),
  album_name VARCHAR(255),
  genre VARCHAR(255)
);
