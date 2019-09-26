

-- 권한 테이블
create table authorities (
    user_id varchar2(20) not null,
    authority varchar2(50) not null,
    constraint fk_authorities foreign key(user_id) references user_info(user_id)
);
create unique index idx_auth on authorities(user_id, authority);

-- 자동로그인을 위한 테이블
create table persistent_logins (
    username varchar2(20) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

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
enabled char(1) default '1',
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
list_img_src varchar2(500),
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
comm_like NUMBER(10,0) DEFAULT 0,
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
comm_cmt_clicked NUMBER(10,0) DEFAULT 0,
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

--배송지
create sequence post_seq;
create table post(
    post_no varchar2(20),
    user_id varchar2(20) not null,
    post_name varchar2(20) not null,
    post_phone varchar2(20) not null,
    post_zipcode number(10,0) not null,
    post_addr varchar2(100) not null,
    post_addr_detail varchar2(100),
    constraint pk_post primary key(post_no),
    constraint fk_post_user_info FOREIGN KEY(user_id)
               REFERENCES user_info(user_id)
);

--결제
create sequence orders_seq;
create table orders(
    orders_no varchar2(20),
    orders_payment varchar2(20) not null,
    orders_total number(10,0) not null,
    refund_account varchar2(50) not null,
    refund_bank varchar2(10) not null,
    orders_date date not null,
    orders_pay_date date,
    coupon_no varchar2(20),
    post_no varchar2(20),
    constraint pk_pay primary key(orders_no),
    constraint fk_orders_coupon_no FOREIGN KEY(coupon_no)
               REFERENCES coupon(coupon_no),
    constraint fk_orders_post_no FOREIGN KEY(post_no)
               REFERENCES post(post_no)
);


--주문
create sequence orders_item_seq;
create table orders_item(
    item_no varchar2(20),
    user_id varchar2(20) not null,
    isbn varchar2(20) not null,
    item_cnt number(10,0) not null,
    orders_no varchar2(15) not null,
    orders_status varchar2(30) not null,
    constraint pk_orders primary key(item_no),
    constraint fk_orders_pay_no FOREIGN KEY(orders_no)
               REFERENCES orders(orders_no),
    constraint fk_orders_user_info FOREIGN KEY(user_id)
               REFERENCES user_info(user_id),
    constraint fk_orders_isbn FOREIGN KEY(isbn)
               REFERENCES book(isbn)
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

-- book 테이블 sample data
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

-- cart 테이블 sample data
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

-------------------양경운 book test 데이터--------------------------------
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(111111, '여행의 이유', '김영하', '문학동네', 300, '2019/05/31', 13500, 9500, 100, '추방과 멀미,상처를 몽땅 흡수한 물건들로부터 달아나기,오직 현재',
        './resources/VertexEx/img/shop/1.jpg');
        
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(222222, '대도시의 사랑법', '박상영', '창비', 300, '2019/07/24', 14000, 9800, 100, '여름밤, 나의 아름다운 도시, 어쩌면 너 때문에 젊은 소설의 첨단, 박상영 신작 소설',
        './resources/VertexEx/img/shop/2.jpg');
        
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(333333, '지구에서 한아뿐', '정세랑', '난다', 300, '2019/08/02', 13000, 9100, 200, 
        '우주 가장자리에서 일어나 모두가 기억하게 된, 외계인 경민과 지구인 한아의 아주 희귀한 종류의 사랑 이야기!','./resources/VertexEx/img/shop/3.jpg');

insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(444444, '숨', '테드 창', '김상훈', '엘리', 300, '2019/07/01', 16500, 12000, 200, 
        '상인과 연금술사의 문', './resources/VertexEx/img/shop/5.jpg');
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(555555, '지금 나에게 필요한 긍정심리학', '류쉬안', '임보미', '다연', 300, '2019/07/19', 13000, 9100, 200, '나를 발전시키는 뜻밖의 심리학 2탄',
        './resources/VertexEx/img/shop/8.jpg');
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(666666, '팩트풀니스', '한스 로슬링, 올라 로슬링', '이창신', '김영사', 300, '2019/02/28', 19800, 11880, 200, 
        '전 세계 100만부 돌파! 세계 지성계를 사로잡은 글로벌 베스트셀러 마침내 출간!', './resources/VertexEx/img/shop/4.jpg');   
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story,  book_img)
values(777777, '해리 포터와 마법사의 돌', '조앤.K.롤링', '김혜원', 'Pottermore from J.K. Rowling', 300, '2016/08/18', 10050, 10050, 200, 
        '제1장 살아남은 아이',  './resources/VertexEx/img/shop/해리포터1.jpg');   
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(888888, '해리 포터와 죽음의 성물', '조앤.K.롤링', '김혜원', 'Pottermore from J.K. Rowling', 300, '2017/07/25', 10050, 10050, 200, 
        '해리 포터로 사는 일은 늘 힘들고, 어른이 되어서도 상황은 크게 나아지지 않는다.',   './resources/VertexEx/img/shop/해리포터6.jpg');  
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story,  book_img)
values(999999, '신비한 동물 사전', '조앤.K.롤링', '강동혁', 'Pottermore', 300, '2017/07/17', 10500, 10500, 200, 
        '마법 동물학자인 뉴트 스캐맨더가 뉴욕에 도착했을 때만해도',  './resources/VertexEx/img/shop/신비한동물사전.jpg');  
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story,  book_img)
values(101010, '해리 포터와 비밀의 방', '조앤.K.롤링', '김혜원', 'Pottermore from J.K. Rowling', 300, '2017/07/17', 10500, 10800, 200, 
        '과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나간다는 보편적인 테마',   './resources/VertexEx/img/shop/해리포터2.jpg');          


