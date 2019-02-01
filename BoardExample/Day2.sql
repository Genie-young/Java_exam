-- < create >  create 테이블명 (속성명 데이터 타입 [not null] [,primary key(기본키_속성명,)][,Unique(대체키)]
-- [,foreign key(속성명) reference 참조테이블 ] [on delede 옵션] [on update 옵션]]
-- [,constraint 제약조건명 제약조건_타입] [check (조건식)]); --제약조건명은 target열_제약조건타입 으로 지정
-- create table member( id varchar2(10), password number(5), name varchar2(30), phone varchar2(20), indate date);

-- < alter table > column을 target으로 한 수정 명령어  
-- alter table member add(email varchar2(30)); -- column 추가 
-- alter table member modify(email number(1)); -- column 수정, 수정은 제약조건이 많아서 어려우니 차라리 새로운 테이블에 복사해서 지우고 다시 테이블을 만들어서 대입! 
-- alter table member drop column email; -- column 삭제

-- <테이블 복사>
-- create table copy as select * from employees;  employees의 모든 column을 가져와서 copy 테이블에 복사 

-- < create constraint- check 구문>  
-- create table member( id varchar2(10) constraint member_id_pk primary key, 
-- password number(5) constraint member_pw_nn NOT NULL, 
-- name varchar2(30), 
-- phone varchar2(20) constraint member_phone_ck check(phone like '010%'), 
-- indate date,
-- email varchar2(30) constraint member_email_ck unique);

--< insert into 클래스명[(속셩명1,... )] values(데이터1, 데이터2...) > 
-- insert into member(id,password,name,email,phone,indate) values('oracle','1111','홍길동','ora@multi.com','010-222-3333',sysdate);
-- insert into member(id,password) values('oracle2','1111');
-- insert into member(id,password,name,email,phone,indate) values('oracle3',1111,null,null,null,sysdate);
-- insert into member(id, email,password) select employee_id, email, manager_id from employees where first_name != 'Steven';
 insert into member values('oracle4','1111','홍길동','ora4@multi.com','070-222-3333',sysdate);
select id, email, password from MEMBER;

-- < sub query > 
-- select (select)
-- create table as select
-- insert into ~ select

-- < delete from 테이블명 where 조건> 튜플 삭제
-- delete from member where id like '1%' or id like '2%'  or id like'3%';
-- delete member where indate = (select indate from member where id='oracle');

-- < update 테이블명 set 변경컬럼명 = 변경값, ... where (select) >
-- update member set phone = '010-9999-0987', name ='이길동' where id ='oracle4';

-- update member set indate = to_char(indate+1, 'yyyy-mm-dd') 
-- where to_char(indate, 'yyyy-mm-dd') = (select to_char(indate, 'yyyy-mm-dd') from MEMBER where phone like '%0987');

-- < 외래키 지정 - 속성 속성타입(크기) constraint 컬럼명 references 가져올 테이블명(가져올 열) -> 속성의 값을 reference한 열의 값으로 범위를 제한함.  
-- 예시 create table member (속성, 속성2, ... , id varchar2(10) constraint member_id references employees(employee_id);  
	
select * from DEPARTMENTS; 









