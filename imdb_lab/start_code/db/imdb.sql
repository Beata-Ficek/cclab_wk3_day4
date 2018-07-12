DROP TABLE IF EXISTS castings;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE stars (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL4 PRIMARY KEY,
  movie_id INT8 REFERENCES movies(id),
  star_id INT8 REFERENCES stars(id),
  fee INT8
);
