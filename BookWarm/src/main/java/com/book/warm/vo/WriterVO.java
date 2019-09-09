package com.book.warm.vo;

public class WriterVO {
	
	private int writer_no;
	private String writer_name;
	private String writer_info;
	public int getWriter_no() {
		return writer_no;
	}
	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getWriter_info() {
		return writer_info;
	}
	public void setWriter_info(String writer_info) {
		this.writer_info = writer_info;
	}
	public WriterVO(int writer_no, String writer_name, String writer_info) {
		super();
		this.writer_no = writer_no;
		this.writer_name = writer_name;
		this.writer_info = writer_info;
	}
	public WriterVO() {
		super();
	}
	
	
}
