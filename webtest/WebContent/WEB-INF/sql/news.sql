DROP TABLE news;
 
CREATE TABLE news(
  newsno INT          NOT NULL,
  title  VARCHAR(100) NOT NULL,
  media  VARCHAR(50)  NOT NULL,
  author VARCHAR(30)  NOT NULL,
  rdate  DATE         NOT NULL,
  PRIMARY KEY(newsno)
);

-- MySQL 가능      
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, "MS, 2016년 구형 'IE' 브라우저 지원 중단", 'ZDNet', '가길동', sysdate);
 
-- MySQL 가능
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 \'IE\' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
-- Oracle, single quotation의 추가
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;


-----------------------------------------------------------------------------

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"', '연합뉴스', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;