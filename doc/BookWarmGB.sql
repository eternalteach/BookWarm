--------------- user ---------------(임지현)
create table user_info(
user_id varchar2(20),
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
user_level number(1) default '1',
user_tot_price number(15,0),
user_point number(10,0),
constraint pk_user_info primary key(user_id)
);                     
-------------------- book --------------------

create table book(
isbn varchar2(20),
book_title varchar2(200) not null,
writer_name varchar2(100)  not null,
translator_name varchar2(100),
publisher_name varchar2(100) not null,
book_tot_page number(10,0) default 1000,
book_published_date DATE,
book_price number(10,0),
book_price_for_sale number(10,0),
book_stock varchar2(15),
book_story varchar2(1500),
book_img varchar2(500),
constraint pk_book primary key(isbn)
);

--------------- 저자명 --------------- 
create table authors (
isbn varchar2(20) not null,
author varchar2(100) not null,
constraint fk_authors FOREIGN KEY(isbn)
           REFERENCES book(isbn)           
);

--------------- 역자명 --------------- 
create table translators (
isbn varchar2(20) not null,
translator varchar2(100) not null,
constraint fk_translators FOREIGN KEY(isbn)
           REFERENCES book(isbn)           
);

--------------- 책속 한줄 글귀 ---------------
create table book_clause(
isbn varchar2(20) not null,
clause varchar2(300) not null,
constraint fk_book_clause FOREIGN KEY(isbn)
           REFERENCES book(isbn)
);

------------------내 서재------------------------------------

create table library(
user_id varchar2(20) not null,
list_no number(10,0) default 1,
list_img_src varchar2(100),
list_type varchar2(10) default 'basic',
isbn varchar2(20) not null,
list_added_date date default sysdate,
constraint fk_library FOREIGN KEY(user_id)
           REFERENCES user_info(user_id)
);

-------------------- create log, loging board --------------------

-- logBoard, logingBoard sequence 생성
create sequence seq_logingBoard;

-- logingBoard 보드 생성(기범)
create table loging_board(
isbn varchar2(20) not null,
user_id VARCHAR2(20) not null,
write_no number(10,0),
start_page number(10,0) default 1 not null,
end_page number(10,0) not null,
start_date date default sysdate,
end_date varchar2(10) default 'false',
constraint pk_loging_board primary key(write_no),
constraint fk_loging_board FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);

create table book_star (
isbn varchar2(20) not null,
user_id VARCHAR2(20) not null,
star number(2,0) not null,
constraint fk_book_star_isbn FOREIGN KEY(isbn)
                REFERENCES book(isbn),
constraint fk_book_star_user_id FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);


--독서감상테이블 감상번호 시퀀스
create sequence review_board_seq;

--독서감상 테이블 (김해랑)
create table review_board(
review_no  NUMBER (10,0),
user_id VARCHAR2(20) not null,
review_written_date date default sysdate,
review_modify_date date default sysdate,
isbn varchar2(20) not null,
review_ref number(10,0),
review_title varchar2(200) not null,
review_content varchar2(2000) not null,
review_open varchar2(7),
constraint pk_review_board primary key(review_no),
constraint fk_review_board FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);

----댓글
create sequence review_comment_seq;

----댓글 테이블 (김해랑)(9/5 review_reply -> review_comment로 수정)
create table review_comment(
    review_cmt_no number(10,0),
    review_no number(10,0) not null,
    user_id varchar2(20) not null,
    review_cmt_content varchar2(200) not null,
    review_cmt_written_date date default sysdate,
    review_cmt_modified_date date default sysdate,
    CONSTRAINT pk_review_comment primary key (review_cmt_no),
    constraint fk_review_comment FOREIGN KEY(review_no)
               REFERENCES review_board(review_no)
);
create index idx_review_comment on review_comment(review_no desc, review_cmt_no asc);


--파일첨부(김해랑)
create table review_attach(
    uuid varchar2(100),
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    review_no number(10,0) not null,
    constraint pk_review_attach primary key(uuid),
    constraint fk_review_attach FOREIGN KEY(review_no)
               REFERENCES review_board(review_no)
);


--해쉬태그 시퀀스
create sequence hashtag_seq;

