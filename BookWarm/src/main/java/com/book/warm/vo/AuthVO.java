package com.book.warm.vo;

public class AuthVO {
	
	private String user_id;
	private String authority;
	
	public AuthVO() {
		super();
	}
	
	public AuthVO(String user_id, String authority) {
		super();
		this.user_id = user_id;
		this.authority = authority;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
}
