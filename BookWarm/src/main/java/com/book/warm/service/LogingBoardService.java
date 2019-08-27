package com.book.warm.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

//새로 클래스 만들어서 하세요. 수정해서 하면 안됩니다.
@Service
@Log4j
public class LogingBoardService {

	@Inject
	SqlSessionTemplate sqlSession;

	public LogingBoardVO selectBoardOne(int writeNo) {
		log.info("===== selectBOard ====="+writeNo);
	
		return sqlSession.selectOne("board.selectBoardOne", writeNo);
	}
	
	// 보드리스트 가지고와서 배열로 받기, 받은배열을 컨트롤러에서 또는 통계 클래스 만들어서 작업하고 뿌리자. 이거는 읽은 페이지
	// 감상문 수는 select cnt(*) from log_board where writeNo=#{writeNo} 로 그 게시글의 감상문 수 가져오기
	// 문제는 게시글 하나에 2개이상의 감상문을 쓸 경우인데... 그러면 흠.. 상의가 필요하다.

	
}
