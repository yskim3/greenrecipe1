create table reply(
id varchar(20),
title varchar(50),
content varchar(300),
write_group number(10),
write_date date default sysdate,
constraint fk_test1 foreign key(write_group) references mvc_board(write_no) on delete cascade,
constraint fk_test2 foreign key(id) references membership(id) on delete cascade
);

-- constraint (���� ����)

-- write_group

-- �Խñ��� �־�� ��� ���� (write_group - mvc_board(write_no)

-- foreign key�� �ܷ�Ű, ���� ���Ἲ ���� ���� (write_group)
-- references�� ���� (mvc_board(write_no)�� ����)



-- id

-- ���̵� �־�� ��� ���� (id - membership(id))

-- foreign key�� �ܷ�Ű, ���� ���Ἲ ���� ���� (id)
-- references�� ���� (membership(id)�� ����)



-- on delete cascade

-- ������ �ִ� �� (�θ�, �� : mvc_board(write_no), membership(id))�� �����Ǹ� �ش� ��۵� �Բ� ����

-- reply�� mvc_board�� �ش��ϴ� write_no�� �����ϸ� �ش� �ۿ� �ۼ��� ��۵� �Բ� ���� (write_group)
-- �Ǵ�
-- reply�� membership�� �ش��ϴ� id�� Ż���ϸ� �ش� id�� �ۼ��� ��۵� �Բ� ����