package com.book.warm.vo;

//책순위, 이미지, 제목, 저자, 출판사, 가격 나오는 VO
//조인해서 결과값만 나오게 하는 class
public class ShopListBoardVO {
	
	private int isbn;
	private String book_title;
	private String book_price; //정가
	private int book_price_for_sale; //판매가
	private String writer_name;
	private String translator_name;
	private String publisher_name;
	private int book_tot_page;
	private String book_intro;
	private String book_idx;
	private String book_story;
	private String book_img;
	
	
	//게터세터
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}
	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getTranslator_name() {
		return translator_name;
	}
	public void setTranslator_name(String translator_name) {
		this.translator_name = translator_name;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public int getBook_tot_page() {
		return book_tot_page;
	}
	public void setBook_tot_page(int book_tot_page) {
		this.book_tot_page = book_tot_page;
	}
	public String getBook_intro() {
		return book_intro;
	}
	public void setBook_intro(String book_intro) {
		this.book_intro = book_intro;
	}
	public String getBook_idx() {
		return book_idx;
	}
	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}
	public String getBook_story() {
		return book_story;
	}
	public void setBook_story(String book_story) {
		this.book_story = book_story;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	
}
