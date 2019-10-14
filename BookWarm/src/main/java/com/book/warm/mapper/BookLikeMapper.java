package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.BookLikeVO;

public interface BookLikeMapper {

	public int addBookLike(BookLikeVO bookLikeVO);

	public List<BookLikeVO> getListMyBookLike(String user_id);

	public Integer checkBookLikeAboutISBN(BookLikeVO bookLikeVO);

	public int removeBookLikeAboutISBN(BookLikeVO bookLikeVO);

}
