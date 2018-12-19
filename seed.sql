DROP DATABASE IF EXISTS apis1_assignment
CREATE DATABASE apis1_assignment

\c apis1_assignment

DROP TABLE IF EXISTS users
DROP TABLE IF EXISTS posts
DROP TABLE IF EXISTS likes
DROP TABLE IF EXISTS comments
DROP TABLE IF EXISTS albums
DROP TABLE IF EXISTS pictures

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE pictures(
  id SERIAL PRIMARY KEY,
  album_id INT REFERRENCES albums(id) ON DELETE CASCADE,
  url VARCHAR NOT NULL
);
