package com.book.warm.vo;

import java.sql.Date;

//새로 클래스 만들어서 하세요. 수정해서 하면 안됩니다.
public class LogBoardVO { // 독서기록 SQL
	private int writeNo; // 기록번호 write_no
	private String userId; // 사용자 ID user_id
	private Date writeWrittenDate; // 작성일 write_written_date
	private String ISBN; // 도서번호 ISBN
	private Date writeBuyDate; // 구매일(대여일) write_buy_date
	private int readAmount; // 독서상태 read_amount  (읽은 양)
	private int readStop; // 책갈피 read_stop
	private int readStar; // 별점 read_star

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getWriteWrittenDate() {
		return writeWrittenDate;
	}

	public void setWriteWrittenDate(Date writeWrittenDate) {
		this.writeWrittenDate = writeWrittenDate;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public Date getWriteBuyDate() {
		return writeBuyDate;
	}

	public void setWriteBuyDate(Date writeBuyDate) {
		this.writeBuyDate = writeBuyDate;
	}

	public int getReadAmount() {
		return readAmount;
	}

	public void setReadAmount(int readAmount) {
		this.readAmount = readAmount;
	}

	public int getReadStop() {
		return readStop;
	}

	public void setReadStop(int readStop) {
		this.readStop = readStop;
	}

	public int getReadStar() {
		return readStar;
	}

	public void setReadStar(int readStar) {
		this.readStar = readStar;
	}

	public LogBoardVO(int writeNo, String userId, Date writeWrittenDate, String iSBN, Date writeBuyDate,
			int readAmount, int readStop, int readStar) {
		super();
		this.writeNo = writeNo;
		this.userId = userId;
		this.writeWrittenDate = writeWrittenDate;
		ISBN = iSBN;
		this.writeBuyDate = writeBuyDate;
		this.readAmount = readAmount;
		this.readStop = readStop;
		this.readStar = readStar;
	}

	public LogBoardVO() {
		super();
	}

}
