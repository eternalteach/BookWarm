package com.book.warm.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.BookLoveMapper;
import com.book.warm.vo.BookLoveVO;

@Service
public class BookLoveService {

	@Inject
	BookLoveMapper booklovemapper;
	
	public void insertlove(BookLoveVO booklovevo) {
		booklovemapper.insertlove(booklovevo);
	}
	public void deletelove(int book_love) {
		booklovemapper.deletelove(book_love);
	}

}
