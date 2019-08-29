package com.book.warm.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.vo.LogingBoardVO;

@Service
public interface LogingBoardService {

	public ArrayList<LogingBoardVO> selectList(int writeNo);

	public Integer CountWriteNo(int writeNo);

}
