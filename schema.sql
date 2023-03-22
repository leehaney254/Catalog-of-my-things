-- Schema for genre table

CREATE TABLE genre (
  id INTEGER,
  name VARCHAR(100)
);

CREATE TABLE  music_album (
  id INTEGER,
  publish_date INTEGER,
  archived BOOLEAN,
  on_spotify BOOLEAN
);