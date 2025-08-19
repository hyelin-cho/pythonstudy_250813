-- SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;

UPDATE customer
SET first_name = "MARY" # 4. 다시 이름 바꾸기로 해서 사용 가능
# 2. customer_id 1번 사용자에 한해서 이름 바꾸기
WHERE customer_id = 1;

COMMIT; # 3. 이걸 사용하면 돌아올 수 없는 강을 건너는 것임. 이건 ROLLBACK해도 소용 없음.

SELECT * FROM customer LIMIT 10;

-- ROLLBACK; # 1.위의 구문을 입력했을 때 망했다! -> 다시 되돌리는 것!! 단 COMMIT하기 전에만 가능!!!!!

