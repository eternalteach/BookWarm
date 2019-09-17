package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ReviewCommentMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.CommentPageDTO;
import com.book.warm.vo.ReviewCommentVO;


@Service
public class ReviewCommentService {
	
	@Inject
	ReviewCommentMapper mapper;
	
	public int register(ReviewCommentVO vo) {
		return mapper.insert(vo);
	}
	
	public ReviewCommentVO get(int review_cmt_no) {
		
		return mapper.read(review_cmt_no);
	};
	
	public int remove(int review_cmt_no) {
		return mapper.delete(review_cmt_no);
	}
	
	public int modify(ReviewCommentVO vo) {
		return mapper.update(vo);
	}
	
	public List<ReviewCommentVO> getList(Criteria cri, int review_no) {
		return mapper.getListWithPaging(cri, review_no);
	}
	
	public CommentPageDTO getListPage(Criteria cri, int review_no) {
		
		return new CommentPageDTO(
				mapper.getCountByReviewNo(review_no),
				mapper.getListWithPaging(cri, review_no));
	}
	
	public List<ReviewCommentVO> getCommentsOnMyReview(String user_id) {
		return mapper.getCommentsOnMyReview(user_id);
	}

	
}
