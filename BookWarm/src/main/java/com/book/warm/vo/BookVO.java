package com.book.warm.vo;

import java.sql.Timestamp;

public class BookVO {
	private String isbn;
	private String book_title;
	private String writer_name;
	private String translator_name;
	private String publisher_name;
	private int book_tot_page;
	private Timestamp book_published_date;
	private int book_price;
	private int book_price_for_sale;
	private String book_stock;
	private String book_story;
	private String book_img="";

	public BookVO(String isbn, String book_title, String writer_name, String translator_name, String publisher_name,
			int book_tot_page, Timestamp book_published_date, int book_price, int book_price_for_sale,
			String book_stock, String book_story, String book_img) {
		super();
		this.isbn = isbn;
		this.book_title = book_title;
		this.writer_name = writer_name;
		this.translator_name = translator_name;
		this.publisher_name = publisher_name;
		this.book_tot_page = book_tot_page;
		this.book_published_date = book_published_date;
		this.book_price = book_price;
		this.book_price_for_sale = book_price_for_sale;
		this.book_stock = book_stock;
		this.book_story = book_story;
		this.book_img = book_img;
	}

	public BookVO() {
		super();
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

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getTranslator_name() {
		return translator_name;
	}

	public void setTranslator_name(String translator_name) {
		this.translator_name = translator_name;
	}

	public String getPublisher_name() {
		return publisher_name;
	}

	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}

	public int getBook_tot_page() {
		return book_tot_page;
	}

	public void setBook_tot_page(int book_tot_page) {
		this.book_tot_page = book_tot_page;
	}

	public Timestamp getBook_published_date() {
		return book_published_date;
	}

	public void setBook_published_date(Timestamp book_published_date) {
		this.book_published_date = book_published_date;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}

	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}

	public String getBook_stock() {
		return book_stock;
	}

	public void setBook_stock(String book_stock) {
		this.book_stock = book_stock;
	}

	public String getBook_story() {
		return book_story;
	}

	public void setBook_story(String book_story) {
		this.book_story = book_story;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

}
