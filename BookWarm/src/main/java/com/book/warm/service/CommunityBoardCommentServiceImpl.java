package com.book.warm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.CommunityBoardCommentMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommunityBoardCommentServiceImpl implements CommunityBoardCommentService {

	private CommunityBoardCommentMapper mapper;

	@Override
	public int register(CommunityBoardCommentVO communityBoardCommentVO) {
		log.info("register : " + communityBoardCommentVO);
		return mapper.insertComment(communityBoardCommentVO);
	}

	@Override
	public CommunityBoardCommentVO get(int comm_cmt_no) {
		log.info("get : " + comm_cmt_no);
		return mapper.readComment(comm_cmt_no);
	}

	@Override
	public int modify(CommunityBoardCommentVO communityBoardCommentVO) {
		log.info("modify : " + communityBoardCommentVO);
		return mapper.updateComment(communityBoardCommentVO);
	}

	@Override
	public int remove(int comm_cmt_no) {
		log.info("remove : " + comm_cmt_no);
		return mapper.deleteComment(comm_cmt_no);
	}

	@Override
	public List<CommunityBoardCommentVO> getList(Criteria criteria, int comm_no) {
		log.info("get Comment List of a Community Board" + comm_no);
		return mapper.getCommentListWithPaging(criteria, comm_no);
	}

}
