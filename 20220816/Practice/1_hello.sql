-- SQLite

-- 테이블 생성
-- 테이블 목록들 설정 (어떤 정보가 들어갈지 설정하는 것)
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT
);

.tables

-- 테이블 설정된 목록 조회
.schema classmates

-- 테이블 목록 조회
.tables

-- 값을 넣기
INSERT INTO classmates VALUES (1, '이제준');

-- 값을 조회 하는 것
SELECT * FROM classmates;

-- 테이블 삭제
DROP TABLE classmates;