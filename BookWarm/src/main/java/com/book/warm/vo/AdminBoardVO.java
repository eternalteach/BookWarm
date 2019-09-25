package com.book.warm.vo;

import java.sql.Timestamp;

public class AdminBoardVO {
	private int admin_bno;
	private String user_id;
	private int board_no; // 삭제된 글 번호
	private String board_name; // 삭제된 글 게시판 이름
	private String board_subject; // 삭제된 글 말머리
	private String board_title; // 삭제된 글 제목
	private String board_content; // 삭제된 글 내용
	private Timestamp board_written_time; // 삭제된 글 작성일
	private Timestamp board_modify_time; // 삭제된 글 수정일
	private int board_clicked;// 삭제된 글 조회수
	private int board_like; // 삭제된 글 좋아요
	private int board_group;
	private int board_step;
	private int board_indent;
	private String isbn;
	private int board_ref;
	private String board_open;

	public AdminBoardVO(int admin_bno, String user_id, int board_no, String board_name, String board_subject,
			String board_title, String board_content, Timestamp board_written_time, Timestamp board_modify_time,
			int board_clicked, int board_like, int board_group, int board_step, int board_indent, String isbn,
			int board_ref, String board_open) {
		super();
		this.admin_bno = admin_bno;
		this.user_id = user_id;
		this.board_no = board_no;
		this.board_name = board_name;
		this.board_subject = board_subject;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_written_time = board_written_time;
		this.board_modify_time = board_modify_time;
		this.board_clicked = board_clicked;
		this.board_like = board_like;
		this.board_group = board_group;
		this.board_step = board_step;
		this.board_indent = board_indent;
		this.isbn = isbn;
		this.board_ref = board_ref;
		this.board_open = board_open;
	}

	public AdminBoardVO() {
		super();
	}

	public int getAdmin_bno() {
		return admin_bno;
	}

	public void setAdmin_bno(int admin_bno) {
		this.admin_bno = admin_bno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Timestamp getBoard_written_time() {
		return board_written_time;
	}

	public void setBoard_written_time(Timestamp board_written_time) {
		this.board_written_time = board_written_time;
	}

	public Timestamp getBoard_modify_time() {
		return board_modify_time;
	}

	public void setBoard_modify_time(Timestamp board_modify_time) {
		this.board_modify_time = board_modify_time;
	}

	public int getBoard_clicked() {
		return board_clicked;
	}

	public void setBoard_clicked(int board_clicked) {
		this.board_clicked = board_clicked;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBoard_step() {
		return board_step;
	}

	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}

	public int getBoard_indent() {
		return board_indent;
	}

	public void setBoard_indent(int board_indent) {
		this.board_indent = board_indent;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getBoard_ref() {
		return board_ref;
	}

	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}

	public String getBoard_open() {
		return board_open;
	}

	public void setBoard_open(String board_open) {
		this.board_open = board_open;
	}

}
