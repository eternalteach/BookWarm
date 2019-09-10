package com.book.warm.vo;

public class AuthorsVO {
	
	private String isbn;
	private String author;
	
	public AuthorsVO() {
		super();
	}

	public AuthorsVO(String isbn, String author) {
		super();
		this.isbn = isbn;
		this.author = author;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
