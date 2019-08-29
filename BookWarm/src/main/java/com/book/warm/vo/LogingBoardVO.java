package com.book.warm.vo;

import java.sql.Timestamp;

public class LogingBoardVO {
	private String isbn;
	private int write_no;
	private int start_page;
	private int end_page;
	private Timestamp start_date;
	private Timestamp end_date;
	private int record_num;
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public int getStart_page() {
		return start_page;
	}
	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}
	public int getEnd_page() {
		return end_page;
	}
	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public int getRecord_num() {
		return record_num;
	}
	public void setRecord_num(int record_num) {
		this.record_num = record_num;
	}
	public LogingBoardVO(String isbn, int write_no, int start_page, int end_page, Timestamp start_date,
			Timestamp end_date, int record_num) {
		super();
		this.isbn = isbn;
		this.write_no = write_no;
		this.start_page = start_page;
		this.end_page = end_page;
		this.start_date = start_date;
		this.end_date = end_date;
		this.record_num = record_num;
	}
	public LogingBoardVO() {
		super();
	}
}
