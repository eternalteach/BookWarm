package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

public interface MsgMapper {
	//쪽지불러오기
	public List<MsgTableVO> msglist();

	//쪽지작성;
	public int msginsert(MsgTableVO msgvo);
	
	//쪽지조회(필욘없음)
	public MsgTableVO msgread(int msg_no);
	
	//쪽지삭제
	public int msgdelete(int msg_no);
	
	//페이징 처리
	public List<MsgTableVO> msgpaging(
			@Param("cri") Criteria cri,
			@Param("msg_no") int msg_no);
	
}
