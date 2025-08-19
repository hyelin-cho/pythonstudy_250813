# rental과 inventory 테이블을 JOIN하고, film 테이블에 있는 replacement_cost가 $20 이상인 고객의 이름을 찾아와라.
# 고객의 이름은 소문자로 출력.
SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM customer;
SELECT * FROM film;

SELECT 
	LOWER(CONCAT(C.first_name, " ", C.last_name)) # 소문자로 보여주면서 first_name이랑 last_name이 붙여서 보여질 수 있게 CONCAT 사용 
FROM rental R # customer와 rental값을 바꿔도 상관 없음 JOIN으로 인해 연결성을 갖고 있는 애들임 
JOIN customer C ON R.customer_id = C.customer_id
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN film F ON F.film_id = I.film_id
WHERE F.replacement_cost >= 20;

# film 테이블에서 rating "PG-13"등급인 영화들에서,
# description의 길이가 rating "PG-13"등급인 영화들의 평균 description길이보다 긴 영화의 제목을 찾아주세요.
SELECT title
FROM film
WHERE rating = "PG-13" AND LENGTH(description) > (
	SELECT AVG(LENGTH(description))
    FROM film
    WHERE rating = "PG-13"
);

# customer와 rental, inventory, film 테이블을 JOIN하여 2005년 8월에 대여된 
# 모든 "R"등급의 영화의 제목과 해당 영화를 대여한 고객의 이메일을 찾아주세요.
#내꺼
SELECT C.email, F.title, R.rental_date, F.rating
FROM customer C
JOIN rental R ON R.customer_id = C.customer_id 
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN film F ON F.film_id = I.film_id
WHERE rental_date >= '2005-08-01' AND rating = "R";

# 쌤 
SELECT 
	F.title, C.email
FROM customer C
-- JOIN rental R ON R.customer_id = C.customer_id # ON이 전통적인 문법 
JOIN rental R USING(customer_id) # USING : 똑같은 문법을 두번 반복하는 것이 아닌 한 번에 작성할 수 있는 문법
JOIN inventory I USING(inventory_id)
JOIN film F USING(film_id)
WHERE 
	YEAR(R.rental_date) = 2025 
    AND MONTH(R.rental_date) = 8
    AND F.rating = "R";
    
# payment 테이블에서 가장 마지막에 결제된 일시에서 30일 이전까지의 모든 결제 내역을 찾고 
# 해당 결제 내역에서 각 고객별 총 결제 금액과 평균 결제 금액을 소수점 둘째 자리에서 반올림하여 출력하세요.
SELECT 
	customer_id, 
    ROUND(SUM(amount), 1) AS customer_sum,
    ROUND(AVG(amount), 1) AS customer_avg
FROM payment
WHERE payment_date >= DATE_SUB(
	(SELECT MAX(payment_date) FROM payment), INTERVAL 30 DAY
)
GROUP BY customer_id;

# actor와 film_actor 테이블을 JOIN하고 "Sci-Fi" 카테고리에 속한 영화에 출연한 배우의 이름을 찾으세요.
# 그리고 해당 배우의 이름은 성과 이름을 연결하여 대문자로 출력하세요.
SELECT * FROM film; # film_id
SELECT * FROM actor; # actor_id
SELECT * FROM category; # category_id
SELECT * FROM film_actor; # film_id & actor_id
SELECT * FROM film_category; # category_id & film_id


SELECT 
	CONCAT(A.first_name, " ", A.last_name) AS actor_fullname
FROM actor A
JOIN film_actor FA USING(actor_id)
JOIN film_category FC USING(film_id)
JOIN category C USING(category_id)
WHERE name = "Sci-Fi";









