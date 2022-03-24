create table membership(
id varchar2(20) primary key,
pw varchar2(100),
addr varchar2(300)
);

alter table membership add session_id varchar2(100) default 'null' not null;
alter table membership add limit_time date;

commit;

select * from membership;

create table membership(
id varchar2(20) primary key,
pw varchar2(100),
addr varchar2(300),
session_id varchar2(100) default 'null' not null,
limit_time date
);