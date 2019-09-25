package com.book.warm.vo;

import java.sql.Timestamp;

public class OrdersVO {
	private String orders_no;
	private String user_id;
	private String isbn;
	private int orders_cnt;
	private String pay_no;
	private String orders_status;
	
	public OrdersVO() {
		super();
	}

	public OrdersVO(String orders_no, String user_id, String isbn, int orders_cnt,
			String pay_no, String orders_status) {
		super();
		this.orders_no = orders_no;
		this.user_id = user_id;
		this.isbn = isbn;
		this.orders_cnt = orders_cnt;
		this.pay_no = pay_no;
		this.orders_status = orders_status;
	}

	public String getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(String orders_no) {
		this.orders_no = orders_no;
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

	public int getOrders_cnt() {
		return orders_cnt;
	}

	public void setOrders_cnt(int orders_cnt) {
		this.orders_cnt = orders_cnt;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}

	

}
