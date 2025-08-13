SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM reviews;


# 데이터 분석 마케터
# 자사 매출 증대를 목표 -> 마케팅
# 회원들의 등급을 파악하고 해당 등급에 따른 차별화된 CRM 마케팅을 해야겠다는 생각
# 회원 등급별 인원수 -> 가장 많은 등급에 속해있는 사용자들을 분석해서 페르소나화 해야겠다
# 결론 : 회원등급별 인원수 출력
SELECT grade, COUNT(*) FROM customers
GROUP BY grade;

# 2번 문제 : 
# 자사몰에서 상품을 판매 중 -> 꾸준하게 잘 판매되고 있는 상품과 그렇지 않은 상품 구분
# 잘 판매되고 있는 상품은 지속적으로 신규고객 및 충성고객 확보를 목표
# 판매 실적이 좋지않은 상품은 단종 || 리뉴얼 재고 관리(자산관리)
# 결론 : 상품별 평균 평점 출력
SELECT product_name, AVG(rating) RT
FROM products P
JOIN reviews R
ON P.product_id = R.product_id
GROUP BY product_name
ORDER BY RT DESC;

# OKR, KPI, NSM
# NSM 지표 의거해서 월별 주문건수가 00건 이하로 나오면 위기 // 000건 이상이 나오면 긍정
# 현재 시점을 기준으로 최근 1개월간 전체 주문 건수를 확인
# 결론 : 최근 30일 이내에 주문된 전체 총 건수 출력
SELECT order_date, COUNT(*) FROM orders
WHERE order_date >= CURDATE() - INTERVAL 1 MONTH
GROUP BY order_date; # 모르겠음

# 쌤꺼 
SELECT COUNT(*) recent_order_count
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

# 상품별 최근 한달간 주문건수를 구하세요.
SELECT * FROM orders LIMIT 1;
SELECT * FROM customers LIMIT 1;
SELECT * FROM products LIMIT 1;

SELECT O.product_id, P.product_name, COUNT(*) recent_order_count # AS 생략한 것
FROM orders O
JOIN products P ON P.product_id = O.product_id
WHERE O.order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY O.product_id
ORDER BY recent_order_count DESC;

# 고객별 총 구매 건수와 구매 수량을 구하시고 출력해주세요.
SELECT 
	O.customer_id,
    C.name,
    COUNT(*) order_count,
	SUM(O.quantity) total_quantity
FROM orders O
JOIN customers C ON O.customer_id = C.customer_id
GROUP BY O.customer_id;

# 고객별 총 구매 금액을 (*할인가 기준) 계산 후 출력해주세요.
SELECT 
	O.customer_id,
    C.name, 
    COUNT(*),
    SUM(P.discount_price) total_discount_price
FROM orders O
JOIN products P ON P.product_id = O.product_id
JOIN customers C ON C.customer_id = O.customer_id
GROUP BY O.customer_id
ORDER BY total_discount_price DESC;

# 쌤꺼
SELECT 
	O.customer_id,
	C.name,
	SUM(P.discount_price * O.quantity) total_spent
FROM orders O
JOIN customers C ON O.customer_id = C.customer_id
JOIN products P ON P.product_id = O.product_id
GROUP BY O.customer_id
ORDER BY total_spent DESC;

# 지금까지 가장 많이 판매된 상품(*수량) TOP 5 출력 
SELECT P.product_name, SUM(O.quantity) total_sold
FROM orders O
JOIN products P ON P.product_id = O.product_id
GROUP BY O.product_id
ORDER BY total_sold DESC LIMIT 5;

# 평균 평점이 4.5 이상인 상품명과 평점을 출력 (*인기상품)
SELECT P.product_name, AVG(R.rating) avg_rating
FROM reviews R
JOIN products P ON P.product_id = R.product_id
GROUP BY R.product_id
HAVING avg_rating >= 4.5
ORDER BY avg_rating DESC;







