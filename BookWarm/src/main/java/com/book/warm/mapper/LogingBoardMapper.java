package com.book.warm.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.vo.LogingBoardVO;

@Service
public interface LogingBoardMapper {

	public ArrayList<LogingBoardVO> selectList(String isbn);

	public Integer CountWriteNo(String isbn);

}
