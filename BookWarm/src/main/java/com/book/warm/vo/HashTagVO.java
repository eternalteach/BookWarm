package com.book.warm.vo;

public class HashTagVO {
	private int review_no;
	private String tag_name;
	public HashTagVO(int review_no, String tag_name) {
		super();
		this.review_no = review_no;
		this.tag_name = tag_name;
	}
	public HashTagVO() {
		super();
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	
	
	
}
