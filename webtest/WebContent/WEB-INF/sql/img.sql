select * from gallery;

create table gallery(
	gno	 	number			not null,
	title	varchar(50)		not null,
	udate	date	 		not null,
	writer	varchar(20)		not null,
	content	varchar(3000)	not null,
	viewcnt	number			default 0,
	fname	varchar(50)		default 'gallery.jpg',
	pw		varchar(15)		not null,
	primary key(gno)
)

--list
select gno,title,udate,writer,viewcnt,fname,r
from(select gno,title,udate,writer,viewcnt,fname,rownum as r
from(select gno,title,udate,writer,viewcnt,fname
from gallery
where writer like '%홍%'
ORDER BY udate DESC 
))where r >= 1 and r <= 5


--list for test
select gno,title,udate,writer,content,pw
from gallery

--insert
insert into GALLERY(gno,title,udate,writer,content,pw)
values((SELECT NVL(MAX(gno), 0) + 1 as gno FROM gallery),'title1',sysdate,'writer1','content1','pw1');

insert into GALLERY(gno,title,udate,writer,content,pw)
values((SELECT NVL(MAX(gno), 0) + 1 as gno FROM gallery),'title2',sysdate,'writer2','content2','pw2');

insert into GALLERY(gno,title,udate,writer,content,pw)
values((SELECT NVL(MAX(gno), 0) + 1 as gno FROM gallery),'title3',sysdate,'writer3','content3','pw3');

insert into GALLERY(gno,title,udate,writer,content,pw)
values((SELECT NVL(MAX(gno), 0) + 1 as gno FROM gallery),'new title',sysdate,'new writer','new content','new');
