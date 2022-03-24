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
-- �ý��� ��¥�� �ڵ������� �߰�



-- foreign key (�ܷ� Ű) ����
-- foreign key(id)�� id�� foreign key�� ����
-- mvc_board�� Id�� foreign key�� ����

-- references membership(id)
-- mvc_board�� Id�� membership�� id�� �����ϰ��� (�����ϰ���)
-- mvc_board�� Id�� membership�� id ����

-- foreign key �����ϸ� ���Ἲ ���� ���� ���� 
-- membership�� �ִ� id�� board�� ���ۼ� ���� (admin�� ���ۼ� �Ұ���)

-- on delete cascade
-- ������ �ִ� �� (�θ�, �� : membership(id))�� �����Ǹ� �ش� �۵� �Բ� ����
-- mvc_board�� membership�� �ش��ϴ� id�� Ż���ϸ� �ش� id�� �ۼ��� �۵� �Բ� ����

-- sequence number

create sequence mvc_board_seq;

commit;

select * from mvc_board;