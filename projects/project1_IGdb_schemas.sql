#Feb 2021:

#We are going to replicate IG's db. 
#Our schemas need the following parts:
#USERS, PHOTOS, COMMENTS, LIKES, HASHTAGS, FOLLOWERS, and FOLLOWEES.

#A further breakdown of each part is as follows:


CREATE DATABASE ig_clone;

USE ig_clone

#USERS - id, username, created_at.
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

#Check table.
DESC users;

#PHOTOS - id, image_url, user_id, created_at, FOREIGN KEY.
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

#Check table.
DESC photos;

#COMMENTS - id, comment, user_id, photo_id, created_id, FOREIGN KEY x 2.
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

#Check table.
DESC comments;

#LIKES - user_id, photo_id, created_id, FOREIGN KEY x 2, PRIMARY KEY. 
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);

#Check table.
DESC likes;

#FOLLOWERS - follower_id, folowee_id, created_at, FOREIGN KEY x 2, PRIMARY KEY. 
CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);
    
#Check table.
DESC follows;

#TAGS - id, tags, created_at.
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tags VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

#Check table.
DESC tags;

#PHOTO_TAGS - photo_id, tag_id, FOREIGN KEY x 2, PRIMARY KEY.
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (photo_id, tag_id)
);

#Check table.
DESC photo_tags;

#We're done building schemas! Finally :) 
