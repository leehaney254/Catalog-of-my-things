CREATE TABLE genre (
  id INTEGER,
  name VARCHAR(100)
);

CREATE TABLE  music_album (
  id INTEGER,
  publish_date INTEGER,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  author INTEGER NOT NULL REFERENCES author (id),
  genre INTEGER NOT NULL REFERENCES genre (id),
  source INTEGER NOT NULL REFERENCES source (id),
  label INTEGER NOT NULL REFERENCES label (id)
);

CREATE TABLE  games (
  id INTEGER PRIMARY KEY AUTOINCREMENT ID,
  name TEXT NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  multiplayer BOOLEAN NOT NULL ,
  author INTEGER NOT NULL REFERENCES author (id),
  genre INTEGER NOT NULL REFERENCES genre (id),
  source INTEGER NOT NULL REFERENCES source (id),
  label INTEGER NOT NULL REFERENCES label (id)
);

CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    items ARRAY NOT NULL
)

-- books table
CREATE TABLE books (
  id UUID PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE,
  label_id UUID,
  author INTEGER NOT NULL REFERENCES author (id),
  genre INTEGER NOT NULL REFERENCES genre (id),
  source INTEGER NOT NULL REFERENCES source (id),
  label INTEGER NOT NULL REFERENCES label (id)
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES labels(id)
);

-- labels table
CREATE TABLE labels (
  id UUID PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

-- Index
CREATE INDEX idx_books_labels ON books(label_id);