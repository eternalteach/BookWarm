package com.book.warm.vo;

public class BookVO {

	private Integer totalPage;

	public Integer getTotalPage() {
		return 1000;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public BookVO(Integer totalPage) {
		super();
		this.totalPage = totalPage;
	}

	public BookVO() {
		super();
		this.totalPage = 1100;
	}
	

}
