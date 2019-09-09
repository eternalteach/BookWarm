package com.book.warm.vo;

public class OrdersViewVO {
	private String orders_no;
	private String user_id;
	private String orders_status;

	public OrdersViewVO(String orders_no, String user_id, String orders_status) {
		super();
		this.orders_no = orders_no;
		this.user_id = user_id;
		this.orders_status = orders_status;
	}

	public OrdersViewVO() {
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

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}

}
