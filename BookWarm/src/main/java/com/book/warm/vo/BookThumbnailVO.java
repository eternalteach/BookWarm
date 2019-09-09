package com.book.warm.vo;

public class BookThumbnailVO {
	
	private String img_src;
	private String book_title;
	private String writer_name;
	
	public BookThumbnailVO() {
		super();
	}

	public BookThumbnailVO(String img_src, String book_title, String writer_name) {
		super();
		this.img_src = img_src;
		this.book_title = book_title;
		this.writer_name = writer_name;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	
	
}
