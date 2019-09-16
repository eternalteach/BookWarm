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
	
	public List<MsgTableVO> msglist() throws Exception{
		return msgmapper.msglist();
	}
	
	public int msginsert(MsgTableVO msgvo) throws Exception{
		return msgmapper.msginsert(msgvo);
	}

	public MsgTableVO msgread(int msg_no) throws Exception{
		return msgmapper.msgread(msg_no);
	}
	
	public int msgdelete(int msg_no) throws Exception{
		return msgmapper.msgdelete(msg_no);
	}
	
}
