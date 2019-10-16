package com.book.warm.vo;
public class OrdersStatusVO {
	private String user_id;
	private String orders_no;
	private String orders_status;
	private int orders_status_num;
	
	// constructor
	public OrdersStatusVO(String user_id, String orders_no, String orders_status, int orders_status_num) {
		super();
		this.user_id = user_id;
		this.orders_no = orders_no;
		this.orders_status = orders_status;
		this.orders_status_num = orders_status_num;
	}
	
	public OrdersStatusVO() {
		super();
	}

	// getter, setter
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public int getOrders_status_num() {
		return orders_status_num;
	}

	public void setOrders_status_num(int orders_status_num) {
		this.orders_status_num = orders_status_num;
	}
	
}
