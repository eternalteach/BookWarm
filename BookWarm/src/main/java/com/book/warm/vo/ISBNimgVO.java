package com.book.warm.vo;

public class ISBNimgVO {
	private String ISBN;
	private String img_src;

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public ISBNimgVO(String iSBN, String img_src) {
		super();
		ISBN = iSBN;
		this.img_src = img_src;
	}

	public ISBNimgVO() {
		super();
	}

}
