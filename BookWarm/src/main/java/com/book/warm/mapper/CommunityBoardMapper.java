package com.book.warm.mapper;

import java.util.ArrayList;

import com.book.warm.vo.CommunityBoardVO;

public interface CommunityBoardMapper {

	public ArrayList<CommunityBoardVO> getCommunityBoardList();

	public CommunityBoardVO getCommunityBoardOne(String comm_no);

	public Integer getCommunityBoardOneDelete(String comm_no);

	public Integer modifyCommunityBoardOne(CommunityBoardVO communityBoardVO);

	public Integer insertCommunityBoardWrite(CommunityBoardVO communityBoardVO);
}
