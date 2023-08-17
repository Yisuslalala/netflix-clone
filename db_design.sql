DROP DATABASE IF EXISTS netflix_db;

CREATE DATABASE netflix_db;

USE netflix_db;


DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT(NOW()),
    PRIMARY KEY (user_id)
);

INSERT INTO users (username) 
VALUES 
    ("Chines"),
    ("T4tos"),
    ("Aurorita"),
    ("Miguelito");


DROP TABLE IF EXISTS films;

CREATE TABLE films (
    film_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    information VARCHAR(255) NOT NULL,
    cover VARCHAR(255) NOT NULL,
    release_date SMALLINT NOT NULL,
    duration VARCHAR(50) NOT NULL,
    kind_of ENUM("Movie", "Serie"),
    PRIMARY KEY (film_id)
);

INSERT INTO films (title, information, cover, release_date, duration, kind_of)
VALUES
    (
        "Better Call Saul", 
        "Chronicles the life of shyster Jimmy McGill and his transformation into Saul Goodman, the lawyer with lax morals.", 
        "https://i.ytimg.com/vi/lVPUD-YPztc/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgXihVMA8=&rs=AOn4CLDjUnZCCFUunpR-hVmzA3dOeo8Khg", 
        2022,
        "6 Seasons",
        "Serie"
    ),
    (
        "The Pursuit of Happiness",
        "Life is a struggle for Chris Gardner. The duo must live in a shelter and face many hardships.",
        "https://i0.wp.com/universal-stories.com/wp-content/uploads/2021/06/Watch-Pursuit-of-Happiness-2001-Prime-Video.jpg?fit=19201080&ssl=1",
        2006,
        "01:57:00",
        "Movie"
    ),
    (
        "The Karate Kid",
        "12-year-old Dre Parker discovers he is a stranger in a strange land. His fighting skills are not enough against the bully.",
        "https://p4.wallpaperbetter.com/wallpaper/510/314/377/red-background-sport-silhouette-wallpaper-preview.jpg",
        2010,
        "02:20:00",
        "Movie"
    );


DROP TABLE IF EXISTS lists;

CREATE TABLE lists (
    u_id INT NOT NULL,
    f_id INT NOT NULL,
    added_in TIMESTAMP NOT NULL DEFAULT(NOW()),
    FOREIGN KEY(u_id) REFERENCES users(user_id),
    FOREIGN KEY(f_id) REFERENCES films(film_id),
    PRIMARY KEY (u_id, f_id)
);

INSERT INTO lists (u_id, f_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 1),
    (3, 3);


DROP TABLE IF EXISTS reactions;

CREATE TABLE reactions (
    u_id INT NOT NULL,
    f_id INT NOT NULL,
    reaction ENUM("Don't like it", "Like it", "Loving it"),
    FOREIGN KEY(u_id) REFERENCES users(user_id),
    FOREIGN KEY(f_id) REFERENCES films(film_id),
    PRIMARY KEY (u_id, f_id)
);

INSERT INTO reactions (u_id, f_id, reaction)
VALUES 
    (1, 2, "Like it"),
    (1, 1, "Loving it"),
    (2, 2, "Like it"),
    (3, 1, "Like it"),
    (3, 3, "Loving it"),
    (3, 2, "Don't like it"); 
