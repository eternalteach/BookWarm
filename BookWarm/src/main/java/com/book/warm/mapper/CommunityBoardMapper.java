package com.book.warm.mapper;

import java.util.ArrayList;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardVO;

public interface CommunityBoardMapper {

	public int getNumberOfPostsOnCommunityBoard();
	
	public ArrayList<CommunityBoardVO> getCommunityBoardListWithPaging(Criteria criteria);

	public CommunityBoardVO getCommunityBoardOne(int comm_no);

	public Integer getCommunityBoardOneDelete(int comm_no);

	public Integer modifyCommunityBoardOne(CommunityBoardVO communityBoardVO);

	public Integer insertCommunityBoardWrite(CommunityBoardVO communityBoardVO);

	public Integer insertCommunityBoardReplyWrite(CommunityBoardVO communityBoardVO);
	
	public Integer replyshape(CommunityBoardVO communityBoardVO);
}
