package com.book.warm.vo;

public class CommunityBoardVO {
	private int commNo;
	private String userId;
	private String commSbject;
	private String commTitle;
	private String commContent;
	private String commWrittenTime;
	private int commClicked;
	private int commGroup;
	private int commStep;
	private int commIndent;

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommSbject() {
		return commSbject;
	}

	public void setCommSbject(String commSbject) {
		this.commSbject = commSbject;
	}

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public String getCommWrittenTime() {
		return commWrittenTime;
	}

	public void setCommWrittenTime(String commWrittenTime) {
		this.commWrittenTime = commWrittenTime;
	}

	public int getCommClicked() {
		return commClicked;
	}

	public void setCommClicked(int commClicked) {
		this.commClicked = commClicked;
	}

	public int getCommGroup() {
		return commGroup;
	}

	public void setCommGroup(int commGroup) {
		this.commGroup = commGroup;
	}

	public int getCommStep() {
		return commStep;
	}

	public void setCommStep(int commStep) {
		this.commStep = commStep;
	}

	public int getCommIndent() {
		return commIndent;
	}

	public void setCommIndent(int commIndent) {
		this.commIndent = commIndent;
	}

	public CommunityBoardVO(int commNo, String userId, String commSbject, String commTitle, String commContent,
			String commWrittenTime, int commClicked, int commGroup, int commStep, int commIndent) {
		super();
		this.commNo = commNo;
		this.userId = userId;
		this.commSbject = commSbject;
		this.commTitle = commTitle;
		this.commContent = commContent;
		this.commWrittenTime = commWrittenTime;
		this.commClicked = commClicked;
		this.commGroup = commGroup;
		this.commStep = commStep;
		this.commIndent = commIndent;
	}

	public CommunityBoardVO() {
		super();
	}

}
