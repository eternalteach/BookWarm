package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.BookLikeMapper;
import com.book.warm.vo.BookLikeVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BookLikeService {

	@Inject
	BookLikeMapper bookLikeMapper;

	public int addBookLike(BookLikeVO bookLikeVO) {
		log.info("========== addBookLike() ==========");
		return bookLikeMapper.addBookLike(bookLikeVO);
	}

	public int checkBookLikeAboutISBN(BookLikeVO bookLikeVO) {
		log.info("========== checkBookLikeAboutISBN() ==========");
		return bookLikeMapper.checkBookLikeAboutISBN(bookLikeVO);
	}

	public int removeBookLikeAboutISBN(BookLikeVO bookLikeVO) {
		log.info("========== removeBookLikeAboutISBN() ==========");
		return bookLikeMapper.removeBookLikeAboutISBN(bookLikeVO);
	}

	public List<BookLikeVO> getListMyBookLike(String user_id) {
		log.info("========== getListMyBookLike() ==========");
		return bookLikeMapper.getListMyBookLike(user_id);
	}
}
