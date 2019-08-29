package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewBoardVO2;


@Service
public class ReviewBoardService {
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	public List<ReviewBoardVO2> selectBoardList() {
		
		System.out.println("asdf: " + sqlSession.selectList("review_main.selectBoardList"));

		return sqlSession.selectList("review_main.selectBoardList");
	}

	public List<ReviewBoardVO> selectListPerBook(String isbn) {

		return sqlSession.selectList("review_main.selectListPerBook", isbn);
	}
	
}
