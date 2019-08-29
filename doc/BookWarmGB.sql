-- logBoard, logingBoard sequence 생성
create sequence seq_logBoard;
create sequence seq_logingBoard;


-- logBoard 보드 생성
create table log_board(
write_no number(10,0) PRIMARY key,
user_id varchar2(50) not null,
write_written_date date default sysdate,
ISBN VARCHAR2(1000) not null,
write_buy_date date not null,
read_amount number(4,0),
read_stop number(10,0),
read_star number(1,0)
);

-- logingBoard 보드 생성
create table loging_board(
ISBN varchar2(1000),
write_no number(10,0),
start_page number(4,0) default 1 not null,
end_page number(4,0) not null,
start_date date not null,
end_date date not null);

-- loging 의 writeNo 는 log의 writeNo를 참조한다.
alter table loging_board add constraint fk_log_board foreign key (write_no) REFERENCES log_board (write_no);

--comunity board
create table community_board(
comm_no NUMBER(4) PRIMARY KEY,
user_id VARCHAR2(20),
comm_subject varchar2(20),
comm_title VARCHAR2(100),
comm_content VARCHAR2(3000),
comm_written_time DATE DEFAULT SYSDATE,
comm_clicked NUMBER(4) DEFAULT 0,
comm_group NUMBER(4),
comm_step NUMBER(4),
comm_indent NUMBER(4)
);

--book ISBNimg
create table ISBN_img(
ISBN varchar2(1000),
img_src VARCHAR2(1000)
);






-- sample date (log board, loging board)
insert into log_board (write_no,user_id,ISBN,write_buy_date)values(seq_logBoard.nextval, 'user00', 'isbn001', sysdate);
insert into loging_board (isbn,write_no, start_date, start_page, end_date,end_page) values('isbn001',21, sysdate, 70, sysdate,500);

select * from log_board;
select * from loging_board;

--테스트
select * from loging_board where write_no=2;



--comunity board sequence
create sequence community_board_seq;


--comunity board sample data
insert into community_board (comm_no, user_id, comm_subject, comm_title, comm_content, comm_clicked, comm_group,comm_step,comm_indent)
VALUES (community_board_seq.nextval, 'userID02', 'comm_sbject', 'comm_title', 'comm_content' ,0, community_board_seq.currval, 0, 0);

-- community board select test
select * from community_board;

-- community board get list test
select * from community_board order by comm_no desc;

select * from community_board;
-- community board modify test
update community_board SET comm_title = 'modify', comm_content='수정된 내용1' where comm_no=22;
-- community board delete test
delete community_board where comm_no=5;

--ISBNimg data
insert into isbn_img (isbn,img_src)VALUES ('isbn001','resources/img/ISBNimg/book001.jpg');
insert into isbn_img (isbn,img_src)VALUES ('isbn001','resources/img/ISBNimg/book002.jpg');
insert into isbn_img (isbn,img_src)VALUES ('isbn001','resources/img/ISBNimg/book003.jpg');

select * from isbn_img;
-- getBookImg Test (첫 이미지 가지고오기)
select * from (select * from isbn_img where isbn='isbn001') where rownum=1;
delete isbn_img where isbn='isbn001';