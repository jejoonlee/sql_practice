# 실습

### 1. playlist_track 테이블에 `A`라는 별칭을 부여하고 데이터를 출력하세요.

| 단, 모든 컬럼을 `PlaylistId` 기준으로 내림차순으로 5개만 출력하세요.

```sqlite
SELECT * FROM playlist_track AS "A"
ORDER BY PlaylistId DESC
LIMIT 5;
```

```sqlite
PlaylistId  TrackId
----------  -------
18          597
17          3290
17          2096
17          2095
17          2094
```



### 2. tracks 테이블에 `B`라는 별칭을 부여하고 데이터를 출력하세요

| 단, 모든 컬럼을 `TrackId` 기준으로 오름차순으로 5개만 출력하세요.

```sqlite
SELECT * FROM tracks AS "B"
ORDER BY TrackId ASC
LIMIT 5;
```

```sqlite
너무 column이 길어서 TrackID 이랑 Name만

TrackId  Name
-------  ---------------------------------------
1        For Those About To Rock (We Salute You)
2        Balls to the Wall
3        Fast As a Shark
4        Restless and Wild
5        Princess of the Dawn
```



### 3. 각 playlist_track 해당하는 track 데이터를 함께 출력하세요.

| 단, PlaylistId, Name 컬럼을 `PlaylistId` 기준으로 내림차순으로 10개만 출력하세요. 

```sqlite
SELECT playlist_track.PlaylistId, tracks.Name FROM playlist_track
JOIN tracks on playlist_track.TrackId = tracks.TrackId
ORDER BY playlist_track.PlaylistID DESC
LIMIT 10;
```

```sqlite
PlaylistId  Name
----------  -----------------------
18          Now's The Time
17          The Zoo
17          Flying High Again
17          Crazy Train
17          I Don't Know
17          Looks That Kill
17          Live To Win
17          Ace Of Spades
17          Creeping Death
17          For Whom The Bell Tolls
```



### 4. `PlaylistId`가 `10`인 track 데이터를 함께 출력하세요. 

| 단, PlaylistId, Name 컬럼을 `Name` 기준으로 내림차순으로 5개만 출력하세요.

```sqlite
SELECT playlist_track.PlaylistId, tracks.Name From playlist_track
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
WHERE playlist_track.PlaylistId = 10
ORDER BY tracks.Name DESC
LIMIT 5;
```

```sqlite
PlaylistId  Name
----------  ------------------------
10          Women's Appreciation
10          White Rabbit
10          Whatever the Case May Be
10          What Kate Did
10          War of the Gods, Pt. 2
```



### 5. tracks 테이블을 기준으로 tracks `Composer` 와 artists 테이블의 `Name`을 `INNER JOIN`해서 데이터를 출력하세요.

| 단, 행의 개수만 출력하세요.

```sqlite
-- tracks에서 Composer 이름이 artists에서 Name과 같은 값의 개수를 출력
SELECT COUNT(*) FROM tracks
JOIN artists ON tracks.Composer = artists.Name;
```

```sqlite
COUNT(*)
--------
402

-- Composer와 아티스트 이름이 같은 tracks
```



### 6. tracks 테이블을 기준으로 tracks `Composer` 와 artists 테이블의 `Name`을 `LEFT JOIN`해서 데이터를 출력하세요.

| 단, 행의 개수만 출력하세요.

```sqlite
SELECT COUNT(*) FROM tracks
LEFT OUTER JOIN artists ON tracks.Composer = artists.Name;
```

```sqlite
COUNT(*) 모든 Composer들
--------
3503
```



### 7. `INNER JOIN` 과 `LEFT JOIN` 행의 개수가 다른 이유를 작성하세요.

`INNER JOIN` 은 `tracks`에 있는 `Composer`의 이름과 `artist` 테이블에 있는 `Name` 이 동일 했을 때의 개수를 센다

반대로 `LEFT OUTER JOIN`은 `tracks`에 있는 모든 `Composer`들의 이름들의 개수를 세는 것 (Composer 내에 중복도 포함) 



### 8. invoice_items 테이블의 데이터를 출력하세요.

| 단, InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력하세요.

```sqlite
SELECT InvoiceLineId, InvoiceId FROM invoice_items
ORDER BY InvoiceID ASC
LIMIT 5;
```

```sqlite
InvoiceLineId  InvoiceId  TrackId  UnitPrice  Quantity
-------------  ---------  -------  ---------  --------
1              1          2        0.99       1
2              1          4        0.99       1
3              2          6        0.99       1
4              2          8        0.99       1
5              2          10       0.99       1
```



### 9. invoices 테이블의 데이터를 출력하세요.

| 단, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력하세요.

```sqlite
SELECT InvoiceId, CustomerId FROM invoices
ORDER BY InvoiceId ASC
LIMIT 5;
```

