package com.book.warm.vo;

import java.sql.Timestamp;

public class ReviewBoardVO2 {

	private String opinion_no;
	private String user_id;
	private Timestamp opinion_written_date;
	private Timestamp opinion_modify_date;
	private String isbn;
	private int opinion_ref;
	private String opinion_title;
	private String opinion_content;
	private String opinion_open;
	private int rk;
	private String isbn_1;
	private String img_src;
	
	public ReviewBoardVO2() {
		super();
	}

	public ReviewBoardVO2(String opinion_no, String user_id, Timestamp opinion_written_date,
			Timestamp opinion_modify_date, String isbn, int opinion_ref, String opinion_title, String opinion_content,
			String opinion_open, int rk, String isbn_1, String img_src) {
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
		this.rk = rk;
		this.isbn_1 = isbn_1;
		this.img_src = img_src;
	}

	protected String getOpinion_no() {
		return opinion_no;
	}

	protected void setOpinion_no(String opinion_no) {
		this.opinion_no = opinion_no;
	}

	protected String getUser_id() {
		return user_id;
	}

	protected void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	protected Timestamp getOpinion_written_date() {
		return opinion_written_date;
	}

	protected void setOpinion_written_date(Timestamp opinion_written_date) {
		this.opinion_written_date = opinion_written_date;
	}

	protected Timestamp getOpinion_modify_date() {
		return opinion_modify_date;
	}

	protected void setOpinion_modify_date(Timestamp opinion_modify_date) {
		this.opinion_modify_date = opinion_modify_date;
	}

	protected String getIsbn() {
		return isbn;
	}

	protected void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	protected int getOpinion_ref() {
		return opinion_ref;
	}

	protected void setOpinion_ref(int opinion_ref) {
		this.opinion_ref = opinion_ref;
	}

	protected String getOpinion_title() {
		return opinion_title;
	}

	protected void setOpinion_title(String opinion_title) {
		this.opinion_title = opinion_title;
	}

	protected String getOpinion_content() {
		return opinion_content;
	}

	protected void setOpinion_content(String opinion_content) {
		this.opinion_content = opinion_content;
	}

	protected String getOpinion_open() {
		return opinion_open;
	}

	protected void setOpinion_open(String opinion_open) {
		this.opinion_open = opinion_open;
	}

	protected int getRk() {
		return rk;
	}

	protected void setRk(int rk) {
		this.rk = rk;
	}

	protected String getIsbn_1() {
		return isbn_1;
	}

	protected void setIsbn_1(String isbn_1) {
		this.isbn_1 = isbn_1;
	}

	protected String getImg_src() {
		return img_src;
	}

	protected void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	
	
}
