-- 테이블 만들기
CREATE TABLE healthcare (
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

-- csv import 하기
.mode csv 
.import health.csv healthcare

-- 모든 데이터의 수를 구하는 것 COUNT(*)
SELECT COUNT(*) FROM healthcare;

-- 나이 그룹이 10세 미만인 사람의 수
SELECT COUNT(age) FROM healthcare WHERE age < 10;

-- 성별이 1인 사람의 수
SELECT COUNT(gender) FROM healthcare WHERE gender = 1;

-- 흡연 수치가 3이면서 음주가 1인 사람의 수
-- AND를 써준다!
SELECT COUNT(*) FROM healthcare WHERE smoking = 3 AND is_drinking = 1;

-- 양쪽 시력이 (va_left, va_right) 모두 2.0이상인 사람의 수를 출력
SELECT COUNT(*) FROM healthcare WHERE va_left >= 2.0 AND va_right >= 2.0;

-- 시도를 모두 중복 없이 출력
SELECT DISTINCT sido FROM healthcare;