DROP DATABASE IF EXISTS netflix_db;

CREATE DATABASE netflix_db;

USE netflix_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone CHAR(10) UNIQUE,
    PRIMARY KEY (user_id)
);

INSERT INTO users (username, first_name, last_name, email, phonenumber) 
VALUES 
    ("Chines", "Jesús", "Quiñones", "yisuslalala@gmail.com", 8312473595),
    ("T4tos", "Josefa", "Marquez", "josefa_marquez@gmail.com", 3333102921),
    ("Aurorita", "Aurora", "Ødegaard", "aurora_singer@vevo.com", 1000000001),
    ("Miguelito", "Miguel", "Fernandez", "miguelitotq@tq.com", 1038498492);

DROP IF EXISTS movies;

CREATE TABLE movies (
    movie_id INT NOT NULL,
    liked_id INT NOT NULL,
    
);
