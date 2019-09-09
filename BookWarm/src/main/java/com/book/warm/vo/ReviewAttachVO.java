package com.book.warm.vo;

public class ReviewAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int review_no;
	
	
	public ReviewAttachVO() {
		super();
	}


	public ReviewAttachVO(String uuid, String uploadPath, String fileName, int review_no) {
		super();
		this.uuid = uuid;
		this.uploadPath = uploadPath;
		this.fileName = fileName;
		this.review_no = review_no;
	}


	public String getUuid() {
		return uuid;
	}


	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	public String getUploadPath() {
		return uploadPath;
	}


	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	
	
}
