package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.BookLikeVO2;
import com.book.warm.vo.BookListVO;


public interface ShopListMapper {
	
	//book_title 순서
	public List<BookListVO> shoptitlelist();
	//bookprice(저렴) tnstj
	public List<BookListVO> bookpricelist();
	//(고가)
	public List<BookLikeVO2> bookpricelist2();
	//좋아하는 순
	public List<BookLikeVO2> booklike(@Param("user_id") String user_id);
	//book detail(상세정보) 불러오기
	public BookListVO bookdetail(@Param("isbn") String isbn);
	//bookwritername 저자이름이 같은 책 불러오기
	public List<BookListVO> bookwritername(@Param("author") String author);
}
