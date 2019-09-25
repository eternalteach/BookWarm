package com.book.warm.vo;

import java.sql.Timestamp;

public class PayVO {
	private String pay_no;
	private String pay_way;
	private int pay_total;
	private String pay_refund_account;
	private String pay_refund_bank;
	private Timestamp orders_date;
	private Timestamp orders_pay_date;
	private String coupon_no;
	private String post_no;

	public PayVO(String pay_no, String pay_way, int pay_total, String pay_refund_account, String pay_refund_bank,
			Timestamp orders_date, Timestamp orders_pay_date, String coupon_no, String post_no) {
		super();
		this.pay_no = pay_no;
		this.pay_way = pay_way;
		this.pay_total = pay_total;
		this.pay_refund_account = pay_refund_account;
		this.pay_refund_bank = pay_refund_bank;
		this.orders_date = orders_date;
		this.orders_pay_date = orders_pay_date;
		this.coupon_no = coupon_no;
		this.post_no = post_no;
	}

	public PayVO() {
		super();
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_way() {
		return pay_way;
	}

	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}

	public int getPay_total() {
		return pay_total;
	}

	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}

	public String getPay_refund_account() {
		return pay_refund_account;
	}

	public void setPay_refund_account(String pay_refund_account) {
		this.pay_refund_account = pay_refund_account;
	}

	public String getPay_refund_bank() {
		return pay_refund_bank;
	}

	public void setPay_refund_bank(String pay_refund_bank) {
		this.pay_refund_bank = pay_refund_bank;
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
	
	public Timestamp getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Timestamp orders_date) {
		this.orders_date = orders_date;
	}

}
