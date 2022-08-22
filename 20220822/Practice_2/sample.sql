
-- 1. playlist_track 테이블에 `A`라는 별칭을 부여하고 데이터를 출력
-- 모든 컬럼을 `PlaylistId` 기준으로 내림차순으로 5개만 출력
SELECT * FROM playlist_track AS "A"
ORDER BY PlaylistId DESC
LIMIT 5;

-- 2.  tracks 테이블에 `B`라는 별칭을 부여하고 데이터를 출력
-- 모든 컬럼을 `TrackId` 기준으로 오름차순으로 5개만 출력
SELECT TrackId, Name FROM tracks AS "B"
ORDER BY TrackId ASC
LIMIT 5;

-- 3. 각 playlist_track 해당하는 track 데이터를 함께 출력
-- PlaylistId, Name 컬럼을 `PlaylistId` 기준으로 내림차순으로 10개만 출력
SELECT playlist_track.PlaylistId, tracks.Name FROM playlist_track
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
ORDER BY playlist_track.PlaylistID DESC
LIMIT 10;

-- 4. `PlaylistId`가 `10`인 track 데이터를 함께 출력
-- PlaylistId, Name 컬럼을 `Name` 기준으로 내림차순으로 5개만 출력
SELECT playlist_track.PlaylistId, tracks.Name From playlist_track
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
WHERE playlist_track.PlaylistId = 10
ORDER BY tracks.Name DESC
LIMIT 5;

-- 5. tracks 테이블을 기준으로 tracks `Composer` 와 artists 
-- 테이블의 `Name`을 `INNER JOIN`해서 데이터를 출력
-- 행의 개수만 출력하세요.
SELECT COUNT(*) FROM tracks
JOIN artists ON tracks.Composer = artists.Name;

-- 6. tracks 테이블을 기준으로 tracks `Composer` 와 artists 테이블의 `Name`을 `LEFT JOIN`해서 데이터를 출력
-- 행의 개수만 출력
SELECT COUNT(*) "All Composers" FROM tracks
LEFT OUTER JOIN artists ON tracks.Composer = artists.Name;

-- 8. invoice_items 테이블의 데이터를 출력
-- InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력
SELECT InvoiceLineId, InvoiceId FROM invoice_items
ORDER BY InvoiceID ASC
LIMIT 5;

-- 9. invoices 테이블의 데이터를 출력
-- InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력
SELECT InvoiceId, CustomerId FROM invoices
ORDER BY InvoiceId ASC
LIMIT 5;

-- 10. 각 invoices_item에 해당하는 invoice 데이터를 함께 출력
-- InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력
SELECT invoice_items.InvoiceLineId, invoices.InvoiceId FROM invoice_items
Join invoices ON invoice_items.InvoiceId = invoices.InvoiceId
ORDER BY invoices.InvoiceId DESC
LIMIT 5;

-- 11. 각 invoice에 해당하는 customer 데이터를 함께 출력
-- InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력
SELECT invoices.InvoiceID, customers.CustomerId FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
ORDER BY invoices.InvoiceID DESC
LIMIT 5;

-- 12. 각 invoices_item(상품)을 포함하는 invoice(송장)와 
-- 해당 invoice를 받을 customer(고객) 데이터를 모두 함께 출력
-- InvoiceLineId, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력
SELECT invoice_items.InvoiceLineId, invoices.InvoiceId, customers.CustomerId
FROM invoice_items
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
Join customers ON invoices.CustomerId = customers.CustomerId
ORDER BY invoice_items.InvoiceId DESC
LIMIT 5;

-- 13. 각 customer가 주문한 invoices_item의 개수를 출력
-- CustomerId와 개수 컬럼을 `CustomerId` 기준으로 오름차순으로 5개만 출력
SELECT customers.CustomerId, COUNT(*)
FROM invoice_items
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
JOIN customers ON invoices.CustomerId = customers.CustomerID
GROUP BY customers.CustomerId
LIMIT 5;