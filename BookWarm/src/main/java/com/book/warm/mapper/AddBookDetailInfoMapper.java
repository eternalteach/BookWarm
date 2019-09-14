package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.AuthorsVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.TranslatorsVO;

public interface AddBookDetailInfoMapper {

	public int addBook(List<BookVO> bookVOList);

	public int addAuthors(List<AuthorsVO> authorsVOList);

	public int addTranslators(List<TranslatorsVO> translatorsVOList);

	public BookVO getBook(String isbn);

	public AuthorsVO getAuthors(AuthorsVO authorsVO);

	public TranslatorsVO getTranslators(TranslatorsVO translatorsVO);

	public List<BookVO> getBookList();

}
