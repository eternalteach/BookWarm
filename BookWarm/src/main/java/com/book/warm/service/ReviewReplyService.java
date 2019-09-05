package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.ReviewReplyMapper;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewReplyVO;


@Service
public class ReviewReplyService {
	
	@Inject
	ReviewReplyMapper rrm;
	
	public int register(ReviewReplyVO vo) {
		
		return rrm.insert(vo);
	}
	
	public ReviewReplyVO get(int review_re_no) {
		
		return rrm.read(review_re_no);
	};
	
	public int remove(int review_re_no) {
		return rrm.delete(review_re_no);
	}
	
	public int modify(ReviewReplyVO vo) {
		return rrm.update(vo);
	}
	
	public List<ReviewReplyVO> getList(Criteria cri, int review_no) {
		return rrm.getListWithPaging(cri, review_no);
	}
	
}
