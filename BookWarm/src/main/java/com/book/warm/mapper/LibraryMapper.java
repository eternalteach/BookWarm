package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.BookVO;
import com.book.warm.vo.LibraryVO;

public interface LibraryMapper {

	public int addMyBook(LibraryVO libraryVO); //서비스 만들어서 있으면 등록 안하고, 없으면 등록하게 설정해야 한다.

	public int getListNoCnt(int list_no);

	public List<LibraryVO> getLibraryBooks(String user_id);

	public int deleteLibraryList(@Param("user_id")String user_id, @Param("isbn")String isbn);
	
	public int deleteMyBook(@Param("user_id")String user_id, @Param("isbn")String isbn);
	
	public List<BookVO> getMyList(String user_id);
}
