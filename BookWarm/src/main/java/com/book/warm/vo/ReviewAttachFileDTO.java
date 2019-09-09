package com.book.warm.vo;

public class ReviewAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	
	public ReviewAttachFileDTO() {
		super();
	}
	
	public ReviewAttachFileDTO(String fileName, String uploadPath, String uuid) {
		super();
		this.fileName = fileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	
}
