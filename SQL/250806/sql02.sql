# 여러분들은 모두 나이키 브랜드의 데이터 마케팅 담당자
# 어떤 데이터가 존재 -> 최근 1년간 월별 제품별 평균 매출을 계산해야하는 미션
# 데이터 베이스 => 테이블 => 필드 정의 => 최근 1년 월별 제품별 평균 매출 출력

# 내가 한 거
# id, product, price ... date

# CREATE DATABASE nikedata;
# USE nikedata;

# CREATE TABLE month_sales (
#	id INT PRIMARY KEY,
#	product VARCHAR(100),
#	price 
# );

# INSERT INTO month_sales (id, product, price, date)
# VALUES 
# (1, "런닝화", 35,000, "2025-07-25"),
# (2, "기능성 티셔츠", 29,000, "2025-05-02"),
# (3, "런닝화", 35,000, "2025-07-25"),
# (4, "런닝화", 35,000, "2025-07-25"),

CREATE DATABASE IF NOT EXISTS nike_db_v1;
USE nike_db_v1;

CREATE TABLE sales (
	sales_id INT PRIMARY KEY,
    product_id INT,
    sales_date DATE,
    amount INT
);

DESC sales;

INSERT INTO sales (sales_id, product_id, sales_date, amount)
VALUES
(201, 100, "2025-07-15", 200),
(202, 100, "2025-07-20", 180),
(203, 200, "2025-06-05", 150),
(204, 100, "2025-06-10", 210),
(205, 200, "2025-05-11", 160),
(206, 300, "2025-05-20", 240),
(207, 100, "2025-04-01", 200),
(208, 300, "2025-04-15", 220),
(209, 200, "2025-03-05", 130);

SELECT * FROM sales;

SELECT 
	product_id, 
    DATE_FORMAT(sales_date, '%Y-%M') AS sales_month,
    AVG (amount) AS avg_monthly_sales
FROM sales
WHERE sales_date >= CURDATE() - INTERVAL 1 YEAR
GROUP BY product_id, sales_month
ORDER BY product_id, sales_month;




