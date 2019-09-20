package com.book.warm.vo;

public class CartJoinBookVO { // hold modify
	int cart_no;
	String user_id;
	String isbn;
	int cart_cnt;
	String book_title; //////
	int book_price_for_sale; //////
	String book_img; ///////
	int total; ///////
	/////// 처리한 부분 : BookVO에서 가져온 컬럼부분
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}
	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
