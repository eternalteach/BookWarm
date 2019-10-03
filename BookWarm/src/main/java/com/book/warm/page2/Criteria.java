package com.book.warm.page2;

public class Criteria {
	private int page; // 보여줄 페이지
	private int perPageNum; // 페이지당 보여줄 페이지 수
	
	// 페이지 클릭했을 때, 보이는 게시물의 시작 번호와 끝번호
	private int startNum;
	private int endNum;
	
	///////////////////////////////////////////////
	public Criteria() { // 최초 default 생성자로 기본 객체 생성시 초기값을 지정한다.(1페이지, 10개씩)
		this.page = 1; // 사용자가 세팅하지 않으면 기본 1
		this.perPageNum = 10; // 페이지당 기본 10개씩 출력 하도록 세팅
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page<=0) {
			// 페이지는 1페이지 부터이므로 0보다 작거나 같은 값일 경우 무조건 첫 번째 페이지로 설정 되도록 해준다.
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) { // 100 이상은 셋팅이 되지 않게끔
		if(perPageNum<=0 || perPageNum>100) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
	}
	
	public int getStartNum() {
		
		if(page == 1)
			startNum = 1;
		else
			startNum = getEndNum() - perPageNum+1;
		System.out.println("시작 번호 : " + startNum);
		
		return startNum;
	}
	
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	public int getEndNum() {
		endNum=page*getPerPageNum();
		System.out.println("마지막 번호 : " + endNum);
		
		return endNum;
	}
	
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
}
