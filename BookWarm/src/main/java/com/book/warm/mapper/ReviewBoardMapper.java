package com.book.warm.mapper;

import java.util.List;

import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.ReviewAttachVO;
import com.book.warm.vo.ReviewBoardVO;

public interface ReviewBoardMapper {
	

//	public List<ReviewBoardVO> selectBoardList(String user_id);
	
	public List<ReviewBoardVO> getListPerBook(String isbn, String user_id);
	
	public List<ReviewBoardVO> getListPerBookWithPaging(String isbn, String user_id, Criteria cri);

	public BookVO showBookThumbnail(String isbn);

	public ReviewBoardVO selectedReview(int review_no, String user_id);

	public BookVO bookInfo(String isbn);

	public int registerReview(ReviewBoardVO rbVO);
	
	public int registerReviewSelectKey(ReviewBoardVO rbVO);

	public int deleteReview(ReviewBoardVO rbVO);

	public int modifyReview(ReviewBoardVO rbVO);
	
	public int getTotalCount(Criteria cri, String isbn, String user_id);
	
	public List<ReviewAttachVO> getAttachList(int review_no);
	
	// 泥⑤��뙆�씪 泥섎━. �뵲濡� mapper 留뚮뱾吏� �븡怨� review�뿉 異붽�.
	public void insert(ReviewAttachVO vo);
	
	public void delete(String uuid);
	
	public List<ReviewAttachVO> findByReviewNo(int review_no);

}
