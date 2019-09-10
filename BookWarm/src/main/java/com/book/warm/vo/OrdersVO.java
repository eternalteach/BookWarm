package com.book.warm.vo;

import java.sql.Timestamp;

public class OrdersVO {
	private String orders_no;
	private String user_id;
	private Timestamp orders_date;
	private String isbn;
	private int orders_cnt;
	private int orders_tot;
	private Timestamp orders_start_date;
	private Timestamp orders_pay_date;
	private String coupon_no;
	private String post_no;
	private String pay_no;

	public OrdersVO(String orders_no, String user_id, Timestamp orders_date, String isbn, int orders_cnt,
			int orders_tot, Timestamp orders_start_date, Timestamp orders_pay_date, String coupon_no, String post_no,
			String pay_no) {
		super();
		this.orders_no = orders_no;
		this.user_id = user_id;
		this.orders_date = orders_date;
		this.isbn = isbn;
		this.orders_cnt = orders_cnt;
		this.orders_tot = orders_tot;
		this.orders_start_date = orders_start_date;
		this.orders_pay_date = orders_pay_date;
		this.coupon_no = coupon_no;
		this.post_no = post_no;
		this.pay_no = pay_no;
	}

	public OrdersVO() {
		super();
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

	public Timestamp getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Timestamp orders_date) {
		this.orders_date = orders_date;
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

	public int getOrders_tot() {
		return orders_tot;
	}

	public void setOrders_tot(int orders_tot) {
		this.orders_tot = orders_tot;
	}

	public Timestamp getOrders_start_date() {
		return orders_start_date;
	}

	public void setOrders_start_date(Timestamp orders_start_date) {
		this.orders_start_date = orders_start_date;
	}

	public Timestamp getOrders_pay_date() {
		return orders_pay_date;
	}

	public void setOrders_pay_date(Timestamp orders_pay_date) {
		this.orders_pay_date = orders_pay_date;
	}

	public String getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

}
