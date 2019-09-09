package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ShopListBoardVO;

public interface ShopListMapper {
	
	// isbn 순 리스트
	public List<ShopListBoardVO> shoplist();
	// 제목 순 리스트
	public List<ShopListBoardVO> shoplist2();
	// 상세정보 불러오기
	public ShopListBoardVO bookdetail(String isbn);
	// 장르 불러오기
	public List<ShopListBoardVO> bookgenre(String isbn);
	// 저자 불러오기
	public List<ShopListBoardVO> bookwriter(String writer_name);
	// 페이징 처리
	public List<ShopListBoardVO> shoplistpage(Criteria criteria);
	// 총 페이지 수
	public int gettotalcount(Criteria criteria);
	
}
