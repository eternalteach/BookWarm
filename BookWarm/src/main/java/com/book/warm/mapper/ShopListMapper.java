package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.ShopListBoardVO;

public interface ShopListMapper {
	
	////베스트 순서로 불러오기
	public List<ShopListBoardVO> shoplist();
	
	//제목순(ㄱㄴㄷㄹ)순으로 불러오기
	public List<ShopListBoardVO> shoplist2();
	
	//책 눌렀을때 상세페이지 이동
	public ShopListBoardVO bookdetail(String isbn);
	
}
