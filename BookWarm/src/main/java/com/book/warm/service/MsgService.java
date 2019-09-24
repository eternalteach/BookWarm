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
	
	public List<MsgTableVO> msglist(String msg_get_id) {
		return msgmapper.msglist(msg_get_id);
	}
	public List<MsgTableVO> msglist2(String msg_send_id) {
		return msgmapper.msglist2(msg_send_id);
	}
	//
	public void msginsert(MsgTableVO msgvo) {
		msgmapper.msginsert(msgvo);
	}
	
	
	public int msgdelete(int msg_no) throws Exception{
		return msgmapper.msgdelete(msg_no);
	}
	
}
