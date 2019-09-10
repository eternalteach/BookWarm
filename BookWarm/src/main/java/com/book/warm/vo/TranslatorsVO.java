package com.book.warm.vo;

public class TranslatorsVO {
	
	private String isbn;
	private String translator;
	
	public TranslatorsVO() {
		super();
	}

	public TranslatorsVO(String isbn, String translator) {
		super();
		this.isbn = isbn;
		this.translator = translator;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}
	
	
}
