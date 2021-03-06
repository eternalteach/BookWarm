package com.book.warm.mapper;

import java.util.List;
import java.util.stream.IntStream;

import javax.inject.Inject;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.page.Criteria;
import com.book.warm.vo.ReviewCommentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewCommentMapperTests {
	
	private int[] reviewNoArr = {5,4,3,2,1};
	
	
	@Inject
	ReviewCommentMapper rcm;
	
//	@Test
	public void testMapper() {
		
		log.info(rcm);
	}
	
//	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(2, 11).forEach( i -> {
			
			ReviewCommentVO vo = new ReviewCommentVO();
			
			// 게시물의 번호
			vo.setReview_no(reviewNoArr[i % 5]);
			vo.setReview_cmt_content("댓글 테스트합니다: " + i);
			vo.setUser_id("Comment ID: " + i);
			
			rcm.insert(vo);
		});
	}
	
//	@Test
	public void testRead() {
		
		int targetNo = 5;
		
		ReviewCommentVO vo = rcm.read(targetNo);
		log.info(vo);
	}
	
//	@Test
	public void testDelete() {
		
		int targetNo = 5;
		
		rcm.delete(targetNo);
	}
	
//	@Test
	public void testUpdate() {
		
		int targetNo = 10;
		
		ReviewCommentVO vo = rcm.read(10);
		vo.setReview_cmt_content("Update Comment");
		
		int count = rcm.update(vo);
		log.info("UPDATE COUNT: " + count);
	}
	
//	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReviewCommentVO> comments = rcm.getListWithPaging(cri, reviewNoArr[0]);
		comments.forEach(comment -> log.info(comment));
	}
	
//	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(2,10);
		
		List<ReviewCommentVO> comments = rcm.getListWithPaging(cri, reviewNoArr[4]);
		comments.forEach(comment -> log.info(comment));
	}
}
