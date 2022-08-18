-- SQLite

CREATE TABLE articles(
    title TEXT,
    content TEXT
);

INSERT INTO articles VALUES('1번제목', '1번내용');

ALTER TABLE articles
RENAME TO arti;

ALTER TABLE arti
ADD COLUMN date;

ALTER TABLE arti
RENAME COLUMN date TO created_at;