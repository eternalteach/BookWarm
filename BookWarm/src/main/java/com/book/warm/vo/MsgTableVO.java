package com.book.warm.vo;

import java.sql.Timestamp;

public class MsgTableVO {
	private int msg_no;
	private String msg_send_id;
	private String msg_get_id;
	private String msg_title;
	private String msg_content;
	private Timestamp msg_send_time;
	private Timestamp msg_read_time;
	public MsgTableVO(int msg_no, String msg_send_id, String msg_get_id, String msg_title, String msg_content,
			Timestamp msg_send_time, Timestamp msg_read_time) {
		super();
		this.msg_no = msg_no;
		this.msg_send_id = msg_send_id;
		this.msg_get_id = msg_get_id;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_send_time = msg_send_time;
		this.msg_read_time = msg_read_time;
	}
	public MsgTableVO() {
		super();
	}
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_send_id() {
		return msg_send_id;
	}
	public void setMsg_send_id(String msg_send_id) {
		this.msg_send_id = msg_send_id;
	}
	public String getMsg_get_id() {
		return msg_get_id;
	}
	public void setMsg_get_id(String msg_get_id) {
		this.msg_get_id = msg_get_id;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Timestamp getMsg_send_time() {
		return msg_send_time;
	}
	public void setMsg_send_time(Timestamp msg_send_time) {
		this.msg_send_time = msg_send_time;
	}
	public Timestamp getMsg_read_time() {
		return msg_read_time;
	}
	public void setMsg_read_time(Timestamp msg_read_time) {
		this.msg_read_time = msg_read_time;
	}
	
}
