--drop table team;

--no
select nvl(max(no),0) +1 from team
-- create
insert into team
(no, name, gender, hobby, skills, phone, zipcode, address, address2)
values((select nvl(max(no),0) +1 from team),'박길동','남자','영화','java,JSP','010-1111-2222','12345','서울시 종로구 관철동 젊음의 거리','종로코아빌딩 5층');

--read
select * from team;
where no = 1;


--update
update team
set hobby    = '게임'		   ,
	skills   = 'java,JSP,MVC'  ,
	phone    = '010-0000-0000' ,
	zipcode  = '00000'  	   ,
	address  = '서울시 서초구 '   ,
	address2 = '12345'         
where no = 1;

--delete
delete from team
where no = 1

--list
select no, name, gender, skills, phone, grpno, indent, ansnum, r
from(select no, name, gender, skills, phone, grpno, indent, ansnum, rownum as r
from(select no, name, gender, skills, phone, grpno, indent, ansnum 
	 from team     
	 where name like '%1%'
	 order by grpno desc, ansnum  ) )
where r >=1 and r<=5

                             
	
create table team(
	no 		 number 	   not null, 
	name 	 varchar(30)   not null,
	gender	 varchar(6)	   not null,
	hobby    varchar(300)  not null,
	skills   varchar(300)  not null,
	phone    varchar(30)   not null,
	zipcode  varchar(5),
	address  varchar(800),
	address2 varchar(800),
	primary key(no)
)

alter table team
add(grpno number default 0,
	indent number default 0,
	ansnum number default 0)

	
alter table team	
add(refnum number default 0)

select no, grpno, indent, ansnum, refnum
from team
order by grpno desc, ansnum
	
delete from team;
	





