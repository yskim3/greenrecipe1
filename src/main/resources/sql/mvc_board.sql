create table mvc_board(
Write_no number(10) primary key,
Title varchar2(100),
Content varchar2(300),
Savedate date default sysdate,
Hit number(10) default 0,
Image_file_name varchar(100),
Id varchar(20) not null,
constraint fk_test foreign key(id) references membership(id) on delete cascade
);

-- default sysdate
-- 시스템 날짜로 자동적으로 추가



-- foreign key (외래 키) 지정
-- foreign key(id)는 id를 foreign key로 지정
-- mvc_board의 Id를 foreign key로 지정

-- references membership(id)
-- mvc_board의 Id를 membership의 id와 참조하겠음 (연결하겠음)
-- mvc_board의 Id와 membership의 id 연결

-- foreign key 지정하면 무결성 제약 조건 성립 
-- membership에 있는 id만 board에 글작성 가능 (admin은 글작성 불가능)

-- on delete cascade
-- 상위의 있는 값 (부모값, 예 : membership(id))이 삭제되면 해당 글도 함께 삭제
-- mvc_board은 membership에 해당하는 id가 탈퇴하면 해당 id가 작성한 글도 함께 삭제

-- sequence number

create sequence mvc_board_seq;

commit;

select * from mvc_board;