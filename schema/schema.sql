CREATE TABLE games (
  id BIGINT PRIMARY KEY,
  multiplayer VARCHAR(255) NOT NULL,
  last_played_at DATE NOT NULL,
);

CREATE TABLE authors (
  id BIGINT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  item_id BIGINT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(id)
);