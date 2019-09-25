package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.AdminBoardVO;
import com.book.warm.vo.CommunityBoardVO;
import com.book.warm.vo.ReviewBoardVO;

public interface AdminMapper {

	public List<AdminBoardVO> getAdminBoard();
	
	public int addAdminBoardFromCommunityBoard(CommunityBoardVO communityBoardVO);
	
	public int addAdminBoardFromReviewBoard(ReviewBoardVO reviewBoardVO);
	
}
