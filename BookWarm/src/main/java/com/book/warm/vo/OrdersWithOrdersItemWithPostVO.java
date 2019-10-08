package com.book.warm.vo;

import java.sql.Timestamp;

public class OrdersWithOrdersItemWithPostVO {
	private String orders_no;
	private String user_id;
	private String orders_payment;
	private int orders_total;
	private String refund_account;
	private String refund_bank;
//	private Timestamp orders_date;
//	private Timestamp orders_pay_date;
	private String coupon_no;
	private String post_no;
	private int orders_pay_total;
	private int delivery_fee;
	private int discounted_point;
	
	private String post_name; ///1
	private String post_phone;//2
	private int post_zipcode;//3
	private String post_addr;//4
	private String post_addr_detail;

	
	private String[] isbn;
	private int[] item_cnt;
	private String orders_status;
	
	private String useCoupon;//5
	private String usePoint;//6
	private String originalPoint;//7
	
	
	
	
	// constructor
//	public OrdersWithOrdersItemWithPostVO(String orders_no, String user_id, String orders_payment, int orders_total,
//			String refund_account, String refund_bank, Timestamp orders_date, Timestamp orders_pay_date,
//			String coupon_no, String post_no, int orders_pay_total, int delivery_fee, int discounted_point,
//			String post_name, String post_phone, int post_zipcode, String post_addr, String post_addr_detail,
//			String isbn, int item_cnt, String orders_status) {
//		super();
//		this.orders_no = orders_no;
//		this.user_id = user_id;
//		this.orders_payment = orders_payment;
//		this.orders_total = orders_total;
//		this.refund_account = refund_account;
//		this.refund_bank = refund_bank;
////		this.orders_date = orders_date;
////		this.orders_pay_date = orders_pay_date;
//		this.coupon_no = coupon_no;
//		this.post_no = post_no;
//		this.orders_pay_total = orders_pay_total;
//		this.delivery_fee = delivery_fee;
//		this.discounted_point = discounted_point;
//		this.post_name = post_name;
//		this.post_phone = post_phone;
//		this.post_zipcode = post_zipcode;
//		this.post_addr = post_addr;
//		this.post_addr_detail = post_addr_detail;
//		this.isbn = isbn;
//		this.item_cnt = item_cnt;
//		this.orders_status = orders_status;
//	}
	
	public OrdersWithOrdersItemWithPostVO() {
		
	}

	// getter, setter
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
	
	public String getOrders_payment() {
		return orders_payment;
	}

	public void setOrders_payment(String orders_payment) {
		this.orders_payment = orders_payment;
	}

	public int getOrders_total() {
		return orders_total;
	}

	public void setOrders_total(int orders_total) {
		this.orders_total = orders_total;
	}

	public String getRefund_account() {
		return refund_account;
	}

	public void setRefund_account(String refund_account) {
		this.refund_account = refund_account;
	}

	public String getRefund_bank() {
		return refund_bank;
	}

	public void setRefund_bank(String refund_bank) {
		this.refund_bank = refund_bank;
	}

//	public Timestamp getOrders_date() {
//		return orders_date;
//	}
//
//	public void setOrders_date(Timestamp orders_date) {
//		this.orders_date = orders_date;
//	}
//
//	public Timestamp getOrders_pay_date() {
//		return orders_pay_date;
//	}
//
//	public void setOrders_pay_date(Timestamp orders_pay_date) {
//		this.orders_pay_date = orders_pay_date;
//	}

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
	
	public int getOrders_pay_total() {
		return orders_pay_total;
	}

	public void setOrders_pay_total(int orders_pay_total) {
		this.orders_pay_total = orders_pay_total;
	}

	public int getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	public int getDiscounted_point() {
		return discounted_point;
	}

	public void setDiscounted_point(int discounted_point) {
		this.discounted_point = discounted_point;
	}

	public String getPost_name() {
		return post_name;
	}

	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}

	public String getPost_phone() {
		return post_phone;
	}

	public void setPost_phone(String post_phone) {
		this.post_phone = post_phone;
	}

	public int getPost_zipcode() {
		return post_zipcode;
	}

	public void setPost_zipcode(int post_zipcode) {
		this.post_zipcode = post_zipcode;
	}

	public String getPost_addr() {
		return post_addr;
	}

	public void setPost_addr(String post_addr) {
		this.post_addr = post_addr;
	}

	public String getPost_addr_detail() {
		return post_addr_detail;
	}

	public void setPost_addr_detail(String post_addr_detail) {
		this.post_addr_detail = post_addr_detail;
	}

	/*
	 * public String getIsbn() { return isbn; }
	 * 
	 * public void setIsbn(String isbn) { this.isbn = isbn; }
	 * 
	 * public int getItem_cnt() { return item_cnt; }
	 * 
	 * public void setItem_cnt(int item_cnt) { this.item_cnt = item_cnt; }
	 */

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}
	
	
	
}
