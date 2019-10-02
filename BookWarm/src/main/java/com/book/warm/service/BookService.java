package com.book.warm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.BookMapper;
import com.book.warm.vo.BookVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BookService {

	@Autowired
	BookMapper mapper;

	public BookVO getBook(String isbn) {
		log.info("========== getBook() ==========");
		return mapper.getBook(isbn);
	}

}
