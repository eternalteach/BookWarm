package com.book.warm.vo;

import java.sql.Timestamp;

public class UserVO {
	String user_id;
	String user_pw;
	String user_nickname;
	String user_name;
	Timestamp user_bday;
	String user_sex; // f&m
	String user_phone;
	String user_mail;
	int user_zipcode;
	String user_addr;
	String user_addr_detail;
	Timestamp user_join_date;
	String user_level;
	int user_tot_price;
	int user_point;
	String user_agree;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUserid(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUserpw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Timestamp getUser_bday() {
		return user_bday;
	}
	public void setUser_bday(Timestamp user_bday) {
		this.user_bday = user_bday;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public int getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(int user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_addr_detail() {
		return user_addr_detail;
	}
	public void setUser_addr_detail(String user_addr_detail) {
		this.user_addr_detail = user_addr_detail;
	}
	public Timestamp getUser_join_date() {
		return user_join_date;
	}
	public void setUser_join_date(Timestamp user_join_date) {
		this.user_join_date = user_join_date;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public int getUser_tot_price() {
		return user_tot_price;
	}
	public void setUser_tot_price(int user_tot_price) {
		this.user_tot_price = user_tot_price;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_agree() {
		return user_agree;
	}
	public void setUser_agree(String user_agree) {
		this.user_agree = user_agree;
	}
	
}
