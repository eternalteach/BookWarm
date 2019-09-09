-------------------- create log, loging board --------------------

-- logBoard, logingBoard sequence 생성
create sequence seq_logBoard;
create sequence seq_logingBoard;


-- logingBoard 보드 생성(기범)
create table loging_board(
isbn varchar2(20) not null,
write_no number(10,0) PRIMARY key,
start_page number(10,0) default 1 not null,
end_page number(10,0) not null,
start_date date default sysdate,
end_date varchar2(10) default 'false');

--독서감상테이블 감상번호 시퀀스
create sequence review_board_seq;
--독서감상 테이블 (김해랑)
create table review_board(
review_no  NUMBER (10,0) primary key,
user_id VARCHAR2(20) not null,
review_written_date date default sysdate,
review_modify_date date default sysdate,
isbn varchar2(20) not null,
review_ref number(10,0),
review_title varchar2(200) not null,
review_content varchar2(2000) not null,
review_open varchar2(1) default 'N');

----댓글
create sequence review_comment_seq;
--
----댓글 테이블 (김해랑)(9/5 review_reply -> review_comment로 수정)
create table review_comment(
    review_cmt_no number(10,0),
    review_no number(10,0) not null,
    user_id varchar2(20) not null,
    review_cmt_content varchar2(200) not null,
    review_cmt_written_date date default sysdate,
    review_cmt_modified_date date default sysdate,
    CONSTRAINT pk_review_comment primary key (review_cmt_no)
);
create index idx_comment on review_comment(review_no desc, review_cmt_no asc);

--파일첨부(김해랑)
create table review_attach(
    uuid varchar2(100),
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    review_no number(10,0)
);

alter table review_attach add constraint pk_attach primary key(uuid);
alter table review_attach add constraint fk_review_attach foreign key(review_no) references review_board(review_no);


--해쉬태그 시퀀스
create sequence hashtag_seq;
--해쉬태그 테이블 (김해랑 사용 예정 - 보류)
create table hashtag(
review_no number(10,0),
tag_name varchar2(50) not null
);

------------------------------------------------------------

-------------------- create community board --------------------
--community board (박기범) (9/6 컬럼 크기, pk이름 수정)
create table community_board(
comm_no NUMBER(10,0),
user_id VARCHAR2(20) not null,
comm_subject varchar2(30),
comm_title VARCHAR2(200) not null,
comm_content VARCHAR2(2000) not null,
comm_written_time DATE DEFAULT SYSDATE,
comm_modify_time DATE DEFAULT SYSDATE,
comm_clicked NUMBER(10,0) DEFAULT 0,
comm_group NUMBER(10,0),
comm_step NUMBER(10,0),
comm_indent NUMBER(10,0)
);

-- pk설정, comm의 pk를 comm_pk_board로 설정
ALTER TABLE community_board ADD CONSTRAINT comm_pk_board primary KEY(comm_no);

--comunity board sequence
create sequence community_board_seq;
create sequence community_board_comment_seq;

-- community_board_comment table (박기범)
create table community_board_comment(
comm_no number(10,0),
comm_cmt_no NUMBER(10,0),
user_id VARCHAR2(20) not null,
comm_cmt_content VARCHAR2(2000) not null,
comm_cmt_written_time DATE DEFAULT SYSDATE,
comm_cmt_modify_time DATE DEFAULT SYSDATE,
comm_cmt_deleted char(1) default 'n',
comm_cmt_group NUMBER(10,0),
comm_cmt_step NUMBER(10,0),
comm_cmt_indent NUMBER(10,0));

-- community Board Comment Index
create index idx_comm_cmt on community_board_comment (comm_no desc, comm_cmt_no asc);
--comm_no fk설정
ALTER TABLE community_board_comment ADD CONSTRAINTS comm_no FOREIGN KEY(comm_no) REFERENCES community_board;
-- community_board_comment pk설정 및 이름 설정
ALTER TABLE community_board_comment ADD CONSTRAINT comm_cmt_pk_board primary KEY(comm_cmt_no);
                       ---------------------------------------

-------------------- book --------------------

--book
create table book(
isbn varchar2(20) primary key,
book_title varchar2(200) not null,
writer_name varchar2(100)  not null,
translator_name varchar2(100),
publisher_name varchar2(100) not null,
book_tot_page number(10,0) default 1000,
book_published_date DATE,
book_price number(10,0),
book_price_for_sale number(10,0),
book_stock number(10,0) not null,
book_intro varchar2(500),
book_idx varchar2(500),
book_story varchar2(500),
book_img varchar2(100)
);
---------------------------------------------


