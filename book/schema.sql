CREATE DATABASE my_catalog

-- books table
CREATE TABLE books (
id UUID PRIMARY KEY,
publisher VARCHAR(100),
cover_state VARCHAR(100),
publish_date DATE,
label_id UUID,
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