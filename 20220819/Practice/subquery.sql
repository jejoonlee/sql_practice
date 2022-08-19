
정호,유,40,전라북도,016-7280-2855,370
CREATE TABLE users(
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);


-- users에서 가장 나이가 작은 사람의 수
SELECT COUNT(*) FROM users
WHERE age = (SELECT MIN(age) FROM users);
-- 먼저 나이 중 제일 어린 나이를 구한다 (15살)
-- 그리고 모든 사람들 수 중에, 제일 나이가 어린 사람들의 수를 가져온다
-- COUNT(*)
-- --------
-- 39

-- users에서 평균 계좌 잔고보다 높은 사람의 수
SELECT COUNT(*) FROM users
WHERE balance > (SELECT AVG(balance) FROM users);
-- 먼저 편균 계좌 잔고를 구한다 (151457)
-- COUNT(*)
-- --------
-- 222

-- users에서 유은정과 같은 지역에 사는 사람의 수
SELECT COUNT(*) '지역' FROM users
WHERE address = (SELECT address FROM users WHERE last_name || first_name = '유은정');

SELECT address FROM users WHERE last_name || first_name = '유은정';
-- 유은정이란 사람이 어디에 사는지 먼저 구한다 (강원도)
-- 지역
-- ---
-- 101

-- 전체 인원과 평균 연봉, 평균 나이를 출력
SELECT COUNT(*) AS '전체 인원', AVG(balance) AS '평균 연봉', AVG(age) AS '평균 나이' FROM users;

SELECT
    (SELECT COUNT(*) FROM users) AS '전체 인원',
    (SELECT AVG(balance) FROM users) AS '평균 연봉',
    (SELECT AVG(age) FROM users) AS '평균 나이';
-- 두가지 query로 출력할 수 있다.
-- 밑에는 다른 테이블에서 정보를 가지고 올 때 유용하다

-- UPDATE 활용
UPDATE users
SET balance = (SELECT AVG(balance) FROM users)
-- users에 있는 balance 부분에서, 모든 balance를
-- balance 평균으로 다 지정한다

-- users에서 이은정과 같은 지역에 사는 사람의 수
SELECT COUNT(*) FROM users
WHERE address IN (SELECT address FROM users
WHERE last_name || first_name = '이은정');
-- IN 을 사용해서 이은정과 같은 지역에 사는 모든 사람의 수를 구한다
-- 이은정이라는 사람은 2명이고, 둘 다 다른 지역에서 산다
-- COUNT(*)
-- -------
-- 218

SELECT address FROM users
WHERE last_name || first_name = '이은정';


-- 특정 성씨에서 가장 어린 사람들의 이름과 나이
SELECT last_name, first_name, age FROM users
WHERE (last_name, age) IN
(SELECT last_name, MIN(age) FROM users
GROUP BY last_name)
ORDER BY last_name;

SELECT last_name, MIN(age) FROM users
GROUP BY last_name;
-- 성씨를 기준으로 가장 어린 사람들을 구한다