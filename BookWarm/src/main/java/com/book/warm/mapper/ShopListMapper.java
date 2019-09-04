package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ShopListBoardVO;

public interface ShopListMapper {
	
	////isbn 순서로 불러오기
	public List<ShopListBoardVO> shoplist();
	
	//제목순(ㄱㄴㄷㄹ)순으로 불러오기
	public List<ShopListBoardVO> shoplist2();
	
	//책 눌렀을때 상세페이지 이동
	public ShopListBoardVO bookdetail(String isbn);
	
	//책에 대한 장르 가져오기
	public List<ShopListBoardVO> bookgenre(String isbn);
	
	//저자이름이 같은 책 불러오기
	public List<ShopListBoardVO> bookwriter(String writer_name);
	
	//페이징 처리
	public List<ShopListBoardVO> shoplistpage(Criteria criteria);
	public List<ShopListBoardVO> shoplistpage2(Criteria criteria);
	
	
	public int gettotalcount(Criteria criteria);
}
