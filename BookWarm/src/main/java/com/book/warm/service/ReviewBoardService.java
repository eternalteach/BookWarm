package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ReviewBoardMapper;
import com.book.warm.vo.BookThumbnailVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewBoardVO2;


@Service
public class ReviewBoardService {
	
	@Inject
	ReviewBoardMapper rbm;
	
	public List<ReviewBoardVO2> selectBoardList(String user_id) {
		
		return rbm.selectBoardList(user_id);
	}

	/*
	 * public List<ReviewBoardVO> getListPerBook(String isbn, String user_id) {
	 * 
	 * return rbm.getListPerBook(isbn, user_id); }
	 */
	
	public List<ReviewBoardVO> getListPerBook(String isbn, String user_id, Criteria cri) {

		return rbm.getListPerBookWithPaging(isbn, user_id, cri);
	}
	
	public BookThumbnailVO showBookThumbnail(String isbn) {
		return rbm.showBookThumbnail(isbn);
	}

	public ReviewBoardVO selectedReview(int review_no, String user_id) {
		return rbm.selectedReview(review_no, user_id);
	}

	public BookVO bookInfo(String isbn) {
		return rbm.bookInfo(isbn);
	}

	public int registerReview(ReviewBoardVO rbVO) {
		
		
		return rbm.registerReview(rbVO);
	}

	public int deleteReview(ReviewBoardVO rbVO) {

		return rbm.deleteReview(rbVO);
	}

	public int modifyReview(ReviewBoardVO rbVO) {
		
		return rbm.modifyReview(rbVO);
	}
	
	public int getTotal(Criteria cri, String isbn, String user_id) {
		
		return rbm.getTotalCount(cri, isbn, user_id);
	}
}
