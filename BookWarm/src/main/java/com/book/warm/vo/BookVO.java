package com.book.warm.vo;

public class BookVO {

	private Integer totalPage;
	private String isbn;

	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public BookVO(Integer totalPage, String isbn) {
		super();
		this.totalPage = totalPage;
		this.isbn = isbn;
	}
	public BookVO() {
		super();
	}


	

}
