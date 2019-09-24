package com.book.warm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.CommunityBoardCommentMapper;
import com.book.warm.page.CommunityCommentPageDTO;
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
		log.info("=============== register() ===============" );
		return mapper.insertComment(communityBoardCommentVO);
	}

	@Override
	public CommunityBoardCommentVO get(int comm_cmt_no,String user_id) {
		log.info("=============== Get Comment ===============");
		log.info("Get Comment No : " + comm_cmt_no);
		log.info("user_id : " + user_id);
		return mapper.readComment(comm_cmt_no,user_id);
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

	@Override
	public CommunityCommentPageDTO getListPage(Criteria criteria, int comm_cmt_no) {
		log.info("CommunityCommentPageDTO");
		return new CommunityCommentPageDTO(mapper.getCountByComm_cmt_no(comm_cmt_no),mapper.getCommentListWithPaging(criteria,comm_cmt_no));
	}

}
