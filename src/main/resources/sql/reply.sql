create table reply(
id varchar(20),
title varchar(50),
content varchar(300),
write_group number(10),
write_date date default sysdate,
constraint fk_test1 foreign key(write_group) references mvc_board(write_no) on delete cascade,
constraint fk_test2 foreign key(id) references membership(id) on delete cascade
);

-- constraint (제약 조건)

-- write_group

-- 게시글이 있어야 답글 가능 (write_group - mvc_board(write_no)

-- foreign key는 외래키, 참조 무결성 제약 조건 (write_group)
-- references는 참조 (mvc_board(write_no)를 참조)



-- id

-- 아이디가 있어야 답글 가능 (id - membership(id))

-- foreign key는 외래키, 참조 무결성 제약 조건 (id)
-- references는 참조 (membership(id)를 참조)



-- on delete cascade

-- 상위의 있는 값 (부모값, 예 : mvc_board(write_no), membership(id))이 삭제되면 해당 답글도 함께 삭제

-- reply은 mvc_board에 해당하는 write_no를 삭제하면 해당 글에 작성한 답글도 함께 삭제 (write_group)
-- 또는
-- reply은 membership에 해당하는 id가 탈퇴하면 해당 id가 작성한 답글도 함께 삭제