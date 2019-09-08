-------------------- create log, loging board --------------------

-- logBoard, logingBoard sequence 생성
create sequence seq_logBoard;
create sequence seq_logingBoard;

-- logBoard 보드 생성
create table log_board(
write_no number(10,0) PRIMARY key,
user_id varchar2(50) not null,
write_written_date date default sysdate,
isbn VARCHAR2(20) not null,
write_buy_date date ,
read_amount number(10,0),
read_stop number(10,0),
read_star number(1,0)
);

-- logingBoard 보드 생성(기범)
create table loging_board(
isbn varchar2(20),
write_no number(10,0) PRIMARY key,
start_page number(4,0) default 1 not null,
end_page number(4,0) not null,
start_date date default sysdate,
end_date varchar2(10) default 'false');

--독서감상테이블 감상번호 시퀀스
create sequence review_board_seq;
--독서감상 테이블 (김해랑)
create table review_board(
review_no  NUMBER (10,0) primary key,
user_id VARCHAR2(20),
review_written_date date default sysdate,
review_modify_date date default sysdate,
isbn varchar2(20),
review_ref number(4,0),
review_title varchar2(200),
review_content varchar2(2000),
review_open varchar2(1) default 'N');

----댓글
create sequence review_comment_seq;
--
----댓글 테이블 (김해랑)(9/5 review_reply -> review_comment로 수정)
create table review_comment(
    review_cmt_no number(10),
    review_no number(10),
    user_id varchar2(20),
    review_cmt_content varchar2(500),
    review_cmt_written_date date,
    review_cmt_modified_date date,
    CONSTRAINT pk_review_comment primary key (review_cmt_no)
);
--파일업로드도 보류..

--해쉬태그 시퀀스
create sequence hashtag_seq;
--해쉬태그 테이블 (김해랑 사용 예정)
create table hashtag(
review_no number(10,0),
tag_name varchar2(50) not null
);



------------------------------------------------------------

-------------------- create community board --------------------
--community board (박기범) (9/6 컬럼 크기, pk이름 수정)
create table community_board(
comm_no NUMBER(10),
user_id VARCHAR2(20),
comm_subject varchar2(30),
comm_title VARCHAR2(200),
comm_content VARCHAR2(3000),
comm_written_time DATE DEFAULT SYSDATE,
comm_modify_time DATE DEFAULT SYSDATE,
comm_clicked NUMBER(10) DEFAULT 0,
comm_group NUMBER(10),
comm_step NUMBER(4),
comm_indent NUMBER(4)
);

-- pk설정, comm의 pk를 comm_pk_board로 설정
ALTER TABLE community_board ADD CONSTRAINT comm_pk_board primary KEY(comm_no);

--comunity board sequence
create sequence community_board_seq;
create sequence community_board_comment_seq;

-- community_board_comment table (박기범)
create table community_board_comment(
comm_no number(10),
comm_cmt_no NUMBER(10),
user_id VARCHAR2(20),
comm_cmt_content VARCHAR2(3000),
comm_cmt_written_time DATE DEFAULT SYSDATE,
comm_cmt_modify_time DATE DEFAULT SYSDATE,
comm_cmt_deleted char(1) default 'n',
comm_cmt_group NUMBER(10),
comm_cmt_step NUMBER(4),
comm_cmt_indent NUMBER(4));

-- community Board Comment Index
create index idx_comm_cmt on community_board_comment (comm_no desc, comm_cmt_no asc);
--comm_no fk설정
ALTER TABLE community_board_comment ADD CONSTRAINTS comm_no FOREIGN KEY(comm_no) REFERENCES community_board;
-- community_board_comment pk설정 및 이름 설정
ALTER TABLE community_board_comment ADD CONSTRAINT comm_cmt_pk_board primary KEY(comm_cmt_no);
                       ---------------------------------------

-------------------- book --------------------
--book ISBNimg
create table book_cover(
isbn varchar2(20),
img_src VARCHAR2(1000)
);

--book
create table book(
isbn varchar2(20) primary key,
book_title varchar2(50) not null,
writer_no number(20) ,
translator_no number(20),
publisher_no number(20),
book_tot_page number(5) ,
book_published_date DATE,
book_price number(7) not null,
book_price_for_sale number(7),
book_stock number(10) not null,
book_intro varchar2(500),
book_idx varchar2(500),
book_story varchar2(500),
book_img varchar2(100)
);
---------------------------------------------

--------------- 작가 ---------------
create table writer(
    writer_no number(10,0), 
    writer_name varchar(50),
    writer_info varchar(50)
    );
