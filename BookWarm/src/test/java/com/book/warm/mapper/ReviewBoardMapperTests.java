package com.book.warm.mapper;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewBoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewBoardMapperTests {
	
	@Inject
	ReviewBoardMapper rbm;
	
//	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(5);
		
		String isbn = "abc123";
		String user_id = "mikeeee";
		
		List<ReviewBoardVO> list = rbm.getListPerBookWithPaging(isbn, user_id, cri);
		
		list.forEach(board -> log.info(board));
	}
	
}
