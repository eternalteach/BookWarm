package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.MsgMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.MsgTableVO;
import com.book.warm.vo.ReviewCommentVO;

@Service
public class MsgService {
	
	@Inject
	MsgMapper msgmapper;
	//받은쪽지
	public List<MsgTableVO> msglist(String msg_get_id) {
		return msgmapper.msglist(msg_get_id);
	}
	public List<MsgTableVO> msgpaging(String msg_get_id, Criteria cri) {
		return msgmapper.msgpaging(msg_get_id, cri);
	}
	
	
	//보낸쪽지
	public List<MsgTableVO> msglist2(String msg_send_id) {
		return msgmapper.msglist2(msg_send_id);
	}
	//쪽지보내기
	public MsgTableVO msginsert(MsgTableVO msgvo) {
		return msgmapper.msginsert(msgvo);
	}
	//쪽지삭제
	public int msgdelete(int msg_no) {
		return msgmapper.msgdelete(msg_no);
	}
	//쪽지개수
	public int msgcount(String msg_get_id) {
		return msgmapper.msgcount(msg_get_id);
	}
	public int msgcount2(String msg_send_id) {
		return msgmapper.msgcount2(msg_send_id);
	}
	//페이징 개수
	public int getTotalCount(Criteria cri) {
		return msgmapper.getTotalCount(cri);
	}
}
