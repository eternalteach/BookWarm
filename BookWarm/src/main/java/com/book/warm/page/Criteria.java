package com.book.warm.page;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

	private int pageNum;
	private int amount;

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public Criteria() {
		this(1,5);
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum",  this.pageNum)
				.queryParam("amount", this.getAmount());
		return builder.toUriString();
	}

}
