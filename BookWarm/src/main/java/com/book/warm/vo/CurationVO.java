package com.book.warm.vo;

public class CurationVO {
	private int curation_no;
	private String curation_name;
	private String isbn;

	public CurationVO(int curation_no, String curation_name, String isbn) {
		super();
		this.curation_no = curation_no;
		this.curation_name = curation_name;
		this.isbn = isbn;
	}

	public CurationVO() {
		super();
	}

	public int getCuration_no() {
		return curation_no;
	}

	public void setCuration_no(int curation_no) {
		this.curation_no = curation_no;
	}

	public String getCuration_name() {
		return curation_name;
	}

	public void setCuration_name(String curation_name) {
		this.curation_name = curation_name;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

}
