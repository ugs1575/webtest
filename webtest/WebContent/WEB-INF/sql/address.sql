drop table address

create table address(
	no 		 number 	   not null, 
	name 	 varchar(20)   not null,
	phone    varchar(30)   not null,
	zipcode  varchar(6),
	address  varchar(1000),
	address2 varchar(1000),
	primary key(no)
)

-- create
insert into address
(no, name, phone, zipcode, address, address2)
values((select nvl(max(no),0) +1 from address),'우경서','010-7115-2222','12345','서울시 종로구 관철동 젊음의 거리','종로코아빌딩 5층');

--read
select * from address;



--update
update address
set phone    = '010-0000-0000' ,
	zipcode  = '00000'  	   ,
	address  = '서울시 서초구 '   ,
	address2 = '12345'         
where no = 1;

--delete
delete from address
where no = 1

--list 
select no, name, phone, zipcode, address, address2, grpno, indent, ansnum, r
from(select no, name, phone, zipcode, address, address2, grpno, indent, ansnum, rownum as r
from(select no, name, phone, zipcode, address, address2, grpno, indent, ansnum
from address
order by no desc))
where r>=1 and r<=5

select * from address

	

alter table address
add(grpno number default 0,
    indent number default 0,
    ansnum number default 0)
    
alter table address
add(refnum number default 0)

alter table address
add(viewcnt number default 0)

select no, grpno, indent, ansnum, refnum
from address 
order by grpno desc, ansnum;

delete grp from address;


insert into address (no, name, phone, zipcode, address, address2, viewcnt, grpno, indent, ansnum, refnum) 
values((select nvl(max(no),0) +1 from address),'name', 'phone', 'zipcode', 'address', 'address2',1,1,1,1,1);


	

