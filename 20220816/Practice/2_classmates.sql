-- SQLite

CREATE TABLE players (
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL
);

.schema players
--CREATE TABLE players (
--    name TEXT NOT NULL,
--    age INTEGER NOT NULL,
--    address TEXT NOT NULL
--);


-- 여러 정보 한번에 넣기
INSERT INTO players VALUES
('홍길동','23','서울'),
('손흥민','29','서울'),
('세징야','30','대구'),
('전진우', '24','수원'),
('염기훈', '36','수원');

SELECT rowid, * FROM players;
-- rowid  name  age  address
-- -----  ----  ---  -------
-- 1      홍길동   23   서울
-- 2      손흥민   29   서울
-- 3      세징야   30   대구
-- 4      전진우   24   수원
-- 5      염기훈   36   수원

-- 내가 보고싶은 정보를 SELECT 다음에 넣으면 된다
SELECT rowid, name, address FROM players;
-- rowid  name  address
-- -----  ----  -------
-- 1      홍길동   서울
-- 2      손흥민   서울
-- 3      세징야   대구
-- 4      전진우   수원
-- 5      염기훈   수원

-- LIMIT 3를 해서 위에서 3명을 가지고 온다
SELECT rowid, name, address FROM players LIMIT 3;
-- rowid  name  address
-- -----  ----  -------
-- 1      홍길동   서울
-- 2      손흥민   서울
-- 3      세징야   대구

-- 앞에 두 명을 OFFSET하고, 뒤에 한명을 가지고 온다
SELECT rowid, name, address FROM players LIMIT 1 OFFSET 2;
-- rowid  name  address
-- -----  ----  -------
-- 3      세징야   대구

-- 앞에 3명을 건너뛰고, 그 뒤에 2명을 가지고 온다
SELECT rowid, name, address FROM players LIMIT 2 OFFSET 3;
-- rowid  name  address
-- -----  ----  -------
-- 4      전진우   수원
-- 5      염기훈   수원

-- address가 대구인 선수들을 가지고 온다
SELECT * FROM players where address = '대구';
-- name  age  address
-- ----  ---  -------
-- 세징야   30   대구

-- 25살 이상인 선수들을 가지고 온다
SELECT * FROM players where age >= 25;
-- name  age  address
-- ----  ---  -------
-- 손흥민   29   서울
-- 세징야   30   대구
-- 염기훈   36   수원

-- 중복값을 없애준다
SELECT DISTINCT address FROM players;
-- address
-- -------
-- 서울
-- 대구
-- 수원

-- rowid가 5인 정보를 삭제한다
DELETE FROM players WHERE rowid = 5;
-- rowid  name  age  address
-- -----  ----  ---  -------
-- 1      홍길동   23   서울
-- 2      손흥민   29   서울
-- 3      세징야   30   대구
-- 4      전진우   24   수원

-- 정보를 추가해준다
INSERT INTO players VALUES ('염기훈', 36, '수원');

-- 저장된 정보에서 정보를 수정하기
UPDATE players SET name = '오헌규', age = 22 WHERE rowid = 5;