package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

public interface MsgMapper {
	
	public List<MsgTableVO> msglist(String msg_get_id);
	public List<MsgTableVO> msglist2(@Param("msg_send_id") String msg_send_id);
	public void msginsert(MsgTableVO msgvo);
	public MsgTableVO sendlist(@Param("msg_get_id") String msg_get_id, @Param("msg_no") int msg_no);
	public int msgdelete(int msg_no);
	
	
}
