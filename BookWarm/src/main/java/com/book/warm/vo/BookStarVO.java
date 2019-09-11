package com.book.warm.vo;

public class BookStarVO {
	
	private String isbn;
	private String user_id;
	private int star;
	
	
	
	public BookStarVO() {
		super();
	}



	public BookStarVO(String isbn, String user_id, int star) {
		super();
		this.isbn = isbn;
		this.user_id = user_id;
		this.star = star;
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



	public int getStar() {
		return star;
	}



	public void setStar(int star) {
		this.star = star;
	}
	
	
	
}
