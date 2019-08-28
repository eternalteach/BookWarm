package com.book.warm.vo;

//제목, 작가명, 출판사, 가격만 나오게
//조인해서 결과값만 나오게 하는 class
public class ShopListBoardVO {
	
	private String book_title;
	private String writer_name;
	private String publisher_name;
	private int book_price_for_sale;
	
	//게터 세터
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}
	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}
	
	
	
}
