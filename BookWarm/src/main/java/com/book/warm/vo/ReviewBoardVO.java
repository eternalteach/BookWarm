package com.book.warm.vo;

import java.sql.Timestamp;
import java.util.List;

public class ReviewBoardVO {

	private int review_no;
	private String user_id;
	private Timestamp review_written_date;
	private Timestamp review_modify_date;
	private String isbn;
	private int review_ref;
	private String review_title;
	private String review_content;
	private String review_open;
	
	//private int commentCnt; //댓글 수 표시하기 위한 부분. 추후 처리.
	
	private List<ReviewAttachVO> attachList;
	
	public ReviewBoardVO() {
		super();
	}


	public ReviewBoardVO(int review_no, String user_id, Timestamp review_written_date, Timestamp review_modify_date,
			String isbn, int review_ref, String review_title, String review_content, String review_open) {
		super();
		this.review_no = review_no;
		this.user_id = user_id;
		this.review_written_date = review_written_date;
		this.review_modify_date = review_modify_date;
		this.isbn = isbn;
		this.review_ref = review_ref;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_open = review_open;
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
	public Timestamp getReview_written_date() {
		return review_written_date;
	}
	public void setReview_written_date(Timestamp review_written_date) {
		this.review_written_date = review_written_date;
	}
	public Timestamp getReview_modify_date() {
		return review_modify_date;
	}
	public void setReview_modify_date(Timestamp review_modify_date) {
		this.review_modify_date = review_modify_date;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getReview_ref() {
		return review_ref;
	}
	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_open() {
		
		if(review_open == null || review_open.equals(""))
			review_open = "";
		else
			review_open = "checked";
		
		return review_open;
	}
	public void setReview_open(String review_open) {
		this.review_open = review_open;
	}
	
	
	
	
}
