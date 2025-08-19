# 합집합 연산자
SELECT film_id FROM film
UNION 
SELECT film_id FROM inventory;

SELECT film_id FROM film
UNION ALL
SELECT film_id FROM inventory;

# MySQL 8.0.31 이상에서만 사용 가능한 문법/불안정한 문법이다.
SELECT film_id FROM film
INTERSECT
SELECT film_id FROM inventory; 

SELECT DISTINCT F.film_id 
FROM film F
JOIN inventory I USING(film_id);
# 위와 동일하게 같은 결과값이 나오는
SELECT film_id
FROM film
WHERE film_id IN (
	SELECT film_id
    FROM inventory
);

# 차집합 연산자
SELECT film_id FROM film
EXCEPT # 이것도 MySQL 8.0.31 이상에서만 사용 가능한 문법
SELECT film_id FROM inventory;

SELECT F.film_id 
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
WHERE I.film_id IS NULL;
# 위와 동일하게 같은 결과값이 나오는
SELECT F.film_id 
FROM film F
WHERE film_id NOT IN (
	SELECT I.film_id
    FROM inventory I
);
# 위와 동일하게 같은 결과값이 나오는 2
SELECT F.film_id 
FROM film F
WHERE NOT EXISTS (
	SELECT film_id
    FROM inventory I
    WHERE F.film_id = I.film_id
);


# film 테이블과 film_category 테이블에서 각각 중복없이 film_id를 조회하는 SQL문을 작성해주세요.
SELECT film_id FROM film
UNION 
SELECT film_id FROM film_category;

START TRANSACTION;
# 얘를 사용
UPDATE payment SET amount = 10.0; # 임시 공간에서만 저장이 될 것











