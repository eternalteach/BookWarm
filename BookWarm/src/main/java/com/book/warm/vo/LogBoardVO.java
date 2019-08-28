package com.book.warm.vo;

import java.sql.Date;

//���� Ŭ���� ���� �ϼ���. �����ؼ� �ϸ� �ȵ˴ϴ�.
public class LogBoardVO { // ������� SQL
	private int writeNo; // ��Ϲ�ȣ write_no
	private String userId; // ����� ID user_id
	private Date writeWrittenDate; // �ۼ��� write_written_date
	private String ISBN; // ������ȣ ISBN
	private Date writeBuyDate; // ������(�뿩��) write_buy_date
	private int readAmount; // �������� read_amount  (���� ��)
	private int readStop; // å���� read_stop
	private int readStar; // ���� read_star

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
