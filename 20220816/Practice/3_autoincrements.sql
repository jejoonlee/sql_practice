-- SQLite

-- AUTOINCREMENT 설정하기
-- 주로 PRIMARY KEY에 넣는다

CREATE TABLE members (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

INSERT INTO members VALUES
(1, '홍길동'), 
(2, '김철수'),
(3, '이호영'),
(4, '박민희'),
(5, '최혜영');

DELETE FROM members WHERE id = 5;
INSERT INTO members (name) VALUES ('이제준');

-- AUTOINCREMENT를 사용시 정보가 사라져도, 고유번호는 유지된다.
SELECT * FROM members;
-- id  name
-- --  ----
-- 1   홍길동
-- 2   김철수
-- 3   이호영
-- 4   박민희
-- 6   이제준