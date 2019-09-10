package com.book.warm.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.book.warm.service.ReviewBoardService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewBoardControllerTests {

	@Inject
	ReviewBoardService rbs;
	      
	private MockMvc mockMvc;
	
	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(
			MockMvcRequestBuilders.get("/warm/reviewPerBook")
			.param("isbn", "abc123")
			.param("user_id", "mikeeee")
			.param("pageNum", "2")
			.param("amount", "50"))
			.andReturn().getModelAndView().getModelMap());
	}
}
