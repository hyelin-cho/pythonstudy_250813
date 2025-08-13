USE interpark;

SELECT * FROM performences;

# 1. 크롤링한 전체 데이터 개수
SELECT COUNT(*) AS Total_performences FROM performences; # AS 생략 가능. 하지만 지금은 하지마라.

# 2. 크롤링한 데이터 가운데 어떤 지역.장소에서 가장 많이 공연을 하고 있는지 확인
SELECT place, COUNT(*) AS 개수
FROM performences 
GROUP BY place
ORDER BY 개수 DESC; # 내림차순 DESC 

# 3. 특정 장소 공연 조회
SELECT * FROM performences
WHERE place LIKE "%전국 각 지역%";

# 4. 공연 일정이 가까운 순 정렬 (*시작일을 기준)
SELECT title, place, SUBSTRING_INDEX(date_range, ' - ', 1) AS start_date
FROM performences
ORDER BY start_date DESC;
