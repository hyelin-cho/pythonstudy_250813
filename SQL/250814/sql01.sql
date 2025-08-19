USE sakila;

SHOW TABLES;

# 굳이 세로로 안써도 됨. 썜 화면에서 보기 좋도록 세로로 하는 것.
# 상관 서브쿼리
SELECT
	P.customer_id, P.amount, P.payment_date
FROM payment AS P
WHERE P.amount > (
	SELECT AVG(amount)
    FROM payment
    WHERE customer_id = P.customer_id
);

# 중고급 서브쿼리 시작!!
SELECT
	first_name,
    last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
    WHERE amount > (SELECT AVG(amount) FROM payment)
);

SELECT
	first_name,
    last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
    WHERE amount > 3 # 위의 값이 너무 길면 간단하게 상수값을 줄 수 있음
);


SELECT 
	first_name,
    last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) > (
		SELECT
			AVG(payment_count)
        FROM (
			SELECT COUNT(*) AS payment_count
            FROM payment
            GROUP BY customer_id
		) AS payment_counts # FROM절 밑에 서브쿼리를 쓸 때에는 AS를 무조건 지정해야한다.
    )
);


SELECT 
	first_name,
    last_name
FROM customer
WHERE customer_id = ( # IN과 = 는 다르다.
	SELECT customer_id
    FROM (
		SELECT customer_id, COUNT(*) AS payment_count
        FROM payment
        GROUP BY customer_id
    ) AS payment_counts
    ORDER BY payment_count DESC
    LIMIT 1
);

# 상관 서브쿼리 
SELECT 
	P.customer_id,
    P.amount,
    P.payment_date
FROM payment P
WHERE P.amount > ( # aomunt가 뭐 보다 초과하는 것인지 괄호 안에!
	SELECT
		AVG(amount)
    FROM payment 
    WHERE customer_id = P.customer_id # 위에 있는 payment와 같다라는 것을 알려줘야하니 WHERE절을 사용
);

# film 테이블에서 평균 영화길이보다 긴 영화들의 제목을 찾아주세요.
# 내꺼 
SELECT
	title,
    length
FROM film
WHERE length > (
	SELECT
		AVG(length)
    FROM film
);

# 쌤 꺼
SELECT title FROM film
WHERE length > (SELECT AVG(length) FROM film);

# rental 테이블에서 고객별 평균 대여 횟수보다 많은 대여를 한 고객들의 이름(first_name, last_name)을 찾아주세요.
SHOW TABLES;
SELECT * FROM customer LIMIT 5;
SELECT * FROM rental LIMIT 5;

SELECT first_name, last_name 
FROM customer # 여기서 찾은 아이디값 
WHERE customer_id IN ( # IN 복수의 값 
	SELECT customer_id
    FROM rental # 여기와 비교 
    GROUP BY customer_id # 그룹 지정하면 카운트라는 집계함수를 사용
    HAVING COUNT(*) > ( # 여기서 평균값을 만들어 계산하는 것 
		SELECT AVG(rental_count)
		FROM (
			SELECT COUNT(*) AS rental_count 
			FROM rental
			GROUP BY customer_id
		) AS rental_counts
    )
);

# 가장 많은 영화를 대여한 고객의 이름(first_name, last_name)을 찾아주세요.
SELECT first_name, last_name FROM customer
WHERE customer_id = (
	SELECT customer_id
    FROM (
		SELECT customer_id, COUNT(*) AS rental_count 
		FROM rental
		GROUP BY customer_id
    ) AS rental_counts
    ORDER BY rental_count DESC
    LIMIT 1
);

# 각 고객에 대해 자신이 대여한 평균 영화 길이보다 긴 영화들의 제목을 찾아주세요.
SELECT * FROM customer LIMIT 3; # customer_id
SELECT * FROM film LIMIT 3; # film_id
SELECT * FROM rental LIMIT 3; # customer_id & inventory_id
SELECT * FROM inventory LIMIT 3; # film_id & inventory_id
# 위 네가지를 엮을 수 있음. 


SELECT C.first_name, C.last_name, F.title 
FROM customer C
JOIN rental R ON R.customer_id = C.customer_id
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN film F ON F.film_id = I.film_id
WHERE F.length > (
	SELECT AVG(FIL.length) # 필름 안에 있는 평균값 
    FROM film FIL # 위에 있는 AS와 다르게 설정해주기
    JOIN inventory INV ON INV.film_id = FIL.film_id
    JOIN rental REN ON REN.inventory_id = INV.inventory_id
    WHERE REN.customer_id = C.customer_id
);







