package com.book.warm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.CommunityCommentPageDTO;
import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;


public interface CommunityBoardCommentService {

	public int register(CommunityBoardCommentVO communityBoardCommentVO);

	public CommunityBoardCommentVO get(@Param("comm_cmt_no")int comm_cmt_no,@Param("user_id")String user_id);

	public int modify(CommunityBoardCommentVO communityBoardCommentVO);

	public int remove(int comm_cmt_no);

	public List<CommunityBoardCommentVO> getList(Criteria criteria, int comm_no);
	
	public CommunityCommentPageDTO getListPage(Criteria criteria, int comm_cmt_no);
}
