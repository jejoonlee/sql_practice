-- SQLite

-- schema 만들기
CREATE TABLE healthcare(
    id PRIMARY KEY,        
    sido INTEGER NOT NULL, 
    gender INTEGER NOT NULL,
    age INTEGER NOT NULL,  
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    waist REAL NOT NULL,   
    va_left REAL NOT NULL, 
    va_right REAL NOT NULL,

    blood_pressure INTEGER 
    NOT NULL,
    smoking INTEGER NOT NULL,
    is_drinking BOOLEAN NOT NULL
);

-- 파일에서 정보 불러오기
.mode csv
.import health.csv healthcare

-- 추가되어 있는 모든 데이터의 수 출력
SELECT COUNT(*) FROM healthcare;

-- 연령 코드(age)의 최대, 최소 값을 모두 출력
SELECT MAX(age), MIN(age) FROM healthcare;

-- 신장(height)과 체중(weight)의 최대, 최소 값을 모두 출력
SELECT MAX(height), MIN(height), MAX(weight), MIN(weight) FROM healthcare;

-- 신장(height)이 160이상 170이하인 사람은 몇 명인지 출력
SELECT COUNT(*) FROM healthcare WHERE height BETWEEN 160 AND 170;

-- 음주(is_drinking)를 하는 사람(1)의 허리 둘레(waist)를 높은 순으로 5명 출력 
SELECT * FROM healthcare WHERE is_drinking = 1 AND waist LIKE '%_%' ORDER BY waist DESC LIMIT 5;

-- 시력 양쪽(va_left, va_right)이 1.5이상이면서 음주(is_drinking)를 하는 사람의 수를 출력
SELECT COUNT(*) FROM healthcare WHERE (va_left >= 1.5 AND va_right >= 1.5) AND is_drinking = 1;

-- 혈압(blood_pressure)이 정상 범위(120미만)인 사람의 수를 출력
SELECT COUNT(*) FROM healthcare WHERE blood_pressure < 120;

-- 혈압(blood_pressure)이 140이상인 사람들의 평균 허리둘레(waist)를 출력
SELECT AVG(waist) FROM healthcare WHERE blood_pressure >= 140;

-- 성별(gender)이 1인 사람의 평균 키(height)와 평균 몸무게(weight)를 출력
SELECT AVG(height), AVG(weight) FROM healthcare WHERE gender = 1;

-- 키가 가장 큰 사람 중에 두번째로 무거운 사람의 id와 키(height), 몸무게(weight)를 출력
SELECT id, height, weight FROM healthcare ORDER BY height DESC, weight DESC LIMIT 1 OFFSET 1;

--  BMI가 30이상인 사람의 수를 출력
-- > BMI는 체중/(키*키)의 계산 결과 
-- > 키는 미터 단위로 계산
SELECT COUNT(*) FROM healthcare WHERE weight / ((height * 0.01) * (height * 0.01)) >= 30;

-- 흡연(smoking)이 3인 사람의 BMI지수가 제일 높은 사람 순서대로 5명의 id와 BMI를 출력
-- > BMI는 체중/(키*키)의 계산 결과 
-- > 키는 미터 단위로 계산
SELECT id, round(weight / ((height * 0.01) * (height * 0.01)), 2) BMI  FROM healthcare WHERE smoking = 3 ORDER BY BMI DESC LIMIT 5;
-- round 를 써서 소수 2번째까지 출력한다


-- 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유


-- 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유


-- 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유