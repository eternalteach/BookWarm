package com.book.warm.vo;

import java.sql.Timestamp;

public class CouponVO {
	private String coupon_no;
	private String coupon_name;
	private String coupon_req;
	private String coupon_use_req;
	private int coupon_discount_percent;
	private int coupon_discount_price;
	private Timestamp coupon_validate;
	public CouponVO(String coupon_no, String coupon_name, String coupon_req, String coupon_use_req,
			int coupon_discount_percent, int coupon_discount_price, Timestamp coupon_validate) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_req = coupon_req;
		this.coupon_use_req = coupon_use_req;
		this.coupon_discount_percent = coupon_discount_percent;
		this.coupon_discount_price = coupon_discount_price;
		this.coupon_validate = coupon_validate;
	}
	public CouponVO() {
		super();
	}
	public String getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_req() {
		return coupon_req;
	}
	public void setCoupon_req(String coupon_req) {
		this.coupon_req = coupon_req;
	}
	public String getCoupon_use_req() {
		return coupon_use_req;
	}
	public void setCoupon_use_req(String coupon_use_req) {
		this.coupon_use_req = coupon_use_req;
	}
	public int getCoupon_discount_percent() {
		return coupon_discount_percent;
	}
	public void setCoupon_discount_percent(int coupon_discount_percent) {
		this.coupon_discount_percent = coupon_discount_percent;
	}
	public int getCoupon_discount_price() {
		return coupon_discount_price;
	}
	public void setCoupon_discount_price(int coupon_discount_price) {
		this.coupon_discount_price = coupon_discount_price;
	}
	public Timestamp getCoupon_validate() {
		return coupon_validate;
	}
	public void setCoupon_validate(Timestamp coupon_validate) {
		this.coupon_validate = coupon_validate;
	}
	
	
}
