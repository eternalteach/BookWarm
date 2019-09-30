package com.book.warm.vo;

import java.sql.Timestamp;

public class FinishedBookVO {
	private String isbn;
	private Timestamp start_date;
	private String book_title;
	private String book_img;
	
	
	public FinishedBookVO() {
		super();
	}


	public FinishedBookVO(String isbn, Timestamp start_date, String book_title, String book_img) {
		super();
		this.isbn = isbn;
		this.start_date = start_date;
		this.book_title = book_title;
		this.book_img = book_img;
	}


	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public Timestamp getStart_date() {
		return start_date;
	}


	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}


	public String getBook_title() {
		return book_title;
	}


	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}


	public String getBook_img() {
		return book_img;
	}


	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	
	

}
