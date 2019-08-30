package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ReviewBoardMapper;
import com.book.warm.vo.BookThumbnailVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewBoardVO2;


@Service
public class ReviewBoardService {
	
	@Inject
	ReviewBoardMapper rbm;
	
	public List<ReviewBoardVO2> selectBoardList() {
		
		return rbm.selectBoardList();
	}

	public List<ReviewBoardVO> selectListPerBook(String isbn) {

		return rbm.selectListPerBook(isbn);
	}
	
	public BookThumbnailVO showBookThumbnail(String isbn) {
		System.out.println("showBookThumbnail진입, isbn은: " + isbn);
		System.out.println("BookThumbnail: " + rbm.showBookThumbnail(isbn));
		return rbm.showBookThumbnail(isbn);
	}

	public ReviewBoardVO selectedReview(String review_no) {
		System.out.println("review_no: " + review_no);
		return rbm.selectedReview(review_no);
	}

	public BookVO bookInfo(String isbn) {
		// TODO Auto-generated method stub
		return rbm.bookInfo(isbn);
	}
}
