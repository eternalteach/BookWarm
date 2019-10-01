package com.book.warm.vo;

public class PostVO {
	private String post_no;
	private String user_id;
	private String post_name;
	private String post_phone;
	private int post_zipcode;
	private String post_addr;
	private String post_addr_detail;
	
	
	// constructor
	public PostVO(String post_no, String user_id, String post_name, String post_phone, int post_zipcode,
			String post_addr, String post_addr_detail) {
		super();
		this.post_no = post_no;
		this.user_id = user_id;
		this.post_name = post_name;
		this.post_phone = post_phone;
		this.post_zipcode = post_zipcode;
		this.post_addr = post_addr;
		this.post_addr_detail = post_addr_detail;
	}
	
	public PostVO() {
		super();
	}
	
	
	// getter, setter
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
	
}
