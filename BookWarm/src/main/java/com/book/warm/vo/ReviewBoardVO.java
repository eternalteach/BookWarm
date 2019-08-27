package com.book.warm.vo;

import java.sql.Timestamp;

public class ReviewBoardVO {

	private int opinion_no;
	private String user_id;
	private Timestamp opinion_written_date;
	private Timestamp opinion_modify_date;
	private String isbn;
	private int opinion_ref;
	private String opinion_title;
	private String opinion_content;
	private String opinion_open;
	
	
	
	public ReviewBoardVO() {
		super();
	}


	public ReviewBoardVO(int opinion_no, String user_id, Timestamp opinion_written_date, Timestamp opinion_modify_date,
			String isbn, int opinion_ref, String opinion_title, String opinion_content, String opinion_open) {
		super();
		this.opinion_no = opinion_no;
		this.user_id = user_id;
		this.opinion_written_date = opinion_written_date;
		this.opinion_modify_date = opinion_modify_date;
		this.isbn = isbn;
		this.opinion_ref = opinion_ref;
		this.opinion_title = opinion_title;
		this.opinion_content = opinion_content;
		this.opinion_open = opinion_open;
	}
	
	
	public int getOpinion_no() {
		return opinion_no;
	}
	public void setOpinion_no(int opinion_no) {
		this.opinion_no = opinion_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getOpinion_written_date() {
		return opinion_written_date;
	}
	public void setOpinion_written_date(Timestamp opinion_written_date) {
		this.opinion_written_date = opinion_written_date;
	}
	public Timestamp getOpinion_modify_date() {
		return opinion_modify_date;
	}
	public void setOpinion_modify_date(Timestamp opinion_modify_date) {
		this.opinion_modify_date = opinion_modify_date;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getOpinion_ref() {
		return opinion_ref;
	}
	public void setOpinion_ref(int opinion_ref) {
		this.opinion_ref = opinion_ref;
	}
	public String getOpinion_title() {
		return opinion_title;
	}
	public void setOpinion_title(String opinion_title) {
		this.opinion_title = opinion_title;
	}
	public String getOpinion_content() {
		return opinion_content;
	}
	public void setOpinion_content(String opinion_content) {
		this.opinion_content = opinion_content;
	}
	public String getOpinion_open() {
		return opinion_open;
	}
	public void setOpinion_open(String opinion_open) {
		this.opinion_open = opinion_open;
	}
	
	
	
	
}
