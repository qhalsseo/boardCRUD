--�Խ��� ���̺�
CREATE TABLE project_board(
    num         number primary key,
    writer      varchar2(20),
    email       varchar2(20),
    subject     varchar2(100),
    password    varchar2(20),
    reg_date    varchar2(20),
    ref         number,
    re_step     number,
    re_level    number,
    readcount   number,
    content     varchar2(500)
);

--������̺�
create table project_member (
    seq number not null,
    id varchar2(20),
    password varchar2(20),
    name varchar2(20),
    email varchar2(50),
    role varchar(20) default 'User'
);


--�������� ���̺�
CREATE TABLE project_notice (
    num         number primary key,
    writer      varchar2(20),
    email       varchar2(20),
    subject     varchar2(100),
    password    varchar2(20),
    reg_date    varchar2(20),
    ref         number,
    re_step     number,
    re_level    number,
    readcount   number,
    content     varchar2(500)
);

commit;

SELECT * FROM  project_board;
SELECT * FROM  project_member;


-- ������ �ֱ� 
insert into project_notice VALUES(1, 'test','1234@n.com','����','1234',sysdate,0,1,1,0,'����');
SELECT * FROM  project_board;
commit;
insert into project_member VALUES(1, 'test','1234','����','1234@n.com','role');
SELECT * FROM  project_member;
commit;

select max(ref) from project_board;
SELECT * FROM  project_board;
commit;

--��ȸ�� ����
update project_board set readcount = (readcount + 1) where num = 2;
select * from project_board;
commit;

--��۴ޱ�

--�۸�� ��������
SELECT * FROM project_board ORDER BY ref desc, re_step asc;
commit;

--�� �󼼺���
UPDATE project_board SET readcount = (select readcount + 1 from project_board where num = 2) where num = 2;
SELECT * FROM project_board where num=2;
commit;
SELECT * FROM project_board ORDER BY ref desc, re_step asc;

--�� ����
select * from project_board;
UPDATE project_board SET subject = '����' , content = '����'  where num = 26;

-- �� ���� 
delete from project_board where num = 26;



--
select * from project_board;
delete project_board where num = 4;
commit;

