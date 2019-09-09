package com.book.warm.vo;

public class CouponNoVO {
	private String coupon_no;
	private String user_id;
	private String coupon_available;

	public CouponNoVO(String coupon_no, String user_id, String coupon_available) {
		super();
		this.coupon_no = coupon_no;
		this.user_id = user_id;
		this.coupon_available = coupon_available;
	}

	public CouponNoVO() {
		super();
	}

	public String getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCoupon_available() {
		return coupon_available;
	}

	public void setCoupon_available(String coupon_available) {
		this.coupon_available = coupon_available;
	}

}
