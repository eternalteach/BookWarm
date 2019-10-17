package com.book.warm.vo;

import java.sql.Timestamp;

public class CouponVO {
	private String coupon_no;
	private String coupon_name;
	private int coupon_req;
	private int coupon_use_req;
	private int coupon_discount_percent;
	private Timestamp coupon_validate;
	private String coupon_validate_string; // coupon_validate 컬럼을 string으로 변환해서 넣을 것
	
	public CouponVO(String coupon_no, String coupon_name, int coupon_req, int coupon_use_req,
			int coupon_discount_percent, Timestamp coupon_validate) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_req = coupon_req;
		this.coupon_use_req = coupon_use_req;
		this.coupon_discount_percent = coupon_discount_percent;
		this.coupon_validate = coupon_validate;
	}
	public CouponVO() {
		super();
	}
	
	public String getCoupon_validate_string() {
		return coupon_validate_string;
	}
	public void setCoupon_validate_string(String coupon_validate_string) {
		this.coupon_validate_string = coupon_validate_string;
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
	public int getCoupon_req() {
		return coupon_req;
	}
	public void setCoupon_req(int coupon_req) {
		this.coupon_req = coupon_req;
	}
	public int getCoupon_use_req() {
		return coupon_use_req;
	}
	public void setCoupon_use_req(int coupon_use_req) {
		this.coupon_use_req = coupon_use_req;
	}
	public int getCoupon_discount_percent() {
		return coupon_discount_percent;
	}
	public void setCoupon_discount_percent(int coupon_discount_percent) {
		this.coupon_discount_percent = coupon_discount_percent;
	}
	public Timestamp getCoupon_validate() {
		return coupon_validate;
	}
	public void setCoupon_validate(Timestamp coupon_validate) {
		this.coupon_validate = coupon_validate;
	}
	
	
}
