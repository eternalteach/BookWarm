package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

public interface MsgMapper {
	
	public List<MsgTableVO> msglist();

	public int msginsert(MsgTableVO msgvo);
	
	public MsgTableVO msgread(int msg_no);
	
	public int msgdelete(int msg_no);
	
	public List<MsgTableVO> msgpaging(
			@Param("cri") Criteria cri,
			@Param("msg_no") int msg_no);
	
}
