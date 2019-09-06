package com.book.warm.vo;

import java.sql.Timestamp;


public class ReviewCommentVO {
	
	private int review_cmt_no;
	private int review_no;
	private String user_id;
	private String review_cmt_content;
	private Timestamp review_cmt_written_date;
	private Timestamp review_cmt_modified_date;
	
	
	public ReviewCommentVO() {
		super();
	}

	public ReviewCommentVO(int review_cmt_no, int review_no, String user_id, String review_cmt_content,
			Timestamp review_cmt_written_date, Timestamp review_cmt_modified_date) {
		super();
		this.review_cmt_no = review_cmt_no;
		this.review_no = review_no;
		this.user_id = user_id;
		this.review_cmt_content = review_cmt_content;
		this.review_cmt_written_date = review_cmt_written_date;
		this.review_cmt_modified_date = review_cmt_modified_date;
	}

	public int getReview_cmt_no() {
		return review_cmt_no;
	}

	public void setReview_cmt_no(int review_cmt_no) {
		this.review_cmt_no = review_cmt_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReview_cmt_content() {
		return review_cmt_content;
	}

	public void setReview_cmt_content(String review_cmt_content) {
		this.review_cmt_content = review_cmt_content;
	}

	public Timestamp getReview_cmt_written_date() {
		return review_cmt_written_date;
	}

	public void setReview_cmt_written_date(Timestamp review_cmt_written_date) {
		this.review_cmt_written_date = review_cmt_written_date;
	}

	public Timestamp getReview_cmt_modified_date() {
		return review_cmt_modified_date;
	}

	public void setReview_cmt_modified_date(Timestamp review_cmt_modified_date) {
		this.review_cmt_modified_date = review_cmt_modified_date;
	}
	
	
	
	
}
