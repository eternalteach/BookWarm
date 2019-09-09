package com.book.warm.vo;

import java.sql.Timestamp;

public class LibraryVO {
	private String user_id;
	private int list_no;
	private String list_img_src;
	private String list_type;
	private String isbn;
	private Timestamp list_added_date;
	public LibraryVO(String user_id, int list_no, String list_img_src, String list_type, String isbn,
			Timestamp list_added_date) {
		super();
		this.user_id = user_id;
		this.list_no = list_no;
		this.list_img_src = list_img_src;
		this.list_type = list_type;
		this.isbn = isbn;
		this.list_added_date = list_added_date;
	}
	public LibraryVO() {
		super();
	}
	public String getUser_id() {
		return user_id;
	}
	public int getList_no() {
		return list_no;
	}
	public String getList_img_src() {
		return list_img_src;
	}
	public String getList_type() {
		return list_type;
	}
	public String getIsbn() {
		return isbn;
	}
	public Timestamp getList_added_date() {
		return list_added_date;
	}
	
}
