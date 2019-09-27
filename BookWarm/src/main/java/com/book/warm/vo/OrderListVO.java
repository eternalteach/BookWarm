package com.book.warm.vo;

import java.sql.Timestamp;

// orderList.jsp를 위한 페이지(book, orders_item, orders를 inner join)
public class OrderListVO {
	private int orders_total;
	private Timestamp orders_date;
	private String book_title;
	private int item_cnt;
	private int book_price_for_sale;
	private String orders_status;
	private String orders_no;
	private String book_img;
	
	// constructor
	public OrderListVO(int orders_total, Timestamp orders_date, String book_title, int item_cnt,
			int book_price_for_sale, String orders_status, String orders_no) {
		super();
		this.orders_total = orders_total;
		this.orders_date = orders_date;
		this.book_title = book_title;
		this.item_cnt = item_cnt;
		this.book_price_for_sale = book_price_for_sale;
		this.orders_status = orders_status;
		this.orders_no = orders_no;
	}
	
	public OrderListVO() {
		super();
	}
	
	// getter, setter
	public int getOrders_total() {
		return orders_total;
	}

	public void setOrders_total(int orders_total) {
		this.orders_total = orders_total;
	}

	public Timestamp getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Timestamp orders_date) {
		this.orders_date = orders_date;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public int getItem_cnt() {
		return item_cnt;
	}

	public void setItem_cnt(int item_cnt) {
		this.item_cnt = item_cnt;
	}

	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}

	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}

	public String getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(String orders_no) {
		this.orders_no = orders_no;
	}
	
	public String getBook_img() {
		return book_img;
	}
	
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	
}
