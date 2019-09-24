package com.book.warm.vo;

public class CommunityBoardCommentVO {

	private int comm_cmt_no;
	private int comm_no;
	private String user_id;
	private String comm_cmt_content;
	private String comm_cmt_written_time;
	private String comm_cmt_modify_time;
	private String comm_cmt_deleted;// char(1) default 'n',
	private int comm_cmt_like;
	private int comm_cmt_group;
	private int comm_cmt_step;
	private int comm_cmt_indent;
	public CommunityBoardCommentVO(int comm_cmt_no, int comm_no, String user_id, String comm_cmt_content,
			String comm_cmt_written_time, String comm_cmt_modify_time, String comm_cmt_deleted, int comm_cmt_like,
			int comm_cmt_group, int comm_cmt_step, int comm_cmt_indent) {
		super();
		this.comm_cmt_no = comm_cmt_no;
		this.comm_no = comm_no;
		this.user_id = user_id;
		this.comm_cmt_content = comm_cmt_content;
		this.comm_cmt_written_time = comm_cmt_written_time;
		this.comm_cmt_modify_time = comm_cmt_modify_time;
		this.comm_cmt_deleted = comm_cmt_deleted;
		this.comm_cmt_like = comm_cmt_like;
		this.comm_cmt_group = comm_cmt_group;
		this.comm_cmt_step = comm_cmt_step;
		this.comm_cmt_indent = comm_cmt_indent;
	}
	public CommunityBoardCommentVO() {
		super();
	}
	public int getComm_cmt_no() {
		return comm_cmt_no;
	}
	public void setComm_cmt_no(int comm_cmt_no) {
		this.comm_cmt_no = comm_cmt_no;
	}
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
	public String getComm_cmt_content() {
		return comm_cmt_content;
	}
	public void setComm_cmt_content(String comm_cmt_content) {
		this.comm_cmt_content = comm_cmt_content;
	}
	public String getComm_cmt_written_time() {
		return comm_cmt_written_time;
	}
	public void setComm_cmt_written_time(String comm_cmt_written_time) {
		this.comm_cmt_written_time = comm_cmt_written_time;
	}
	public String getComm_cmt_modify_time() {
		return comm_cmt_modify_time;
	}
	public void setComm_cmt_modify_time(String comm_cmt_modify_time) {
		this.comm_cmt_modify_time = comm_cmt_modify_time;
	}
	public String getComm_cmt_deleted() {
		return comm_cmt_deleted;
	}
	public void setComm_cmt_deleted(String comm_cmt_deleted) {
		this.comm_cmt_deleted = comm_cmt_deleted;
	}
	public int getComm_cmt_like() {
		return comm_cmt_like;
	}
	public void setComm_cmt_like(int comm_cmt_like) {
		this.comm_cmt_like = comm_cmt_like;
	}
	public int getComm_cmt_group() {
		return comm_cmt_group;
	}
	public void setComm_cmt_group(int comm_cmt_group) {
		this.comm_cmt_group = comm_cmt_group;
	}
	public int getComm_cmt_step() {
		return comm_cmt_step;
	}
	public void setComm_cmt_step(int comm_cmt_step) {
		this.comm_cmt_step = comm_cmt_step;
	}
	public int getComm_cmt_indent() {
		return comm_cmt_indent;
	}
	public void setComm_cmt_indent(int comm_cmt_indent) {
		this.comm_cmt_indent = comm_cmt_indent;
	}

	
}
