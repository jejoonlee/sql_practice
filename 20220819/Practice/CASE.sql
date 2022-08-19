-- SQLite

-- gender가 1인 경우는 남자 gender가 2인 경우는 여자를 출력
SELECT id,
    CASE
    WHEN gender = 1 THEN '남자'
    WHEN gender = 2 THEN '여자'
    END
FROM healthcare
LIMIT 5;

-- ELSE 사용하기
SELECT id,
    CASE
    WHEN gender = 1 THEN '남자'
    ELSE '여자'
    END
FROM healthcare
LIMIT 5;

-- 나이에 따라 청소년 (~18), 청년(~30), 중장년(~64)로 출력
SELECT first_name,age,
    CASE
    WHEN age <= 18 THEN '청소년'
    WHEN age <= 30 THEN '청년'
    WHEN age <= 64 THEN '중장년'
    ELSE '노년'
    END
FROM users
LIMIT 100;