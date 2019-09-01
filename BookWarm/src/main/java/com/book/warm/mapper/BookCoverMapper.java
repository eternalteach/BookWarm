package com.book.warm.mapper;

import org.springframework.stereotype.Service;

import com.book.warm.vo.BookCoverVO;

@Service
public interface BookCoverMapper {

	public BookCoverVO getBookImg (String isbn);
	
}
