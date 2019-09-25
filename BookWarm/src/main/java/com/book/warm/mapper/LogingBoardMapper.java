package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

public interface LogingBoardMapper {

	public List<LogingBoardVO> getList(@Param("user_id") String user_id, @Param("isbn") String isbn);

	public Integer CountWriteNo(@Param("bookVO")BookVO bookVO, @Param("user_id") String user_id);
	
	public int logingBoard(LogingBoardVO logingBoardVO);

	public LogingBoardVO getLogingVOForWriteNo(String write_no);

	public int modifyLoging(LogingBoardVO logingBoardVO);

	public int deleteLoging(String write_no);

	public BookVO getBookVO(String isbn);
	
	public List<LogingBoardVO> getMyLogs(String user_id);
}
