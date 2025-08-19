-- 문제 3. 다음 문제를 MySQL 에서 SQL을 활용해 데이터를 출력하세요!

-- 배우 성 검색 (LIKE) 목표: 성(last_name)이 ‘%SON’ 으로 끝나는 배우의 actor_id, first_name, last_name 출력, 성 오름차순.
SELECT * FROM actor;
SELECT
	actor_id,
    first_name,
    last_name
FROM actor
WHERE last_name LIKE "%SON"
ORDER BY last_name ASC;


-- 특정 등급 영화 조회 목표: 영화 rating='PG-13' 인 영화의 film_id, title, rating 10개만, title 오름차순.
SELECT * FROM film;
SELECT 
	film_id, 
	title,
    rating
FROM film
WHERE rating = "PG-13"
ORDER BY title ASC
LIMIT 10;



-- 대여 가격 상위 정렬 목표: rental_rate 내림차순 상위 15편의 film_id, title, rental_rate 조회.
SELECT * FROM film;
SELECT 
	film_id, 
	title,
    rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 15;





-- 카테고리별 영화 수(기초 집계) 목표: 카테고리 이름과(없으면 NULL) 영화 수를 구해 개수 내림차순 정렬.
SELECT * FROM film; # film_id
SELECT * FROM category; # category_id
SELECT * FROM film_category; # category_id & film_id

SELECT 
	C.name,
    COUNT(F.film_id) AS film_count
FROM category C
JOIN film_category FC ON FC.category_id = C.category_id
JOIN film F ON F.film_id = FC.film_id
GROUP BY C.name
ORDER BY C.name DESC;