---------------------------------------------
--------------- 역자 ---------------
create table translator(
translator_no number(20) primary Key,
translator_name varchar2(20) not null,
translator_info varchar2(200)
);
---------------------------------------------
--------------- 출판사 ---------------
create sequence publisher_seq;
create table publisher(
    publisher_no number(20,0) primary key,
    publisher_name varchar(50) not null,
    publisher_phone number(20,0),
    publisher_addr varchar(50) 
);

---------------------------------------------



--------------- 카테고리 ---------------
create table category (
isbn varchar2(20) not null,
genre varchar2(20) not null
);
---------------------------------------------
--------------- 책속 한줄 글귀 ---------------
create table book_clause(
isbn varchar2(20) not null,
clause varchar2(300) not null
);
---------------------------------------------

--결제
create table pay(
pay_no varchar2(20) primary key,
pay_way varchar2(20) not null,
pay_total number(10,0) not null,
pay_refund_account varchar2(50) not null
);

--------------- cart ---------------
create table cart(
cart_no number(20) primary key,
user_id varchar2(20), -- fk 설정하기
isbn varchar2(20), --fk설정하기
);
/////////////////////////////////////////////////////cart_cnt number(20)컬럼 제거
---------------------------------------------

--------------- user ---------------(임지현)
create table user_info(
user_id varchar2(20) primary key,
user_pw varchar2(64) not null,
user_nickname varchar2(20),
user_name varchar2(20),
user_bday date,
user_sex char(1),
user_phone varchar2(20),
user_mail varchar2(50),
user_zipcode number(10,0),
user_addr varchar2(100),
user_addr_detail varchar2(100),
user_join_date date,
user_level varchar2(10),
user_tot_price number(30,0),
user_point number(20,0)
);

--친구
create table friend(
userid varchar2(20),
friend_id varchar2(20));

--메시지 기능
create sequence msg_seq;
create table msg_table(
msg_no number(20,0),
msg_send_id varchar2(20),
msg_get_id varchar2(20),
msg_title varchar2(20),
msg_content varchar2(500),
msg_send_time date default sysdate,
msg_read_time date default sysdate
);

--내 서재
create table library(
userid varchar2(20),
list_no number(20,0)
list_type varchar2(10),
isbn varchar2(20),
list_added_date date default sysdate
);


--회원등급 (이건 왜 필요하지?)
create table user_level(
user_level varchar2(10) not null,
level_qualification(100) not null);

--쿠폰
create table coupon(
coupon_no varchar2(15) primary key,
coupon_name varchar2(20) not null,
coupon_req varchar2(100),
coupon_use_req varchar2(100),
coupon_discount_percent number(10,0),
coupon_discount_price number(10,0),
coupon_validate date not null
);

--보유 쿠폰
create table coupon_no(
coupon_no varchar2(15),
userid varchar2(20),
coupon_available char(1) default 'y'
);

--주문
create sequence order_seq;
create table order(
order_no varchar2(20) primary key,
userid varchar2(20) not null,
order_date date not null,
isbn varchar2(20),
order_cnt number(10,0) not null,
order_tot number(10,0) not null,
order_start_date date,
order_pay_date date,
coupon_no varchar2(20),
post_no varchar2(20),
pay_no varchar2(20));


--주문내역
create table orderview(
order_no varchar2(20) primary key,
userid varchar2(20),
order_status varchar2(10)
);


--------------- 책으로 답하는 메모보드 ---------------
-- 메모보드 시퀀스 생성
create sequence memo_board_seq;
create sequence book_reply_seq;

CREATE TABLE memo_board(
memo_no number(20) primary key,
user_id varchar2(20),
memo_title_b varchar2(100),
memo_content_b varchar(3000),
memo_written_time date default sysdate,
memo_modify_time date default sysdate
);

--메모보드 책 댓글
CREATE TABLE book_reply(
book_re_no number(20) primary key,
memo_no number(20), -- fk 설정하기
user_id varchar2(20),
isbn varchar2(20),
book_re_content varchar(500),
book_re_written_time date default sysdate,
book_re_modify_time date default sysdate,
book_re_like number(10) default 0
);
-- book_reply memo_no 외래키 설정
ALTER TABLE book_reply ADD CONSTRAINTS memo_no FOREIGN KEY(memo_no) REFERENCES memo_board;
------------------------------------------------------------------------------------------







------------------------------ MD추천 (큐레이션) ------------------------------
create sequence curation_seq;

create table curation (
curation_no number(10) primary key,
curation_name varchar2(20) not null,
isbn varchar2(20));

---------------------------------------------------------------------------








