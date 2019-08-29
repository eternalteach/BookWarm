package com.book.warm.vo;

public class ISBNimgVO {
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

	public ISBNimgVO(String isbn, String img_src) {
		super();
		this.isbn = isbn;
		this.img_src = img_src;
	}

	public ISBNimgVO() {
		super();
	}

}