--해쉬태그 테이블 (김해랑 사용 예정 - 보류)
create table hashtag(
review_no number(10,0) not null,
tag_name varchar2(50) not null,
constraint fk_hashtag FOREIGN KEY(review_no)
           REFERENCES review_board(review_no)
);


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
comm_indent NUMBER(10,0),
constraint pk_community_board primary key(comm_no)
);

--comunity board sequence
create sequence community_board_seq;
create sequence community_board_comment_seq;

-- community_board_comment table (박기범)
create table community_board_comment(
comm_no number(10,0) not null,
comm_cmt_no NUMBER(10,0),
user_id VARCHAR2(20) not null,
comm_cmt_content VARCHAR2(2000) not null,
comm_cmt_written_time DATE DEFAULT SYSDATE,
comm_cmt_modify_time DATE DEFAULT SYSDATE,
comm_cmt_deleted char(1) default 'n',
comm_cmt_group NUMBER(10,0),
comm_cmt_step NUMBER(10,0),
comm_cmt_indent NUMBER(10,0),
constraint pk_community_board_comment primary key(comm_cmt_no),
constraint fk_community_board_comment FOREIGN KEY(comm_no)
           REFERENCES community_board(comm_no)
);

-- community Board Comment Index
create index idx_comm_cmt on community_board_comment (comm_no desc, comm_cmt_no asc);
 
---------------------------------------------------------------

--친구
create table friend(
user_id varchar2(20) not null,
friend_id varchar2(20) not null,
constraint fk_friend_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id),
constraint fk_friend_friend_id FOREIGN KEY(friend_id)
           REFERENCES user_info(user_id)
);


--메시지 기능
create sequence msg_seq;

create table msg_table(
msg_no number(10,0),
msg_send_id varchar2(20) not null,
msg_get_id varchar2(20) not null,
msg_title varchar2(200) not null,
msg_content varchar2(2000) not null,
msg_send_time date default sysdate,
msg_read_time date default sysdate,
constraint pk_msg_table primary key(msg_no),
constraint fk_msg_table_send_id FOREIGN KEY(msg_send_id)
           REFERENCES user_info(user_id),
constraint fk_msg_table_get_id FOREIGN KEY(msg_get_id)
           REFERENCES user_info(user_id)
);


--쿠폰
create table coupon(
coupon_no varchar2(15),
coupon_name varchar2(20) not null,
coupon_req number(1),
coupon_use_req number(6),
coupon_discount_percent number(10,0),
coupon_validate date not null,
constraint pk_coupon primary key(coupon_no)
);


--보유 쿠폰
create table coupon_no(
coupon_no varchar2(15) not null,
user_id varchar2(20) not null,
coupon_available char(1) default 'y',
constraint fk_coupon_no_coupon_no FOREIGN KEY(coupon_no)
           REFERENCES coupon(coupon_no),
constraint fk_coupon_no_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id)
);


--결제
create table pay(
pay_no varchar2(20),
pay_way varchar2(20) not null,
pay_total number(10,0) not null,
pay_refund_account varchar2(50) not null,
constraint pk_pay primary key(pay_no)
);

--주문
create sequence orders_seq;
create table orders(
orders_no varchar2(20),
user_id varchar2(20) not null,
orders_date date not null,
isbn varchar2(20) not null,
orders_cnt number(10,0) not null,
orders_tot number(10,0) not null,
orders_start_date date not null,
orders_pay_date date not null,
coupon_no varchar2(20),
post_no varchar2(20),
pay_no varchar2(20) not null,
orders_status varchar2(10),
constraint pk_orders primary key(orders_no),
constraint fk_orders_pay_no FOREIGN KEY(pay_no)
           REFERENCES pay(pay_no)
);
-- cf. 주문 테이블에 fk가 더 있을 수 있어 fk_테이블명_컬럼명 으로 fk 명명.


--------------- cart ---------------(임지현)

create table cart(
cart_no number(20),
user_id varchar2(20) not null, -- fk 설정하기
isbn varchar2(20) not null, --fk설정하기
cart_cnt number(20),
constraint pk_cart primary key(cart_no),
constraint fk_cart_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id),
constraint fk_cart_isbn FOREIGN KEY(isbn)
           REFERENCES book(isbn)
);

-- cart_no 시퀀스
create sequence CART_SEQ;


--------------- 책으로 답하는 메모보드 ---------------

-- 메모보드 시퀀스 생성
create sequence memo_board_seq;
create sequence book_reply_seq;

