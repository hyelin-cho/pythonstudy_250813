CREATE DATABASE IF NOT EXISTS interpark;
USE interpark;

CREATE TABLE IF NOT EXISTS performences (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    date_range VARCHAR(100),
    place VARCHAR(100)
);

DESC performences;
SELECT * FROM performences;