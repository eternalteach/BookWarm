package com.book.warm.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommunityBoardService {
	@Inject
	SqlSessionTemplate sqlSession;

	public ArrayList<CommunityBoardVO> getCommunityBoardList() {
		log.info("===== getComunityBoardList ===== ");
		System.out.println(((ArrayList) sqlSession.selectList("CommunityBoard.selectList")).get(0));
		return (ArrayList) sqlSession.selectList("CommunityBoard.selectList");
	}

	public CommunityBoardVO getCommunityBoardOne(String commNo) {
		log.info("===== getCommunityBoardOne ===== ");
		return sqlSession.selectOne("CommunityBoard.selectOne", commNo);
	}

	public int getCommunityBoardOneDelete(String commNo) {
		log.info("===== getCommunityBoardOneDelete ===== ");
		return sqlSession.delete("CommunityBoard.delete", Integer.parseInt(commNo));
	}

}
