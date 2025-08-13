CREATE DATABASE membership;
USE membership;

CREATE TABLE membership_point (
	id INT NOT NULL AUTO_INCREMENT,
	No VARCHAR(10) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Birth VARCHAR(20) NOT NULL,
    Date VARCHAR(20) NOT NULL,
    Point VARCHAR(30) NOT NULL,
    MF VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO membership_point (No, Name, Email, Birth, Date, Point, MF)
VALUES(1, "조혜린", "hi@google.com", 010814, 250730, 1350, "Female");

INSERT INTO membership_point (No, Name, Email, Birth, Date, Point, MF)
VALUES(2, "김수현", "soo@naver.com", 010515, 250728, 1520, "Female");

INSERT INTO membership_point (No, Name, Email, Birth, Date, Point, MF)
VALUES(3, "오예담", "oh@google.com", 010723, 250801, 330, "male");

DESC membership_point;
SELECT * FROM membership_point;

SELECT * FROM membership_point WHERE Point > 1000;
SELECT * FROM membership_point WHERE Email LIKE "%@google.com%";
