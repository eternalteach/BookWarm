-------------------- create log, loging board --------------------

-- logBoard, logingBoard sequence 생성
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
review_open varchar2(7));

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
alter table orders add constraint fk_pay_no foreign key(pay_no) references pay(pay_no);
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

-- cart_no 시퀀스
create sequence CART_SEQ;
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
CREATE TABLE memo_comment(
memo_cmt_no number(10,0) primary key,
memo_no number(10,0), -- fk 설정하기
user_id varchar2(20) not null,
isbn varchar2(20) not null,
memo_cmt_content varchar(200) not null,
memo_cmt_written_time date default sysdate,
memo_cmt_modify_time date default sysdate,
memo_cmt_like number(10,0) default 0
);
-- book_reply memo_no 외래키 설정
ALTER TABLE memo_comment ADD CONSTRAINTS memo_no FOREIGN KEY(memo_no) REFERENCES memo_board;
------------------------------------------------------------------------------------------


------------------------------ MD추천 (큐레이션) ------------------------------
create sequence curation_seq;

create table curation (
curation_no number(10) primary key,
curation_name varchar2(20) not null,
isbn varchar2(20) not null);

                
                
                
                
                
                
                
                
                
                
-------------------------sample data--------------------------------------------------

-- book 테이블 sample data(지현)
insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('1','책1','작가1','출판사1','3000',50, '/warm/resources/img/isbn_img/book1.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('2','책2','작가2','출판사2','5000',20, '/warm/resources/img/isbn_img/book2.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('3','책3','작가3','출판사3','4500', 25, '/warm/resources/img/isbn_img/book3.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('4','책4','작가4','출판사4','10000',37, '/warm/resources/img/isbn_img/book4.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('5','책5','작가5','출판사5','6500',50, '/warm/resources/img/isbn_img/book5.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('6','책6','작가6','출판사6','7000',23, '/warm/resources/img/isbn_img/book6.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('7','책7','작가7','출판사7','5000',51, '/warm/resources/img/isbn_img/book7.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('8','책8','작가8','출판사8','6900',80, '/warm/resources/img/isbn_img/book8.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('9','책9','작가9','출판사9','8200',44, '/warm/resources/img/isbn_img/book9.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('10','책10','작가10','출판사10','3100',50, '/warm/resources/img/isbn_img/book10.jpg');

commit;

-- user_info 테이블 sample data(지현)
insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('aaa','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user1','유저1',TO_DATE('1994-12-31'),'f', '010-1231-1231', 'aaa@naver.com', 12345, '서울특별시 영등포구 양평동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('bbb','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user2','유저2',TO_DATE('1994-1-3'),'f', '010-1231-1232', 'bbb@naver.com', 12312, '서울특별시 영등포구 양평동2가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('ccc','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user3','유저3',TO_DATE('1994-2-20'),'m', '010-1211-1231', 'ccc@naver.com', 12245, '서울특별시 영등포구 당산동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('ddd','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user4','유저4',TO_DATE('1994-8-3'),'f', '010-1111-1231', 'ddd@naver.com', 11145, '서울특별시 영등포구 문래동5가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('eee','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user5','유저5',TO_DATE('1994-4-5'),'m', '010-1212-1111', 'eee@naver.com', 55555, '서울특별시 영등포구 양평동5가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('fff','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user6','유저6',TO_DATE('1994-2-20'),'m', '010-2222-1231', 'fff@naver.com', 12333, '서울특별시 영등포구 문래동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('ggg','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user7','유저7',TO_DATE('1994-2-24'),'m', '010-2822-1231', 'ggg@naver.com', 15133, '서울특별시 영등포구 영등포동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('hhh','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user8','유저8',TO_DATE('1994-9-27'),'f', '010-2022-1231', 'hhh@naver.com', 12333, '서울특별시 영등포구 문래동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('iii','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user9','유저9',TO_DATE('1994-9-20'),'m', '010-2113-1231', 'iii@naver.com', 15133, '서울특별시 영등포구 영등포동1가');

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR)
values('jjj','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user10','유저10',TO_DATE('1984-9-20'),'m', '010-2183-1231', 'jjj@naver.com', 15133, '서울특별시 영등포구 영등포동1가');

commit;

-- cart 테이블 sample data(지현)
insert into cart
values(CART_SEQ.nextval, 'aaa', '1', 30);

insert into cart
values(CART_SEQ.nextval, 'aaa', '5', 10);

insert into cart
values(CART_SEQ.nextval, 'aaa', '6', 4);

insert into cart
values(CART_SEQ.nextval, 'aaa', '4', 2);

insert into cart
values(CART_SEQ.nextval, 'bbb', '2', 7);

insert into cart
values(CART_SEQ.nextval, 'bbb', '3', 5);

insert into cart
values(CART_SEQ.nextval, 'ccc', '1', 8);

insert into cart
values(CART_SEQ.nextval, 'ddd', '4', 11);

insert into cart
values(CART_SEQ.nextval, 'ddd', '5', 3);

insert into cart
values(CART_SEQ.nextval, 'ddd', '6', 2);

commit;
                
