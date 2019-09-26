package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.warm.mapper.AdminMapper;
import com.book.warm.mapper.ReviewBoardMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.ReviewAttachVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewMainVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewBoardService {
	
	@Inject
	ReviewBoardMapper mapper;
	
	@Inject
	AdminMapper adminMapper;

//	public List<ReviewMainVO> selectBoardList(String user_id) {
//		
//		return mapper.selectBoardList(user_id);
//	}
	
	public List<ReviewMainVO> selectBoardList(String user_id, Criteria cri) {
		log.info("=============== selectBoardList() ===============");
		return mapper.selectBoardListWithPaging(user_id, cri);
	}
	
	public List<ReviewBoardVO> getListPerBook(String isbn, String user_id, Criteria cri) {
		log.info("=============== showBookThumbnail() ===============");
		return mapper.getListPerBookWithPaging(isbn, user_id, cri);
	}
	
	public BookVO showBookThumbnail(String isbn) {
		log.info("=============== showBookThumbnail() ===============");
		return mapper.showBookThumbnail(isbn);
	}

	public ReviewBoardVO selectedReview(int review_no) {
		return mapper.selectedReview(review_no);
	}

	public BookVO bookInfo(String isbn) {
		log.info("=============== bookInfo() ===============");
		return mapper.bookInfo(isbn);
	}

	@Transactional
	public void registerReview(ReviewBoardVO rbVO) {
		log.info("=============== registerReview() ===============");
		log.info("register: " + rbVO);
		mapper.registerReviewSelectKey(rbVO);
		
		if(rbVO.getAttachList() == null || rbVO.getAttachList().size() <= 0) {
			return;
		}
		
		rbVO.getAttachList().forEach(attach -> {
			
			attach.setReview_no(rbVO.getReview_no());
			mapper.insert(attach);
		});
		
//		return mapper.registerReview(rbVO);
	}
	
	@Transactional
	public int deleteReview(ReviewBoardVO rbVO) {
		log.info("=============== deleteReview() ===============");
		// review 삭제시 첨부파일도 함께 삭제
		mapper.deleteAll(rbVO.getReview_no());
		return mapper.deleteReview(rbVO);
	}

	@Transactional
	public boolean modifyReview(ReviewBoardVO rbVO) {
		log.info("=============== modifyReview() ===============");
		mapper.deleteAll(rbVO.getReview_no());
		boolean modifyResult = mapper.modifyReview(rbVO) == 1;
		
		if(modifyResult && rbVO.getAttachList() != null && rbVO.getAttachList().size() > 0) {
			rbVO.getAttachList().forEach(attach -> {
				attach.setReview_no(rbVO.getReview_no());
				mapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	
	// reviewMain에서 리뷰가 작성된 책의 수를 셀 때는 매개변수로 user_id만 넘겨준다.
	public int getTotal(String user_id) {
		log.info("=============== getTotal() ===============");
		return mapper.getBoardListCount(user_id);
	}
	// reviewPerBook에서 하나의 책에 작성된 리뷰의 수를 셀 때. 메서드 오버로딩.
	public int getTotal(Criteria cri, String isbn, String user_id) {
		log.info("=============== getTotal() ===============");
		return mapper.getTotalCount(cri, isbn, user_id);
	}
	
	public List<ReviewAttachVO> getAttachList(int review_no) {
		log.info("=============== getAttachList() ===============");
		log.info("get Attach list by review_no" + review_no);
		return mapper.findByReviewNo(review_no);
	}

	
	@Transactional
	public int modifyAdmin(ReviewBoardVO rbVO) {
		log.info("=============== modifyAdmin() ===============");
		// 1.관리자 attach로 복사
		adminMapper.cloneAttach(rbVO.getReview_no());
		
		// 2. 게시글 attach 삭제
		mapper.deleteAll(rbVO.getReview_no());
		
		// 4. 여기서 보드 내용 수정
		int result= mapper.modifyReviewAdmin(rbVO);
		
		return result;
	}

}
