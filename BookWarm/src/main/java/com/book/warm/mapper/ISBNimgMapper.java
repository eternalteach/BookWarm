package com.book.warm.mapper;

import org.springframework.stereotype.Service;

import com.book.warm.vo.ISBNimgVO;

@Service
public interface ISBNimgMapper {

	public ISBNimgVO getBookImg (String isbn);
	
}
