package com.book.warm.vo;

import java.sql.Date;

public class LogingBoardVO {
	private int writeNo;
	private Date startDate;
	private int StartPage;
	private Date endDate;

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public int getStartPage() {
		return StartPage;
	}

	public void setStartPage(int startPage) {
		StartPage = startPage;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public LogingBoardVO(int writeNo, Date startDate, int startPage, Date endDate) {
		super();
		this.writeNo = writeNo;
		this.startDate = startDate;
		StartPage = startPage;
		this.endDate = endDate;
	}

	public LogingBoardVO() {
		super();
	}

}
