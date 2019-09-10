package com.book.warm.vo;

import java.sql.Timestamp;

public class MemoCommentVO {
	private int memo_cmt_no;
	private int memo_no;
	private String user_id;
	private String isbn;
	private String memo_cmt_content;
	private Timestamp memo_cmt_written_time;
	private Timestamp memo_cmt_modify_time;
	private int memo_cmt_like;

	public MemoCommentVO(int memo_cmt_no, int memo_no, String user_id, String isbn, String memo_cmt_content,
			Timestamp memo_cmt_written_time, Timestamp memo_cmt_modify_time, int memo_cmt_like) {
		super();
		this.memo_cmt_no = memo_cmt_no;
		this.memo_no = memo_no;
		this.user_id = user_id;
		this.isbn = isbn;
		this.memo_cmt_content = memo_cmt_content;
		this.memo_cmt_written_time = memo_cmt_written_time;
		this.memo_cmt_modify_time = memo_cmt_modify_time;
		this.memo_cmt_like = memo_cmt_like;
	}

	public MemoCommentVO() {
		super();
	}

	public int getMemo_cmt_no() {
		return memo_cmt_no;
	}

	public void setMemo_cmt_no(int memo_cmt_no) {
		this.memo_cmt_no = memo_cmt_no;
	}

	public int getMemo_no() {
		return memo_no;
	}

	public void setMemo_no(int memo_no) {
		this.memo_no = memo_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getMemo_cmt_content() {
		return memo_cmt_content;
	}

	public void setMemo_cmt_content(String memo_cmt_content) {
		this.memo_cmt_content = memo_cmt_content;
	}

	public Timestamp getMemo_cmt_written_time() {
		return memo_cmt_written_time;
	}

	public void setMemo_cmt_written_time(Timestamp memo_cmt_written_time) {
		this.memo_cmt_written_time = memo_cmt_written_time;
	}

	public Timestamp getMemo_cmt_modify_time() {
		return memo_cmt_modify_time;
	}

	public void setMemo_cmt_modify_time(Timestamp memo_cmt_modify_time) {
		this.memo_cmt_modify_time = memo_cmt_modify_time;
	}

	public int getMemo_cmt_like() {
		return memo_cmt_like;
	}

	public void setMemo_cmt_like(int memo_cmt_like) {
		this.memo_cmt_like = memo_cmt_like;
	}

}
