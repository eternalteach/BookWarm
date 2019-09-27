package com.book.warm.vo;

public class BookLoveVO {
	private int book_love;
	private int love_check;
	private String isbn;
	private String user_id;
	
	public int getBook_love() {
		return book_love;
	}
	public void setBook_love(int book_love) {
		this.book_love = book_love;
	}
	public int getLove_check() {
		return love_check;
	}
	public void setLove_check(int love_check) {
		this.love_check = love_check;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public BookLoveVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookLoveVO(int book_love, int love_check, String isbn, String user_id) {
		super();
		this.book_love = book_love;
		this.love_check = love_check;
		this.isbn = isbn;
		this.user_id = user_id;
	}
}