```sqlite
InvoiceId  CustomerId
---------  ----------
1          2
2          4
3          8
4          14
5          23
```



### 10. 각 invoices_item에 해당하는 invoice 데이터를 함께 출력하세요.

| 단, InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sqlite
SELECT invoice_items.InvoiceLineId, invoices.InvoiceId FROM invoice_items
Join invoices ON invoice_items.InvoiceId = invoices.InvoiceId
ORDER BY invoice_items.InvoiceId DESC
LIMIT 5;
```

```sqlite
InvoiceLineId  InvoiceId
-------------  ---------
2240           412
2239           411
2238           411
2237           411
2236           411
```



### 11. 각 invoice에 해당하는 customer 데이터를 함께 출력하세요.

| 단, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sqlite
SELECT invoices.InvoiceID, customers.CustomerId FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
ORDER BY invoices.InvoiceID DESC
LIMIT 5;
```

```sqlite
InvoiceId  CustomerId
---------  ----------
412        58
411        44
410        35
409        29
408        25
```



### 12. 각 invoices_item(상품)을 포함하는 invoice(송장)와 해당 invoice를 받을 customer(고객) 데이터를 모두 함께 출력하세요.

| 단, InvoiceLineId, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sqlite
SELECT invoice_items.InvoiceLineId, invoices.InvoiceId, customers.CustomerId
FROM invoice_items
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
Join customers ON invoices.CustomerId = customers.CustomerId
ORDER BY invoices.InvoiceId DESC
LIMIT 5;
```

```sqlite
InvoiceLineId  InvoiceId  CustomerId
-------------  ---------  ----------
2240           412        58
2226           411        44
2227           411        44
2228           411        44
2229           411        44
```



### 13. 각 cusotmer가 주문한 invoices_item의 개수를 출력하세요.

| 단, CustomerId와 개수 컬럼을 `CustomerId` 기준으로 오름차순으로 5개만 출력하세요.

```sqlite
SELECT C.CustomerId, count(*) FROM invoice_items A
INNER JOIN (
    SELECT * FROM invoices A
    INNER JOIN customers B
    ON A.CustomerId = B.CustomerId
) C
ON A.InvoiceId = C.InvoiceId
GROUP BY C.CustomerId
ORDER BY C.CustomerId ASC
LIMIT 5;
```

```sqlite
CustomerId  COUNT(*)
----------  --------
1           38
2           38
3           38
4           38
5           38
```



### 14. 각 customer가 주문한 invoices의 개수, CustomerId 기준 내림차순, 5개

```sqlite
SELECT CustomerId, COUNT(*) FROM invoices
GROUP BY CustomerId
ORDER BY CustomerId DESC
LIMIT 5;
```

```sqlite
CustomerId  COUNT(*)
----------  --------
59          6
58          7
57          7
56          7
55          7
```



###  15.  ArtistId, Name, 각 Artist가 낸 tracks의 수 출력, 트랙 수 기준 내림차순, 10개

```sqlite
SELECT A.ArtistId, A.Name, COUNT(*) Tracks
FROM artists A
JOIN albums B ON A.ArtistId = B.ArtistId
Join Tracks T ON B.AlbumId = T.AlbumId
GROUP BY A.ArtistId
ORDER BY Tracks DESC
LIMIT 10;
```

```sqlite
ArtistId  Name             Tracks
--------  ---------------  ------
90        Iron Maiden      213
150       U2               135
22        Led Zeppelin     114
50        Metallica        112
58        Deep Purple      92
149       Lost             92
118       Pearl Jam        67
100       Lenny Kravitz    57
21        Various Artists  56
156       The Office       53
```



### 16. 각 나라Country 별 고객의 수를 내림차순으로 출력하세요. LIMIT 5

```sqlite
SELECT Country, COUNT(*) "고객 수" FROM customers
GROUP BY Country
Order by "고객 수" DESC
LIMIT 5;
```

```sqlite
Country  고객 수
-------  ----
USA      13
Canada   8
France   5
Brazil   5
Germany  4
```



### 17. 각 나라County 별 주문 건수를 건수 기준으로 내림차순으로 출력하세요. LIMIT 10

```sqlite
```

```sqlite
```



### 17-1. 각 나라 County 별 주문한 물건 개수를 개수 기준으로 내림차순으로 출력하세요. LIMIT 10

```sqlite
```

```sqlite
```



### 18. 2010년에 주문한 각 나라 Country 별 주문 건수를 건수를 기준으로 내림차순으로 출력하세요. LIMIT 10

```sqlite
```

```sqlite
```



### 18-1. 2010년에 주문한 각 나라 Country 별 주문힌 물건 개수를 개수 기준으로 내림차순으로 출력하세요. LIMIT 10

```sqlite
```

```sqlite
```

