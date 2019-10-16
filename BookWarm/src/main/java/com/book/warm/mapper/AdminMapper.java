package com.book.warm.mapper;

import java.util.List;

import com.book.warm.page.Criteria;
import com.book.warm.vo.AdminBoardVO;
import com.book.warm.vo.CommunityBoardVO;
import com.book.warm.vo.OrdersStatusVO;
import com.book.warm.vo.ReviewBoardVO;

public interface AdminMapper {

	public List<AdminBoardVO> getAdminBoard();
	
	public int addAdminBoardFromCommunityBoard(CommunityBoardVO communityBoardVO);
	
	public int addAdminBoardFromReviewBoard(ReviewBoardVO reviewBoardVO);
	
	public int cloneAttach(int review_no);
	
	public int getNumberOfPostsOnDeletedCommunityBoard();
	
	public int getNumberOfPostsOnDeletedReviewBoard();

	public List<AdminBoardVO> getCommunityBoardListWithPaging(Criteria criteria);

	public List<AdminBoardVO> getReviewBoardListWithPaging(Criteria criteria);

	public List<OrdersStatusVO> getOrdersStatus();
}