--------------- 책속 한줄 글귀 ---------------
create table book_clause(
isbn varchar2(20) not null,
clause varchar2(300) not null
);
---------------------------------------------


--------------- user ---------------(임지현)
create table user_info(
user_id varchar2(20) primary key,
user_pw varchar2(64) not null,
user_nickname varchar2(20) not null,
user_name varchar2(20) not null,
user_bday date not null,
user_sex char(1) not null,
user_phone varchar2(20) not null,
user_mail varchar2(50) not null,
user_zipcode number(10,0) not null,
user_addr varchar2(100) not null,
user_addr_detail varchar2(100),
user_join_date date default sysdate,
user_level varchar2(10) default 'egg',
user_tot_price number(15,0),
user_point number(10,0)
);

--친구
create table friend(
user_id varchar2(20) not null,
friend_id varchar2(20) not null);

--메시지 기능
create sequence msg_seq;
create table msg_table(
msg_no number(10,0) primary key,
msg_send_id varchar2(20) not null,
msg_get_id varchar2(20) not null,
msg_title varchar2(200) not null,
msg_content varchar2(2000) not null,
msg_send_time date default sysdate,
msg_read_time date default sysdate
);

--내 서재
create table library(
user_id varchar2(20) not null,
list_no number(10,0) default 1,
list_img_src varchar2(100),
list_type varchar2(10) default 'basic',
isbn varchar2(20) not null,
list_added_date date default sysdate
);

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
coupon_no varchar2(15) not null,
user_id varchar2(20) not null,
coupon_available char(1) default 'y'
);

--주문
create sequence orders_seq;
create table orders(
orders_no varchar2(20) primary key,
user_id varchar2(20) not null,
orders_date date not null,
isbn varchar2(20) not null,
orders_cnt number(10,0) not null,
orders_tot number(10,0) not null,
orders_start_date date not null,
orders_pay_date date not null,
coupon_no varchar2(20),
post_no varchar2(20),
pay_no varchar2(20));

alter table orders add constraint fk_pay_no foreign key(pay_no)
    references pay(pay_no);


--주문내역
create table ordersview(
orders_no varchar2(20) primary key,
user_id varchar2(20) not null,
orders_status varchar2(10)
);


--결제
create table pay(
pay_no varchar2(20) primary key,
pay_way varchar2(20) not null,
pay_total number(10,0) not null,
pay_refund_account varchar2(50) not null
);

--------------- cart ---------------(임지현)
create table cart(
cart_no number(20) primary key,
user_id varchar2(20) not null, -- fk 설정하기
isbn varchar2(20) not null, --fk설정하기
cart_cnt number(20)
);

alter table cart add constraint fk_user_id foreign key(user_id)
    references user_info(user_id);

alter table cart add constraint fk_isbn foreign key(isbn)
    references book(isbn);

---------------------------------------------

--------------- 책으로 답하는 메모보드 ---------------
-- 메모보드 시퀀스 생성
create sequence memo_board_seq;
create sequence book_reply_seq;

CREATE TABLE memo_board(
memo_no number(10,0) primary key,
user_id varchar2(20) not null,
memo_content_b varchar(2000) not null,
memo_written_time date default sysdate,
memo_modify_time date default sysdate
);

--메모보드 책 댓글
CREATE TABLE book_reply(
book_cmt_no number(10,0) primary key,
memo_no number(10,0), -- fk 설정하기
user_id varchar2(20) not null,
isbn varchar2(20) not null,
book_cmt_content varchar(200) not null,
book_cmt_written_time date default sysdate,
book_cmt_modify_time date default sysdate,
book_cmt_like number(10,0) default 0
);
-- book_reply memo_no 외래키 설정
ALTER TABLE book_reply ADD CONSTRAINTS memo_no FOREIGN KEY(memo_no) REFERENCES memo_board;
------------------------------------------------------------------------------------------


------------------------------ MD추천 (큐레이션) ------------------------------
create sequence curation_seq;

create table curation (
curation_no number(10) primary key,
curation_name varchar2(20) not null,
isbn varchar2(20) not null);

---------------------------------------------------------------------------


