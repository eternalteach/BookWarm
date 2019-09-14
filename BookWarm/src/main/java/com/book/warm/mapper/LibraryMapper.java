package com.book.warm.mapper;

import com.book.warm.vo.LibraryVO;

public interface LibraryMapper {

	public int addMyBook(LibraryVO libraryVO); //서비스 만들어서 있으면 등록 안하고, 없으면 등록하게 설정해야 한다.

	public int getListNoCnt(int list_no);
	
	
}