-- coupon테이블 sample data
insert into coupon values('001','쿠폰1',1,10000,5,to_date('2020-01-01'));
insert into coupon values('002','쿠폰2',1,1000,10,to_date('2020-01-01'));
insert into coupon values('003','쿠폰3',1,2000,10,to_date('2020-01-01'));
insert into coupon values('004','쿠폰4',2,3000,5,to_date('2020-01-01'));
insert into coupon values('005','쿠폰5',2,5000,10,to_date('2020-01-01'));
insert into coupon values('006','쿠폰6',2,10000,20,to_date('2020-01-01'));
insert into coupon values('007','쿠폰7',3,1000,20,to_date('2020-01-01'));
insert into coupon values('008','쿠폰8',3,5000,30,to_date('2020-01-01'));
insert into coupon values('009','쿠폰9',1,50000,20,to_date('2020-01-01'));
insert into coupon values('010','쿠폰10',1,20000,20,to_date('2020-01-01'));

-- coupon_no 테이블 sample data
insert into coupon_no values('001','aaa','t');
insert into coupon_no values('002','aaa','t');
insert into coupon_no values('003','aaa','t');
insert into coupon_no values('004','aaa','f');
insert into coupon_no values('002','bbb','t');
insert into coupon_no values('001','bbb','f');
insert into coupon_no values('009','ccc','t');
insert into coupon_no values('005','ddd','t');
insert into coupon_no values('007','ccc','t');
insert into coupon_no values('001','ddd','f');
                                                          
                                                          
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


