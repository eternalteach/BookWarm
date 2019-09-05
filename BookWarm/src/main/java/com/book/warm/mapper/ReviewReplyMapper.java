package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewReplyVO;

public interface ReviewReplyMapper {
	
	
	public int insert(ReviewReplyVO vo);
	
	public ReviewReplyVO read(int review_re_no);
	
	public int delete(int review_re_no);
	
	public int update(ReviewReplyVO vo);
	
	public List<ReviewReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("review_no") int review_no);
}
