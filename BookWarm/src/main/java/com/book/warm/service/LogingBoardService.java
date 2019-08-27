package com.book.warm.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.vo.LogingBoardVO;

//새로 클래스 만들어서 하세요. 수정해서 하면 안됩니다.
@Service
public class LogingBoardService {

	@Inject
	SqlSessionTemplate sqlSession;

	public LogingBoardVO selectBoardOne(int writeNo) {
		System.out.println("selectBOard"+writeNo);
		return sqlSession.selectOne("board.selectBoardOne", writeNo);
	}

	
}
