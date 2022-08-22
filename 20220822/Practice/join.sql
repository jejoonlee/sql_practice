-- 테이블 생성

CREATE TABLE users(
    id INT PRIMARY KEY,
    name TEXT,
    role_id INT
);

INSERT INTO users VALUES
(1,'관리자',1),
(2,'김철수',2),
(3,'이영희',2);

CREATE TABLE role(
    id INT PRIMARY KEY,
    title TEXT
);

INSERT INTO role VALUES
(1,'admin'),
(2,'staff'),
(3,'student');

CREATE TABLE articles(
    id INT PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id INT
);

INSERT INTO articles VALUES
(1,'1번글', '111', 1),
(2,'2번글', '222', 2),
(3,'3번글', '333', 1),
(4,'4번글', '444', NULL);

-- INNER JOIN (JOIN은 생략 가능)
-- 사용자와 각가의 역할을 출력
SELECT * FROM users JOIN role
ON users.role_id = role.id;
-- id  name  role_id  id  title
-- --  ----  -------  --  -----
-- 1   관리자   1        1   admin
-- 2   김철수   2        2   staff
-- 3   이영희   2        2   staff

-- staff(2) 사용자(users)를 역할과 함께 출력
SELECT users.name "이름", role.title "역할" FROM users JOIN role
on users.role_id = role.id
WHERE users.role_id = 2;
-- 이름   역할
-- ---  -----
-- 김철수  staff
-- 이영희  staff

-- 사용자(users)와 각각의 역할을 이름의 내림차순으로 출력
SELECT users.name name, role.title role FROM users JOIN role
ON users.role_id = role.id
ORDER BY name DESC;
-- name  role
-- ----  -----
-- 이영희   staff
-- 김철수   staff
-- 관리자   admin


-- OUTER JOIN

-- 모든 게시글을 사용자 정보와 함께 출력
SELECT * FROM articles LEFT JOIN users
ON articles.user_id = users.id;
-- id  title  content  user_id  id  name  role_id
-- --  -----  -------  -------  --  ----  -------
-- 1   1번글    111      1        1   관리자   1
-- 2   2번글    222      2        2   김철수   2
-- 3   3번글    333      1        1   관리자   1
-- 4   4번글    444

-- OUTER JOIN이 아니라 INNER JOIN일 경우 4번이 빠진다
-- 이유는 4번의 user_id가 `user` 테이블에 없어서


-- 작성자가 있는 모든 게시글을 사용자 정보와 함께 출력
SELECT * FROM articles LEFT JOIN users
ON articles.user_id = users.id
WHERE articles.user_id IS NOT NULL;
-- id  title  content  user_id  id  name  role_id
-- --  -----  -------  -------  --  ----  -------
-- 1   1번글    111      1        1   관리자   1
-- 2   2번글    222      2        2   김철수   2
-- 3   3번글    333      1        1   관리자   1


--  모든 게시글과 모든 사용자 정보를 출력 (FULL JOIN)
SELECT * FROM articles FULL JOIN users
ON articles.user_id = users.id;
-- id  title  content  user_id  id  name  role_id
-- --  -----  -------  -------  --  ----  -------
-- 1   1번글    111      1        1   관리자   1
-- 2   2번글    222      2        2   김철수   2
-- 3   3번글    333      1        1   관리자   1
-- 4   4번글    444
--                              3   이영희   2