-- ReviewBoard SampleData based on 지현's Book Data
                                  
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN)
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/08/27','RR/MM/DD'),to_date('19/08/27','RR/MM/DD'),'1',0,'첫감상',' 원래는 미즈마블에 대한 감상이었는데 책이 바뀌었어요 원글내용-> 블라블라블라 오늘은 2019년 8월 30일 금요일 금요일!금요일!! 금요일 오후 4시 56분입니다 여러분 즐거운 금요일','checked');
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/08/28','RR/MM/DD'),to_date('19/08/28','RR/MM/DD'),'1',0,'제목2','를 읽다 쓰는 두 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/08/28','RR/MM/DD'),to_date('19/08/28','RR/MM/DD'),'1',0,'제목3','을 읽다 쓰는 세에에에번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/02','RR/MM/DD'),to_date('19/09/02','RR/MM/DD'),'1',15,'공개여부작동체크(비공개)','하하하',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/02','RR/MM/DD'),to_date('19/09/02','RR/MM/DD'),'1',1315,'공개여부작동체크(공개)','공개합니다!','checked');
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/09','RR/MM/DD'),to_date('19/09/09','RR/MM/DD'),'1',3,'9시 50분','오전','checked');
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/09','RR/MM/DD'),to_date('19/09/09','RR/MM/DD'),'1',1,'ㅇ','ㄴ','checked');
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/09','RR/MM/DD'),to_date('19/09/09','RR/MM/DD'),'1',1,'썸네일어디갔어','gkgkgk','checked');

Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/01','RR/MM/DD'),to_date('19/09/04','RR/MM/DD'),'3',5,'작성 첫 시도-----','asdf',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/01','RR/MM/DD'),to_date('19/09/01','RR/MM/DD'),'3',5,'작성 첫 시도가 아니었네','asdf',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/03','RR/MM/DD'),to_date('19/09/03','RR/MM/DD'),'3',947,'밤 9시 47분','왔다갔다 페이징','checked');
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/01','RR/MM/DD'),to_date('19/09/03','RR/MM/DD'),'3',155,'된 거야?수정','ㅁㄴㅇㄹasdf',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/01','RR/MM/DD'),to_date('19/09/01','RR/MM/DD'),'3',3,'빌려둔거보고싶다','어제 보려고 했는데 스파이더맨 봄','checked');

Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/06/05','RR/MM/DD'),to_date('19/06/05','RR/MM/DD'),'5',0,'제목8','를 읽고 쓰는 첫 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/06/15','RR/MM/DD'),to_date('19/06/15','RR/MM/DD'),'5',0,'제목9','를 읽고 쓰는 두 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/06/25','RR/MM/DD'),to_date('19/06/25','RR/MM/DD'),'5',0,'제목10','를 읽고 쓰는 세 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'aaa',to_date('19/09/09','RR/MM/DD'),to_date('19/09/09','RR/MM/DD'),'5',3,'9시 50분','오전',null);


Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'ddd',to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),'1',0,'제목5','를 읽고 쓰는 첫 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'ddd',to_date('19/07/13','RR/MM/DD'),to_date('19/07/15','RR/MM/DD'),'1',0,'제목4','를 읽고 쓰는 두 번째 감상',null);
Insert into BOOK.REVIEW_BOARD (REVIEW_NO,USER_ID,REVIEW_WRITTEN_DATE,REVIEW_MODIFY_DATE,ISBN,REVIEW_REF,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_OPEN) 
values (REVIEW_BOARD_SEQ.nextval,'ddd',to_date('19/07/20','RR/MM/DD'),to_date('19/07/20','RR/MM/DD'),'1',0,'제목7','를 읽고 쓰는 세 번째 감상은 조금 길게 써볼게여 길 때 어떻게 나오는지 궁금하니까 할 말은 없지만 빈 칸을 채운다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ현재시간오후다섯시 칠분이구요 끝날 때까지 한 시간이 남았네여 그러면 저녁먹고~ 스터디하고~오늘 어디까지 끝낼 수 있을까여 모르겠습니다','checked');


                                                          
-- Review Comment Sample Data

                        

Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'bbb','으하하하핳핳ㅎㅎ수정됐어요!--',to_date('19/09/04','RR/MM/DD'),to_date('19/09/07','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,3,'bbb','댓글 테스트합니다: 2',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,2,'bbb','댓글 테스트합니다: 3',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,5,'bbb','댓글 테스트합니다: 5',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,4,'bbb','댓글 테스트합니다: 6',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,3,'ccc','댓글 테스트합니다: 7',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,2,'ccc','댓글 테스트합니다: 8',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'ccc','물음표살인마가 닉네임을 확인했다',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,5,'ccc','댓글 테스트합니다: 10',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'ddd','댓글 추가해여!',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'eee','JS Test',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'aaa','수정합니다ㅏㅏㅏㅏㅏㅏ',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'aaa','JS Test',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'bbb','asd',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'ccc','asdg',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'ddd','asdf',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'eee','asdf',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'ddd','d',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));
Insert into BOOK.REVIEW_COMMENT (REVIEW_CMT_NO,REVIEW_NO,USER_ID,REVIEW_CMT_CONTENT,REVIEW_CMT_WRITTEN_DATE,REVIEW_CMT_MODIFIED_DATE) values (review_comment_seq.nextval,1,'asdf','asdf',to_date('19/09/06','RR/MM/DD'),to_date('19/09/06','RR/MM/DD'));


                                                          
