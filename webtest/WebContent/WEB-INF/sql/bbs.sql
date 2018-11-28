select * from bbs;

create table bbs(
bbsno number(7) not null,
wname varchar(20) not null,
title varchar(100) not null,
content varchar(4000) not null,
passwd varchar(15) not null,
viewcnt number(5) default 0,
wdate date not null,
grpno number(7) default 0,
indent number(2) default 0,
ansnum number(5) default 0,
primary key(bbsno)
);

--부모글 삭제 못하게 하기 위한 컬럼
alter table bbs
add(refnum number default 0)



--upload
alter table bbs
add(filename varchar(30),
	filesize number default 0)
	

select * from BBS
select * from bbs where wname='왕눈이'



--<create>

--MAX(bbsno): bbsno 컬럼에서 최대값을 추출 
-- NVL(): null 값을 0으로 변경 가능함. 
SELECT NVL(MAX(bbsno), 0) as max FROM bbs; 

-- 새로운 번호의 생성   
SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs; 


-- 서브쿼리를 이용한 레코드 추가 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), 
'왕눈이', '제목', '내용', '123', sysdate, (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs));

INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), 
'왕눈이', '제목', '내용', '123', sysdate);

select * from bbs ORDER BY bbsno DESC;

--<list>
SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum, r
from(SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum, rownum as r
from(SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum 
FROM bbs  
ORDER BY bbsno DESC))
where r>=1 and r<=5;

--<조회수 증가>
UPDATE bbs 
SET viewcnt = viewcnt + 1 
WHERE bbsno=1; 

 
--<1건의 글 보기(R:Read, PK 사용)>
SELECT bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM bbs  
WHERE bbsno = 1; 

--<update>
UPDATE bbs 
SET wname='왕눈이', title='비오는날', content='개구리 연못' 
WHERE bbsno = 1; 


--<패스워드 검증>
SELECT COUNT(bbsno) as cnt 
FROM bbs 
WHERE bbsno=1 AND passwd='123'; 

-- 1번 레코드만 삭제
DELETE FROM bbs WHERE bbsno=1; 

delete from bbs;

select bbsno, grpno, indent, ansnum, refnum
from bbs
order by grpno desc, ansnum



