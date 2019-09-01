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

	public List<ReviewBoardVO> selectListPerBook(String isbn, String user_id) {

		return rbm.selectListPerBook(isbn, user_id);
	}
	
	public BookThumbnailVO showBookThumbnail(String isbn) {
		System.out.println("showBookThumbnail진입, isbn은: " + isbn);
		System.out.println("BookThumbnail: " + rbm.showBookThumbnail(isbn));
		return rbm.showBookThumbnail(isbn);
	}

	public ReviewBoardVO selectedReview(int review_no) {
		return rbm.selectedReview(review_no);
	}

	public BookVO bookInfo(String isbn) {
		// TODO Auto-generated method stub
		return rbm.bookInfo(isbn);
	}

	public int registerReview(ReviewBoardVO rbVO) {
		
		//checkbox가 체크되어 있으면 Y, 아니면 N(비공개)
		if(rbVO.getReview_open().equals("on")) 
			rbVO.setReview_open("Y");
		else
			rbVO.setReview_open("N");
		
		return rbm.registerReview(rbVO);
	}

	public int deleteReview(ReviewBoardVO rbVO) {

		return rbm.deleteReview(rbVO);
	}

	public int modifyReview(ReviewBoardVO rbVO) {
		
		if(rbVO.getReview_open().equals("on")) 
			rbVO.setReview_open("Y");
		else
			rbVO.setReview_open("N");
		
		return rbm.modifyReview(rbVO);
	}
}
