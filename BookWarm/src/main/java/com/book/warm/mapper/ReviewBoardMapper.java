package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.CouponNoVO;
import com.book.warm.vo.ReviewAttachVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewMainVO;

public interface ReviewBoardMapper {
	

	public List<ReviewMainVO> selectBoardList(String user_id);
	
	public List<ReviewMainVO> selectBoardListWithPaging(String user_id, Criteria cri);
	
	public List<ReviewBoardVO> getListPerBook(String isbn, String user_id);
	
	public List<ReviewBoardVO> getListPerBookWithPaging(String isbn, String user_id, Criteria cri);

	public BookVO showBookThumbnail(String isbn);

	public ReviewBoardVO selectedReview(int review_no);
	
	public BookVO bookInfo(String isbn);

	public int registerReview(ReviewBoardVO rbVO);
	
	public int registerReviewSelectKey(ReviewBoardVO rbVO);

	public int deleteReview(ReviewBoardVO rbVO);

	public int modifyReview(ReviewBoardVO rbVO);
	
	public int modifyReviewAdmin(ReviewBoardVO rbVO);
	
	public int getBoardListCount(String user_id);
	
	public int getTotalCount(Criteria cri, String isbn, String user_id);
	
	public List<ReviewAttachVO> getAttachList(int review_no);
	
	// 泥⑤��뙆�씪 泥섎━. �뵲濡� mapper 留뚮뱾吏� �븡怨� review�뿉 異붽�.
	public void insert(ReviewAttachVO vo);
	
	public void delete(String uuid);
	
	public List<ReviewAttachVO> findByReviewNo(int review_no);
	
	public void deleteAll(int review_no);
	
	public List<ReviewAttachVO> getOldFiles();

	// 매일 00시에 coupon_no테이블(coupon_available 컬럼) 갱신
	public List<CouponNoVO> compareCouponTime();

	public void changeCouponAvailable(CouponNoVO couponNoVO);
	
	public List<ReviewBoardVO> getOpenReview();

	public BookVO getLibNewbie(String user_id);

}
