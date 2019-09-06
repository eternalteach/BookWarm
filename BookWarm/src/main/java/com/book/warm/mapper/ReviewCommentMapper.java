package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewCommentVO;

public interface ReviewCommentMapper {
	
	
	public int insert(ReviewCommentVO vo);
	
	public ReviewCommentVO read(int review_cmt_no);
	
	public int delete(int review_cmt_no);
	
	public int update(ReviewCommentVO vo);
	
	public List<ReviewCommentVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("review_no") int review_no);
}
