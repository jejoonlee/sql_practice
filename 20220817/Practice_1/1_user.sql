-- SQLite

-- 정호,유,40,전라북도,016-7280-2855,370
-- schema 만들기
CREATE TABLE users (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);

-- Comma Seperate Variable로 모드 설정하기
.mode csv

-- column 별로 정리되어 출력
.mode column

-- users.csv의 정보 가져오기
.import users.csv users

-- users 테이블에서 age가 30 이상인 유저의 모든 컬럼 정보 조회
-- * 모든 컬럼 정보 조회 
SELECT * FROM users WHERE age >= 30;

-- users 테이블에서 age가 30 이상인 유저의 이름만 조희
SELECT first_name FROM users WHERE age >= 30;

-- users 테이블에서 age가 30 이상, 성이 ‘김’인 사람의 나이와 이름만 조회
SELECT first_name, age FROM users WHERE age >= 30 AND last_name = '김';

-- users 테이블의 레코드 총 개수를 조회
SELECT COUNT(*) FROM users;

-- 30살 이상인 사람들의 평균 나이
SELECT AVG(age) FROM users WHERE age >= 30;

--  계좌 잔액(balance)이 가장 높은 사람과 그 액수를 조회
SELECT first_name, MAX(balance) FROM users;

-- 나이가 30 이상인 사람의 계좌 평균 잔액을 조회
SELECT AVG(balance) FROM users WHERE age >= 30;

-- LIKE 사용
-- users 테이블에서 나이가 20대인 사람만 조회
SELECT * FROM users WHERE age LIKE '2_';

-- users 테이블에서 지역 번호가 02인 사람만 조회
SELECT * FROM users WHERE phone LIKE '02-%';

--  users 테이블에서 이름이 ‘준’으로 끝나는 사람만 조회
SELECT * FROM users WHERE first_name LIKE '%준';

-- users 테이블에서 중간 번호가 5114인 사람만 조회
SELECT * FROM users WHERE phone LIKE '%-5114-%';

-- ORDER BY
-- users 에서 나이 순으로 오름차순 정렬하여 상위 10개만 조회
SELECT * FROM users ORDER BY age ASC LIMIT 10;

--  나이 순, 성 순으로 오름차순 정렬하여 상위 10개만 조회
SELECT * FROM users ORDER BY age ASC, last_name ASC LIMIT 10;

-- 계좌 잔액 순으로 내림차순 정렬하여 해당 유저의 성과 이름을 10개만 조회
SELECT last_name, first_name FROM users ORDER BY balance DESC LIMIT 10;