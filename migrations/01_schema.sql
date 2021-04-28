CREATE DATABASE lightbnb IF NOT EXISTS;
\c lightbnb

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  PASSWORD VARCHAR(255)
);

CREATE TABLE properties(
  id INTEGER PRIMARY KEY,
  owner_id INTEGER,
  title VARCHAR(255),
  description TEXT,
  thumbnail_photo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  cost_per_night INTEGER,
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE reservations(
  id INTEGER PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  proprty_id INTEGER,
  guest_id INTEGER
);

  
CREATE TABLE property_reviews(
  id INTEGER PRIMARY KEY,
  guest_id INTEGER,
  proprty_id INTEGER,
  reservation_id INTEGER,
  rating SMALLINT,
  message TEXT
);
