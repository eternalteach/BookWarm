package com.book.warm.vo;

import java.sql.Timestamp;

public class CommunityBoardVO {
	private int comm_no;
	private String user_id;
	private String comm_subject;
	private String comm_title;
	private String comm_content;
	private Timestamp comm_written_time;
	private int comm_clicked;
	private int comm_group;
	private int comm_step;
	private int comm_indent;
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComm_subject() {
		return comm_subject;
	}
	public void setComm_subject(String comm_subject) {
		this.comm_subject = comm_subject;
	}
	public String getComm_title() {
		return comm_title;
	}
	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public Timestamp getComm_written_time() {
		return comm_written_time;
	}
	public void setComm_written_time(Timestamp comm_written_time) {
		this.comm_written_time = comm_written_time;
	}
	public int getComm_clicked() {
		return comm_clicked;
	}
	public void setComm_clicked(int comm_clicked) {
		this.comm_clicked = comm_clicked;
	}
	public int getComm_group() {
		return comm_group;
	}
	public void setComm_group(int comm_group) {
		this.comm_group = comm_group;
	}
	public int getComm_step() {
		return comm_step;
	}
	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}
	public int getComm_indent() {
		return comm_indent;
	}
	public void setComm_indent(int comm_indent) {
		this.comm_indent = comm_indent;
	}
	public CommunityBoardVO(int comm_no, String user_id, String comm_subject, String comm_title, String comm_content,
			Timestamp comm_written_time, int comm_clicked, int comm_group, int comm_step, int comm_indent) {
		super();
		this.comm_no = comm_no;
		this.user_id = user_id;
		this.comm_subject = comm_subject;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_written_time = comm_written_time;
		this.comm_clicked = comm_clicked;
		this.comm_group = comm_group;
		this.comm_step = comm_step;
		this.comm_indent = comm_indent;
	}
	public CommunityBoardVO() {
		super();
	}
}
