package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.MsgMapper;
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
	//보낸쪽지
	public List<MsgTableVO> msglist2(String msg_send_id) {
		return msgmapper.msglist2(msg_send_id);
	}
	//쪽지보내기
	public void msginsert(MsgTableVO msgvo) {
		msgmapper.msginsert(msgvo);
	}
	public MsgTableVO sendlist(String msg_get_id, int msg_no) {
		return msgmapper.sendlist(msg_get_id, msg_no);
	}
	//쪽지삭제
	public int msgdelete(int msg_no) {
		return msgmapper.msgdelete(msg_no);
	}
	
}
