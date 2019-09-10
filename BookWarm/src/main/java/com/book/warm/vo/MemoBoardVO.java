package com.book.warm.vo;

import java.sql.Timestamp;

public class MemoBoardVO {
	private String memo_no;
	private String user_id;
	private String memo_content_b;
	private Timestamp memo_written_time;
	private Timestamp memo_modify_time;

	public MemoBoardVO(String memo_no, String user_id, String memo_content_b, Timestamp memo_written_time,
			Timestamp memo_modify_time) {
		super();
		this.memo_no = memo_no;
		this.user_id = user_id;
		this.memo_content_b = memo_content_b;
		this.memo_written_time = memo_written_time;
		this.memo_modify_time = memo_modify_time;
	}

	public MemoBoardVO() {
		super();
	}

	public String getMemo_no() {
		return memo_no;
	}

	public void setMemo_no(String memo_no) {
		this.memo_no = memo_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMemo_content_b() {
		return memo_content_b;
	}

	public void setMemo_content_b(String memo_content_b) {
		this.memo_content_b = memo_content_b;
	}

	public Timestamp getMemo_written_time() {
		return memo_written_time;
	}

	public void setMemo_written_time(Timestamp memo_written_time) {
		this.memo_written_time = memo_written_time;
	}

	public Timestamp getMemo_modify_time() {
		return memo_modify_time;
	}

	public void setMemo_modify_time(Timestamp memo_modify_time) {
		this.memo_modify_time = memo_modify_time;
	}

}
