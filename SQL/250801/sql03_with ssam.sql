CREATE DATABASE IF NOT EXISTS membership_ssam;
USE membership_ssam;

CREATE TABLE IF NOT EXISTS members (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    birth_date DATE, # '0000-00-00'
    signup_time DATETIME DEFAULT CURRENT_TIMESTAMP, # 'YYYY-MM-DD HH:MM:SS'
    points DECIMAL(10, 2), # 뒤에 소수점은 2번째에서 자를 것임.
    gender ENUM('남', '여') NOT NULL
);

DESC members;

INSERT INTO members (name, email, birth_date, points, gender)
VALUES
('마동석', 'dongg@google.com', '1990-01-01', 1000.50, '남'),
('장첸', 'jangg@naver.com', '1992-05-10', 3500.75, '남'),
('정마담', 'jungg@google.com', '1998-11-22', 120.10, '여');

SELECT * FROM members;

SELECT name, points FROM members
WHERE points >= 1000;

SELECT name, email FROM members
WHERE email LIKE '%@google.com';

SELECT name, birth_date FROM members
ORDER BY birth_date DESC; # ASC : 오름차순,  DESC : 내림차순

