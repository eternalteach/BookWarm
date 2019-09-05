package com.book.warm.mapper;

import java.util.ArrayList;

import com.book.warm.vo.CommunityBoardVO;

public interface CommunityBoardMapper {

	public ArrayList<CommunityBoardVO> getCommunityBoardList();

	public CommunityBoardVO getCommunityBoardOne(String comm_no);

	public int getCommunityBoardOneDelete(String comm_no);

	public int modifyCommunityBoardOne(CommunityBoardVO communityBoardVO);

	public int insertCommunityBoardWrite(CommunityBoardVO communityBoardVO);

	public int insertCommunityBoardReplyWrite(CommunityBoardVO communityBoardVO);
	
	public int replyshape(CommunityBoardVO communityBoardVO);
}
