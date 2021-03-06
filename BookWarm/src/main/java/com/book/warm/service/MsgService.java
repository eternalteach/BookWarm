package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.MsgMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

@Service
public class MsgService {
	
	@Inject
	MsgMapper msgmapper;

	public List<MsgTableVO> msglist(String msg_get_id) {
		return msgmapper.msglist(msg_get_id);
	}

	public List<MsgTableVO> msglist2(String msg_send_id) {
		return msgmapper.msglist2(msg_send_id);
	}
	//받은쪽지
	public List<MsgTableVO> msgpaging(String msg_get_id, Criteria cri) {
		return msgmapper.msgpaging(msg_get_id, cri);
	}
	//보낸쪽지
	public List<MsgTableVO> msgpaging2(String msg_send_id, Criteria cri) {
		return msgmapper.msgpaging2(msg_send_id, cri);
	}	
	
	//쪽지보내기
	public void msginsert(MsgTableVO msgvo) {
		msgmapper.msginsert(msgvo);
	}
	//받은쪽지삭제
	public int msgdelete(int msg_no, String msg_get_id) {
		return msgmapper.msgdelete(msg_no, msg_get_id);
	}
	public int msgdelete2(int msg_no, String msg_send_id) {
		return msgmapper.msgdelete2(msg_no, msg_send_id);
	}
	
	//쪽지개수
	public int msgcount(String msg_get_id) {
		return msgmapper.msgcount(msg_get_id);
	}
	public int msgcount2(String msg_send_id) {
		return msgmapper.msgcount2(msg_send_id);
	}
	//받은페이징 개수
	public int getTotalCount(String msg_get_id, Criteria cri) {
		return msgmapper.getTotalCount(msg_get_id, cri);
	}
	//전체페이징 받은개수
	public int sendTotalCount(String msg_send_id, Criteria cri) {
		return msgmapper.sendTotalCount(msg_send_id, cri);
	}
}
