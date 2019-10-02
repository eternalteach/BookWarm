package com.book.warm.vo;
public class OrdersItemVO {
	private String item_no;
	private String isbn;
	private int item_cnt;
	private String orders_no;
	private String orders_status;
	
	
	// constructor
	public OrdersItemVO(String item_no, String isbn, int item_cnt, String orders_no,
			String orders_status) {
		super();
		this.item_no = item_no;
		this.isbn = isbn;
		this.item_cnt = item_cnt;
		this.orders_no = orders_no;
		this.orders_status = orders_status;
	}
	
	public OrdersItemVO() {
		super();
	}
	
	
	// getter, setter
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getItem_cnt() {
		return item_cnt;
	}
	public void setItem_cnt(int item_cnt) {
		this.item_cnt = item_cnt;
	}
	public String getOrders_no() {
		return orders_no;
	}
	public void setOrders_no(String orders_no) {
		this.orders_no = orders_no;
	}
	public String getOrders_status() {
		return orders_status;
	}
	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}
	
	
}
