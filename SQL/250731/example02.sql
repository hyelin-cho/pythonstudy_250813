-- CREATE DATABASE Dave;
-- USE Dave;

-- CREATE TABLE mytable (
-- 	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
-- 	Name VARCHAR(20) NOT NULL,
--     modlenumber VARCHAR(15) NOT NULL,
--     series VARCHAR(30) NOT NULL,
--     PRIMARY KEY(id)
-- );


-- DESC mytable;

-- ALTER TABLE mytable MODIFY COLUMN 
-- name VARCHAR(20) NOT NULL;

-- ALTER TABLE mytable CHANGE COLUMN 
-- modlenumber modle_num VARCHAR(10) NOT NULL;

-- ALTER TABLE mytable CHANGE COLUMN 
-- series model_type VARCHAR(10) NOT NULL;

-- ALTER TABLE mytable MODIFY COLUMN 
-- model_type VARCHAR(10) NOT NULL; # 실수로 인해 다시 했음. 이거 안하고 바로 넘어가도 됨.


# CREATE DATABASE IF NOT EXISTS Dave;
# USE Dave;

-- DROP TABLE IF EXISTS mytable;

-- CREATE TABLE model_info (
-- 	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
-- 	Name VARCHAR(20) NOT NULL,
--     model_num VARCHAR(10) NOT NULL,
--     model_type VARCHAR(10) NOT NULL,
--     PRIMARY KEY(id)
-- );

DESC model_info;
