package com.book.warm.service;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewBoardServiceTests {
	
	@Inject
	ReviewBoardService rbs;
	
	@Test
	public void testGetList() {
		
		String isbn = "abc123";
		String user_id = "mikeeee";
		
		rbs.getListPerBook(isbn, user_id, new Criteria(2,5)).forEach(board -> log.info(board));;
		
	}
	
}
