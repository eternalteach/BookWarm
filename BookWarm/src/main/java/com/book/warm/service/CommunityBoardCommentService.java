package com.book.warm.service;

import java.util.List;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;

public interface CommunityBoardCommentService {

	public int register(CommunityBoardCommentVO communityBoardCommentVO);

	public CommunityBoardCommentVO get(int comm_cmt_no);

	public int modify(CommunityBoardCommentVO communityBoardCommentVO);

	public int remove(int comm_cmt_no);

	public List<CommunityBoardCommentVO> getList(Criteria criteria, int comm_no);
}
