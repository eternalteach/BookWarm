package com.book.warm.mapper;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j
//public class MemberMapperTests {
//	
//	@Inject
//	private MemberMapper mapper;
//	
//	@Test
//	public void testRead() {
//		
//		UserVO vo = mapper.read("admin9");
//		log.info(vo);
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
//	}
//}
