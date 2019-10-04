package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

public interface MsgMapper {
	
	public List<MsgTableVO> msglist(String msg_get_id);
	public List<MsgTableVO> msglist2(@Param("msg_send_id") String msg_send_id);
	
	public List<MsgTableVO> msgpaging(@Param("msg_get_id") String msg_get_id, @Param("cri") Criteria cri);
	public List<MsgTableVO> msgpaging2(@Param("msg_send_id") String msg_send_id, @Param("cri") Criteria cri);
	
	public void msginsert(MsgTableVO msgvo);
	//받은쪽지 삭제
	public int msgdelete(@Param("msg_no") int msg_no ,@Param("msg_get_id") String msg_get_id);
	public int msgdelete2(@Param("msg_no") int msg_no ,@Param("msg_send_id") String msg_send_id);
	
	public int msgcount(String msg_get_id);
	public int msgcount2(String msg_send_id);
	
	public int getTotalCount(@Param("msg_get_id") String msg_get_id, @Param("cri") Criteria cri);
	public int sendTotalCount(@Param("msg_send_id") String msg_get_id, @Param("cri") Criteria cri);
	
	
}
