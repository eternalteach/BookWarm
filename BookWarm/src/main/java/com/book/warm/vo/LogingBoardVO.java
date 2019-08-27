package com.book.warm.vo;

import java.sql.Date;

public class LogingBoardVO {
	private int writeNo;
	private int startPage;
	private int endPage;
	private Date startDate;
	private Date endDate;
	private int amount;
	private int recordNum;

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public int getAmount() {
		return endPage - startPage;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public LogingBoardVO(int writeNo, int startPage, int endPage, Date startDate, Date endDate) {
		super();
		this.writeNo = writeNo;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public LogingBoardVO() {
		super();
	}

}
