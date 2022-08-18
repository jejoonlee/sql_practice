
-- .schema 만들기
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

    blood_pressure INTEGER NOT NULL,
    smoking INTEGER NOT NULL,
    is_drinking BOOLEAN NOT NULL
);

-- 흡연 여부(smoking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력
SELECT smoking, COUNT(smoking) FROM healthcare 
GROUP BY smoking
HAVING smoking != '';


-- 음주 여부(is_drinking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력
SELECT is_drinking, COUNT(is_drinking) FROM healthcare
GROUP BY is_drinking;


-- 음주 여부로 구분한 각 그룹에서 혈압(blood_pressure)이 200이상인 사람의 수를 출력
SELECT is_drinking, COUNT(is_drinking) FROM healthcare
WHERE blood_pressure >= 200
GROUP BY is_drinking;


-- 시도(sido)에 사는 사람의 수가 50000명 이상인 시도의 코드와 그 시도에 사는 사람의 수를 출력
SELECT sido, COUNT(sido) FROM healthcare
GROUP BY sido
HAVING COUNT(sido) >= 50000;


-- 키(height)를 기준으로 구분하고, 각 키와 사람의 수를 출력
--> 단, 사람의 수를 기준으로 내림차순으로 5개까지 출력
SELECT height, COUNT(height) FROM healthcare
GROUP BY height
ORDER BY COUNT(height) DESC
LIMIT 5;


-- 키(height)와 몸무게(weight)를 기준으로 구분하고, 몸무게와, 키, 해당 그룹의 사람의 수를 출력
--> 단, 사람의 수를 기준으로 내림차순 5개까지 출력
SELECT height, weight, COUNT(*) FROM healthcare
GROUP BY height, weight
ORDER BY COUNT(*) DESC
LIMIT 5;


-- 음주여부에 따라 평균 허리둘레(waist)와 사람의 수를 출력
SELECT is_drinking, COUNT(*), AVG(waist) FROM healthcare
WHERE is_drinking != ''
GROUP BY is_drinking;

-- 각 성별(gender)의 평균 왼쪽 시력(va_left)과 평균 오른쪽 시력(va_right)를 출력
--> 단, 평균 왼쪽 시력과 평균 오른쪽 시력의 컬럼명을 '평균 왼쪽 시력' '평균 오른쪽 시력'로 표시하고, 평균 시력은 소수점 둘째 자리까지 출력
SELECT gender, ROUND(AVG(va_left), 2) AS '평균 왼쪽 시력', ROUND(AVG(va_right), 2) AS '평균 오른쪽 시력' FROM healthcare
GROUP BY gender;


-- 각 나이대(age)의 평균 키와 평균 몸무게를 출력하
--> 단, 평균 키와 평균 몸무게의 컬럼명을 '평균 키' '평균 몸무게'로 표시하고, 평균키가 160 이상 평균 몸무게가 60 이상인 데이터만 출력
SELECT age, AVG(height) AS '평균 키', AVG(weight) AS '평균 몸무게'
FROM healthcare
GROUP BY age
HAVING AVG(height) >= 160 AND AVG(weight) >= 60;


-- 음주 여부(is_drinking)와 흡연 여부(smoking)에 따른 평균 BMI를 출력
--> 단, 음주 여부 또는 흡연 여부가 공백이 아닌 행만 사용
SELECT is_drinking, smoking, ROUND(AVG(weight / ((height * 0.01) * (height * 0.01))), 2) AS 'Average BMI'
FROM healthcare
WHERE is_drinking != '' AND smoking != ''
GROUP BY is_drinking, smoking;