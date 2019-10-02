package com.book.warm.mapper;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.BookVO;

public interface BookMapper {

	public BookVO getBook(String isbn);

	public Integer checkUserBook(@Param("isbn")String isbn,@Param("user_id")String user_id);
}