CREATE TABLE memo_board(
memo_no number(10,0),
user_id varchar2(20) not null,
memo_content_b varchar(2000) not null,
memo_written_time date default sysdate,
memo_modify_time date default sysdate,
constraint pk_memo_board primary key(memo_no)
);

--메모보드 책 댓글
CREATE TABLE memo_comment(
memo_cmt_no number(10,0),
memo_no number(10,0) not null, -- fk 설정하기
user_id varchar2(20) not null,
isbn varchar2(20) not null,
memo_cmt_content varchar(200) not null,
memo_cmt_written_time date default sysdate,
memo_cmt_modify_time date default sysdate,
memo_cmt_like number(10,0) default 0,
constraint pk_memo_comment primary key(memo_cmt_no),
constraint fk_memo_comment FOREIGN KEY(memo_no)
           REFERENCES memo_board(memo_no)
);


------------------------------ MD추천 (큐레이션) ------------------------------
create sequence curation_seq;

create table curation (
curation_no number(10),
curation_name varchar2(20) not null,
isbn varchar2(20) not null,
constraint pk_curation primary key(curation_no)
);

                
                
                
                
                
                
                
                
                
                
-------------------------sample data--------------------------------------------------

-- user_info 테이블 sample data(지현)

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('aaa','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user1','유저1',TO_DATE('1994-12-31'),'f', '010-1231-1231', 'aaa@naver.com', 12345, '서울특별시 영등포구 양평동1가',0,1000, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('bbb','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user2','유저2',TO_DATE('1994-1-3'),'f', '010-1231-1232', 'bbb@naver.com', 12312, '서울특별시 영등포구 양평동2가',0,500, 2, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ccc','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user3','유저3',TO_DATE('1994-2-20'),'m', '010-1211-1231', 'ccc@naver.com', 12245, '서울특별시 영등포구 당산동1가',0,700, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ddd','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user4','유저4',TO_DATE('1994-8-3'),'f', '010-1111-1231', 'ddd@naver.com', 11145, '서울특별시 영등포구 문래동5가',0,20000, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('eee','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user5','유저5',TO_DATE('1994-4-5'),'m', '010-1212-1111', 'eee@naver.com', 55555, '서울특별시 영등포구 양평동5가',0,2000, 3, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('fff','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user6','유저6',TO_DATE('1994-2-20'),'m', '010-2222-1231', 'fff@naver.com', 12333, '서울특별시 영등포구 문래동1가',0,500, 2, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ggg','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user7','유저7',TO_DATE('1994-2-24'),'m', '010-2822-1231', 'ggg@naver.com', 15133, '서울특별시 영등포구 영등포동1가',0,1000, 3, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('hhh','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user8','유저8',TO_DATE('1994-9-27'),'f', '010-2022-1231', 'hhh@naver.com', 12333, '서울특별시 영등포구 문래동1가',0,0, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('iii','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user9','유저9',TO_DATE('1994-9-20'),'m', '010-2113-1231', 'iii@naver.com', 15133, '서울특별시 영등포구 영등포동1가',0,0, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('jjj','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user10','유저10',TO_DATE('1984-9-20'),'m', '010-2183-1231', 'jjj@naver.com', 15133, '서울특별시 영등포구 영등포동1가',0,0, 1, sysdate);

commit;

                                                          
                                                          
-- community_board sample_Data
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', '말머리','말랑말랑','해랑해랑',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', '창의력제로','커피가땡기는아침','달달한 자바칩이필요해',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', '라이언이보고있다','누가누가 늦게오나','경운씨가  먼저왔네',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '아프지마요','아프면 병원가야지','푹 쉬고 나오셔요',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '정상적인','샘플 데이터 입력','이 글은 정상적인가?',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '귀찮다','나한테 왜그래','목이너무아프잖아',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '양경운','메롱>ㅜ<','크하하하하하',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '페이징처리','할때마다보이게','게시글은 10개로끊자',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '임지현','바아아아보','푸헬헬헬헬',sysdate,sysdate,0,0,0,0);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);

--community_board_comment Sample_Data
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '댓글내용',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '감사합니다',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '나는요',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '오빠가',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '좋은걸',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '어떻게',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '좋은날',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '아이유',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '와 귀찮다',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '댓글 언제 각 게시글마다 다 달지?',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);

