package com.book.warm.vo;

import java.sql.Timestamp;


public class ReviewReplyVO {
	
	private int review_re_no;
	private int review_no;
	private String user_id;
	private String review_re_content;
	private Timestamp review_re_written_date;
	private Timestamp review_re_modified_date;
	
	
	public ReviewReplyVO() {
		super();
	}
	
	
	public ReviewReplyVO(int review_re_no, int review_no, String user_id, String review_re_content,
			Timestamp review_re_written_date, Timestamp review_re_modified_date) {
		super();
		this.review_re_no = review_re_no;
		this.review_no = review_no;
		this.user_id = user_id;
		this.review_re_content = review_re_content;
		this.review_re_written_date = review_re_written_date;
		this.review_re_modified_date = review_re_modified_date;
	}
	public int getReview_re_no() {
		return review_re_no;
	}
	public void setReview_re_no(int review_re_no) {
		this.review_re_no = review_re_no;
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
	public String getReview_re_content() {
		return review_re_content;
	}
	public void setReview_re_content(String review_re_content) {
		this.review_re_content = review_re_content;
	}
	public Timestamp getReview_re_written_date() {
		return review_re_written_date;
	}
	public void setReview_re_written_date(Timestamp review_re_written_date) {
		this.review_re_written_date = review_re_written_date;
	}
	public Timestamp getReview_re_modified_date() {
		return review_re_modified_date;
	}
	public void setReview_re_modified_date(Timestamp review_re_modified_date) {
		this.review_re_modified_date = review_re_modified_date;
	}
	
	
	
}
