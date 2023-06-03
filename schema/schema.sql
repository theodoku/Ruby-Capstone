CREATE DATABASE catalog;

CREATE TABLE music_albums (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  genre_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  label_id BIGINT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE games (
  id BIGINT PRIMARY KEY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  genre_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  label_id BIGINT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Create the books table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL
  genre_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  label_id BIGINT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE authors (
  id BIGINT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  book_id BIGINT NOT NULL,
  game_id BIGINT NOT NULL,
  music_album_id BIGINT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books(id)
  FOREIGN KEY (game_id) REFERENCES games(id)
  FOREIGN KEY (music_album_id) REFERENCES music_albums(id)
);

CREATE TABLE genres (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255),
  book_id BIGINT NOT NULL,
  game_id BIGINT NOT NULL,
  music_album_id BIGINT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books(id)
  FOREIGN KEY (game_id) REFERENCES games(id)
  FOREIGN KEY (music_album_id) REFERENCES music_albums(id)
);

-- Create the labels table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  book_id BIGINT NOT NULL,
  game_id BIGINT NOT NULL,
  music_album_id BIGINT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books(id)
  FOREIGN KEY (game_id) REFERENCES games(id)
  FOREIGN KEY (music_album_id) REFERENCES music_albums(id)
);