package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;


public interface ShopListMapper {
	
	//book_title 순서
	public List<BookVO> shoptitlelist();
	
	//book detail(상세정보) 불러오기
	public List<BookVO> bookdetail(@Param("isbn") String isbn, @Param("writer_name") String writer_name);
	
	//bookwritername 저자이름이 같은 책 불러오기
	public List<BookVO> bookwritername(@Param("writer_name") String writer_name);
	
	/*
	 * public List<ShopListBoardVO> shoplist2();
	 * 
	 * public ShopListBoardVO bookdetail(String isbn);
	 * 
	 * public List<ShopListBoardVO> bookgenre(String isbn);
	 * 
	 * public List<ShopListBoardVO> bookwriter(String writer_name);
	 * 
	 * public List<ShopListBoardVO> shoplistpage(Criteria criteria);
	 * 
	 * public int gettotalcount(Criteria criteria);
	 */
	
}
