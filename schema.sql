CREATE TABLE IF NOT EXISTS 'games' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'name' TEXT NOT NULL,
    'publish_date' DATE NOT NULL,
    'archived' BOOLEAN NOT NULL DEFAULT 0,
    'multiplayer' BOOLEAN NOT NULL DEFAULT 0
    'author' INTEGER NOT NULL REFERENCES 'author' ('id'),
    'genre' INTEGER NOT NULL REFERENCES 'genre' ('id'),
    'source' INTEGER NOT NULL REFERENCES 'source' ('id'),
    'label' INTEGER NOT NULL REFERENCES 'label' ('id')
);

CREATE TABLE iF NOT EXISTS 'authors' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'first_name' TEXT NOT NULL,
    'last_name' TEXT NOT NULL,
    'items' ARRAY NOT NULL DEFAULT []
)
