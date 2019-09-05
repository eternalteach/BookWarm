package com.book.warm.mapper;

import java.util.List;
import java.util.stream.IntStream;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewReplyMapperTests {
	
	private int[] reviewNoArr = {5,4,3,2,1};
	
	
	@Inject
	ReviewReplyMapper rrm;
	
//	@Test
	public void testMapper() {
		
		log.info(rrm);
	}
	
//	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(2, 11).forEach( i -> {
			
			ReviewReplyVO vo = new ReviewReplyVO();
			
			// 게시물의 번호
			vo.setReview_no(reviewNoArr[i % 5]);
			vo.setReview_re_content("댓글 테스트합니다: " + i);
			vo.setUser_id("replyer: " + i);
			
			rrm.insert(vo);
		});
	}
	
//	@Test
	public void testRead() {
		
		int targetNo = 5;
		
		ReviewReplyVO vo = rrm.read(targetNo);
		log.info(vo);
	}
	
//	@Test
	public void testDelete() {
		
		int targetNo = 5;
		
		rrm.delete(targetNo);
	}
	
//	@Test
	public void testUpdate() {
		
		int targetNo = 10;
		
		ReviewReplyVO vo = rrm.read(10);
		vo.setReview_re_content("Update Reply");
		
		int count = rrm.update(vo);
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReviewReplyVO> replies = rrm.getListWithPaging(cri, reviewNoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
}
