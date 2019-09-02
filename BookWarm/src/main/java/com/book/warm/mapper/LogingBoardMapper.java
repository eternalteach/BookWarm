package com.book.warm.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

@Service
public interface LogingBoardMapper {

	public ArrayList<LogingBoardVO> getListWithPaging(Criteria cri);

	public Integer CountWriteNo(BookVO bookVO);
	
	public int logingBoard(LogingBoardVO logingBoardVO);

	public LogingBoardVO getLogingVOForWriteNo(String write_no);

	public int modifyLoging(LogingBoardVO logingBoardVO);

	public int deleteLoging(String write_no);

	public BookVO getBookVO(BookVO bookVO);
	
	

}
