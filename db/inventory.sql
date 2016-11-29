DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
id SERIAL8 primary key,
name VARCHAR(255)
);

CREATE TABLE albums(
id SERIAL8 primary key,
title VARCHAR(255),
quantity INT2,
artist_id INT8 references artists(id),
genre VARCHAR(255)
);