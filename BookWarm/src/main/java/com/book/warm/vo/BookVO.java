package com.book.warm.vo;

import java.sql.Date;

public class BookVO {
	
	private String isbn;
	private String book_title;
	private int writer_no;
	private int translator_no;
	private int publisher_no;
	private int book_tot_page;
	private Date book_published_date;
	private int book_price;
	private int book_stock;
	private String book_intro;
	private String book_idx;
	private String book_story;
	
	public BookVO() {
		super();
	}

	public BookVO(String isbn, String book_title, int writer_no, int translator_no, int publisher_no, int book_tot_page,
			Date book_published_date, int book_price, int book_stock, String book_intro, String book_idx,
			String book_story) {
		super();
		this.isbn = isbn;
		this.book_title = book_title;
		this.writer_no = writer_no;
		this.translator_no = translator_no;
		this.publisher_no = publisher_no;
		this.book_tot_page = book_tot_page;
		this.book_published_date = book_published_date;
		this.book_price = book_price;
		this.book_stock = book_stock;
		this.book_intro = book_intro;
		this.book_idx = book_idx;
		this.book_story = book_story;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public int getTranslator_no() {
		return translator_no;
	}

	public void setTranslator_no(int translator_no) {
		this.translator_no = translator_no;
	}

	public int getPublisher_no() {
		return publisher_no;
	}

	public void setPublisher_no(int publisher_no) {
		this.publisher_no = publisher_no;
	}

	public int getBook_tot_page() {
		return book_tot_page;
	}

	public void setBook_tot_page(int book_tot_page) {
		this.book_tot_page = book_tot_page;
	}

	public Date getBook_published_date() {
		return book_published_date;
	}

	public void setBook_published_date(Date book_published_date) {
		this.book_published_date = book_published_date;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public int getBook_stock() {
		return book_stock;
	}

	public void setBook_stock(int book_stock) {
		this.book_stock = book_stock;
	}

	public String getBook_intro() {
		return book_intro;
	}

	public void setBook_intro(String book_intro) {
		this.book_intro = book_intro;
	}

	public String getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}

	public String getBook_story() {
		return book_story;
	}

	public void setBook_story(String book_story) {
		this.book_story = book_story;
	}
	
	
	
}
