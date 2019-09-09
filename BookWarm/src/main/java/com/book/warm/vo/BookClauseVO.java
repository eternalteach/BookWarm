package com.book.warm.vo;

public class BookClauseVO {
	private String isbn;
	private String clause;
	public BookClauseVO(String isbn, String clause) {
		super();
		this.isbn = isbn;
		this.clause = clause;
	}
	public BookClauseVO() {
		super();
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getClause() {
		return clause;
	}
	public void setClause(String clause) {
		this.clause = clause;
	}
}
