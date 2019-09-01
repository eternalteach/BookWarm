package com.book.warm.vo;

public class BookCoverVO {
	private String isbn;
	private String img_src;

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public BookCoverVO(String isbn, String img_src) {
		super();
		this.isbn = isbn;
		this.img_src = img_src;
	}

	public BookCoverVO() {
		super();
	}

}
