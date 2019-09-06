package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;

public interface CommunityBoardCommentMapper {

	public int getNumberOfCommentOnCommunityBoardPost();
	
	public int insertComment(CommunityBoardCommentVO communityBoardCommentVO);
	
	public CommunityBoardCommentVO readComment(int comm_cmt_no);
	
	public int deleteComment(int comm_cmt_no);
	
	public int updateComment(CommunityBoardCommentVO communityBoardCommentVO);
	
	public List<CommunityBoardCommentVO> getCommentListWithPaging(@Param("criteria") Criteria criteria,@Param("comm_no")int comm_no);
	
	
}