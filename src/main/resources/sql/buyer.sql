drop table buyer;

create table buyer ( -- 사용자에 대한 DB
  buyer_num number(3), --  고유번호
  buyer_id varchar2(20), 
  buyer_email varchar2(50),
  buyer_password varchar2(100), -- 50 -> 100 수정
  buyer_name varchar2(20), 
  buyer_code VARCHAR2(50), 
  buyer_addr  varchar2(150),
  buyer_phone varchar2(50),
  buyer_grade varchar2(10),
  buyer_hash varchar2(100),
  buyer_cart varchar2(100),
  buyer_point number(30),
  buyer_coupon varchar2(100)
);

insert into buyer values
(1, 'userid', 'user@email.com', '1234', 'uname', 'abcd', 'seoul', 
'010-1234-5678', '새싹', '1', '1', 1000, '1', 'nan', '2022/03/24');

insert into buyer values
(2, 'a', 'a@email.com', '1', 'aaa', 'abcd', 'seoul', 
'010-1111-2222', '새싹', '1', '1', 1000, '1', 'nan', '2022/03/24');

CREATE SEQUENCE buyer_seq START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

alter table buyer add buyer_session_id varchar2(100) default 'null' not null;
alter table buyer add buyer_limit_time date;

select * from buyer;

commit;