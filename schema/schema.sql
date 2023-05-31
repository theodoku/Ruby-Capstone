CREATE DATABASE catalog;

CREATE TABLE genres (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE items (
  id BIGINT PRIMARY KEY,
  genre_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  label_id BIGINT NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE music_albums (
  id BIGINT PRIMARY KEY,
  item_id BIGINT NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(id)
);
