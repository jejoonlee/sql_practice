-- SQLite

-- 1. 테이블 이름 출력
.TABLE

-- 2. 모든 테이블의 데이터 확인
.SCHEMA 테이블이름
확장 프로그램

-- 3. 앨범(albums) 테이블의 데이터를 출력
-- Title 기준으로 내림차순 5개
SELECT * FROM albums
ORDER BY Title DESC
LIMIT 5;

-- 4. 고객(customers) 테이블의 행 개수를 출력
-- 컬럼명을 고객 수로 출력
SELECT COUNT(*) '고객 수' FROM customers;

-- 5. 고객(customers) 테이블에서 고객이 사는 나라가 USA인 고객의 FirstName, LastName을 출력
-- 각각 컬럼명을 이름, 성으로 출력 / 이름을 기준으로 내림차순으로 5개까지 출력

SELECT FirstName AS '이름', LastName AS '성' FROM customers
WHERE Country = 'USA'
ORDER BY FirstName DESC
LIMIT 5;

-- 6. 송장 (invoices) 테이블에서 BillingPostalCode가 NULL이 아닌 행의 개수를 출력
-- 컬럼명을 송장수로 출력
SELECT COUNT(BillingPostalCode) AS '송장수' FROM invoices
WHERE BillingPostalCode IS NOT NULL;

-- 7. 송장(invoices) 테이블에서 BillingState가 NULL인 데이터를 출력
-- 단 InvoiceDate를 기준으로 내림차순으로 5개까지 출력
SELECT InvoiceId, CustomerId, InvoiceDate FROM invoices
WHERE BillingState IS NULL
ORDER BY InvoiceDate DESC
LIMIT 5;

-- 8. 송장(invoices) 테이블에서 InvoiceDate의 년도가 2013인 행의 개수를 출력
-- strftime을 검색해서 활용
SELECT COUNT(*) FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2013';
-- strftime: 날짜를 표시하기 위한 함수 중 하나 / 포멧을 지정할 수 있음
-- '%Y'은 년도 / '%m' 월 / '%d' 일

-- 9. 고객(customers) 테이블에서 `FirstName`이 `L` 로 
-- 시작하는 고객의 `CustomerId`, `FirstName`, `LastName`을 출력
-- 각각의 컬럼명을 `고객ID`, `이름`,`성`으로 출력하고, 
-- `고객ID`을 기준으로 오름차순으로 출력
SELECT CustomerId AS '고객ID', FirstName AS '이름', LastName AS '성' FROM customers
WHERE FirstName LIKE 'L%'
ORDER BY CustomerId ASC;

-- 10. 고객(customers) 테이블에서 각 나라의 고객 수와 해당 나라 이름을 출력하세요.
-- 각각의 컬렴명을 `고객 수`,`나라`로 출력하고, 고객 수 상위 5개의 나라만 출력
SELECT COUNT(*) AS "고객 수", Country AS "나라" FROM customers
GROUP BY Country
ORDER BY "고객 수" DESC
LIMIT 5;

-- 11. 앨범(albums) 테이블에서 가장 많은 앨범이 있는 Artist의 
-- `ArtistId`와 `앨범 수`를 출력
SELECT ArtistId, COUNT(ArtistId) AS "앨범 수" FROM albums
GROUP BY ArtistId
ORDER BY "앨범 수" DESC
LIMIT 1;



-- 12. 앨범(albums) 테이블에서 보유 앨범 수가 10개 이상인 Artist의 
-- `ArtistId`와 `앨범 수` 출력하세요
-- 앨범 수를 기준으로 내림차순으로 출력하세요.
SELECT ArtistId, COUNT(ArtistId) AS "앨범 수" FROM albums
GROUP BY ArtistId
HAVING "앨범 수" >= 10
ORDER BY "앨범 수" DESC;

-- 13. 고객(customers) 테이블에서 State가 존재하는 고객들을 Country와 State를
-- 기준으로 그룹화해서 각 그룹의 고객 수, Country, State를 출력하세요
-- 고객 수, Country 순서 기준으로 내림차순으로 5개까지 출력
SELECT COUNT(*) AS "고객 수", Country, State FROM customers
WHERE State IS NOT NULL
GROUP BY Country, State
ORDER BY "고객 수" DESC, Country DESC
LIMIT 5;

-- 14. 고객(customers) 테이블에서 Fax가 'NULL'인 고객은 'X'
-- NULL이 아닌 고객은 'O'로 Fax 유/무 컬럼에 표시하여 출력
-- CustomerId와 Fax 유/무 컬럼만 출력하고, CustomerId 기준으로 오름차순으로 5개 출력
SELECT CustomerId,
    CASE
    WHEN Fax IS NULL THEN 'X'
    ELSE 'O'
    END AS "Fax 유/무"
FROM customers
ORDER BY CustomerId
LIMIT 5;

-- 15. 점원 (employees) 테이블에서 올해년도 - BirthDate 년도 + 1 를 계산해서
-- 나이 컬럼에 표시하여 출력
-- 단, 점원의 LastName, FirstName, 나이 칼럼만 출력하고, EmployeeId를 기준으로 오름차순으로 출력
-- cast(), strftime(), 오늘 날짜를 구하는 함수를 검색하고 활용
SELECT
LastName,
FirstName,
(strftime('%Y', 'now') - strftime('%Y', BirthDate) + 1) AS "나이" FROM employees
ORDER BY EmployeeId;

SELECT
LastName,
FirstName,
CAST(strftime('%Y', 'now') AS INT) - CAST(strftime('%Y', BirthDate) AS INT) + 1 AS "나이" FROM employees
ORDER BY EmployeeId;


-- 16. 가수(artists) 테이블에서 앨범(albums)의 개수가 가장 많은 가수의 `Name`을 출력
-- artists 테이블과 albums 테이블의 ArtistId 활용
SELECT Name FROM artists
WHERE ArtistId = 
    (SELECT ArtistId FROM albums
    GROUP BY ArtistId
    ORDER BY COUNT(*) DESC
    LIMIT 1);

-- 17. 장르 (genres) 테이블에서 음악 (tracks)의 개수가 가장 적은 장르의 Name을 출력
SELECT Name FROM genres
WHERE GenreId = 
    (SELECT GenreId FROM tracks
    GROUP BY GenreId
    ORDER BY COUNT(*)
    Limit 1);


SELECT GenreId FROM tracks
GROUP BY GenreId
ORDER BY COUNT(*)
Limit 1;