package com.book.warm.vo;

public class BookLikeVO {

	private String user_id;
	private String isbn;
	private String book_like;

	public BookLikeVO(String user_id, String isbn, String book_like) {
		super();
		this.user_id = user_id;
		this.isbn = isbn;
		this.book_like = book_like;
	}

	public BookLikeVO() {
		super();
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBook_like() {
		return book_like;
	}
	public void setBook_like(String book_like) {
		this.book_like = book_like;
	}
	
	
}
