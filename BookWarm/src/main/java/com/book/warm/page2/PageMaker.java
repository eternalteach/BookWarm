package com.book.warm.page2;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageMaker {
	private Criteria cri; // page, perPageNum을 가지고 있음.
	private int totalCount; // 전체 게시글 수, 가장 먼저 계산되어야 함.
	
	// [11][12][13][14]...[20] : 현재 페이지가 13일 때, startPage는 11, endPage
	private int startPage; // 게시글 번호에 따른(보여지는) 페이지의 시작 번호
	private int endPage; // 게시글 번호에 따른(보여지는) 페이지의 마지막 번호 
	
	private boolean prev; // 이전 버튼을 누를 수 있는 경우 / 없는 경우 분류를 위함
	private boolean next;
	
	private int displayPageNum = 10; // 화면 하단에 보여지는 페이지 갯수
	
	private int tempEndPage; // 몇 번째 페이지까지 있는지
	
	/////////////////////////////////////////////////////
	
	// 1. 전제 게시글 수가 몇개인지 가장 먼저 계산한다.
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	// 전체 필드 변수를 세팅 : 전체 게시글 수의 setter가 호출될 때 전체 세팅도 되도록 함.
	private void calcData() {
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage = endPage - displayPageNum + 1;
		
		// 전체 총 페이지 수 :
		// totalCount = select count(*) from tbl_count의 결과값
		// pageInfo.getPerPageNum = 한 화면에 출력할 행의 개수
		// ex) totalCount = 512
		// pageInfo.getperPageNum = 10
		// tempEndPage = ceil(512/10) = 52
		// 51.2의 결과를 올림 => 51페이지까지는 한 화면 당 10개의 게시물이 출력
		// 마지막 52페이지에는 0.2에 해당하는 2개의 게시물이 출력
		
		// tempEndPage == 52페이지 && endPage == 60페이지인 경우(
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = (startPage==1) ? false : true;
		// => 1~10페이지를 출력할 때에는 좌측의 '<<'버튼 생략
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		System.out.println("prev : " + prev);
		
		// => 총 100페이지, 출력하는 페이지가 90~100일 때, 우측의 '>>'버튼 생략
		next = (endPage * cri.getPerPageNum()) >= totalCount ? false : true;
		System.out.println("next"+next);
	}
	
	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	// get방식 문자 처리
	public String makeQuery(int page) {
		UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("page", page) // page = 3
				.queryParam("perPageNum", cri.getPerPageNum()) // page=3&perPageNum=10
				.build(); // ?page=3&perPageNum=10
		return uriComponentsBuilder.toUriString(); // ?page=3&perPageNum=10의 값을 리턴
	}
	
	
}
