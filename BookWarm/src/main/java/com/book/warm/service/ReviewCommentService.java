package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.ReviewCommentMapper;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewCommentVO;


@Service
public class ReviewCommentService {
	
	@Inject
	ReviewCommentMapper rcm;
	
	public int register(ReviewCommentVO vo) {
		System.out.println("리뷰 커멘트 매퍼 오나요?");
		return rcm.insert(vo);
	}
	
	public ReviewCommentVO get(int review_cmt_no) {
		
		return rcm.read(review_cmt_no);
	};
	
	public int remove(int review_cmt_no) {
		return rcm.delete(review_cmt_no);
	}
	
	public int modify(ReviewCommentVO vo) {
		return rcm.update(vo);
	}
	
	public List<ReviewCommentVO> getList(Criteria cri, int review_no) {
		return rcm.getListWithPaging(cri, review_no);
	}
	
}
