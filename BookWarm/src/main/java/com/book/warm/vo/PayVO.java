package com.book.warm.vo;

public class PayVO {
	private String pay_no;
	private String pay_way;
	private int pay_total;
	private String pay_refund_account;

	public PayVO(String pay_no, String pay_way, int pay_total, String pay_refund_account) {
		super();
		this.pay_no = pay_no;
		this.pay_way = pay_way;
		this.pay_total = pay_total;
		this.pay_refund_account = pay_refund_account;
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

}
