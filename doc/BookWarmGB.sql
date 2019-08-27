-- logBoard, logingBoard sequence 생성
create sequence seq_logBoard;
create sequence seq_logingBoard;
-- logingBoard 보드 생성
create table loging_board(
writeNo number(10,0),
startDate date not null,
startPage number(4,0) not null,
endDate date not null);
-- sample date
insert into loging_board (writeNo, startDate, startPage, endDate) values(1, sysdate, 222, sysdate);
insert into log_board (writeNo,user_id,ISBN,write_buy_date)values(1, 'user00', 'isbn001', sysdate);
-- logBoard 보드 생성
create table log_board(
writeNo number(10,0) PRIMARY key,
user_id varchar2(50) not null,
write_written_date date default sysdate,
ISBN VARCHAR2(1000) not null,
write_buy_date date not null,
read_amount number(4,0),
read_stop number(10,0),
read_star number(1,0)
);

-- loging 의 writeNo 는 log의 writeNo를 참조한다.
alter table loging_board add constraint fk_log_board foreign key (writeNo) REFERENCES log_board (writeNo);

select * from loging_board;


--테스트
select * from loging_board where writeNo=1;
