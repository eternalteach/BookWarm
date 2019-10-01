package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;

public interface CommunityBoardCommentMapper {

	public int getNumberOfCommentOnCommunityBoardPost();
	
	public int insertComment(CommunityBoardCommentVO communityBoardCommentVO);
	
	public CommunityBoardCommentVO readComment(@Param("comm_cmt_no")int comm_cmt_no,@Param("user_id")String user_id);
	
	public int deleteComment(int comm_cmt_no);

	public int deleteAllPostComments(int comm_no);
	
	public int updateComment(CommunityBoardCommentVO communityBoardCommentVO);
	
	public List<CommunityBoardCommentVO> getCommentListWithPaging(@Param("criteria") Criteria criteria,@Param("comm_no")int comm_no);
	
	public int getCountByComm_cmt_no(int comm_cmt_no);
}