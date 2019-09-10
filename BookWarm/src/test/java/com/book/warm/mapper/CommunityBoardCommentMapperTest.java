package com.book.warm.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CommunityBoardCommentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommunityBoardCommentMapperTest {

	@Setter(onMethod_ = @Autowired)
	private CommunityBoardCommentMapper mapper;

	private int[] comm_noArr = { 1, 2, 3, 4, 5 };

	@Test
	public void testMapper() {
		log.info(mapper);
	}

	@Test
	public void testInsert() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			CommunityBoardCommentVO a = new CommunityBoardCommentVO();
			a.setComm_cmt_content("댓글 테스트 내용" + i);
			a.setComm_no(comm_noArr[i % 5]);
			a.setUser_id("댓글테스터");
			mapper.insertComment(a);
		});
	}

	@Test
	public void testRead() {
		int targetComm_no = 5;
		CommunityBoardCommentVO vo = mapper.readComment(targetComm_no);
		log.info(vo);
	}

	@Test
	public void testDelete() {
		int targetNo=1;
		mapper.deleteComment(targetNo);
	}
	
	@Test
	public void testUpdate() {
		int targetNo=2;
		CommunityBoardCommentVO vo=mapper.readComment(targetNo);
		vo.setComm_cmt_content("수정합니다.");
		int count = mapper.updateComment(vo);
		log.info("UPDATE COUNT: "+count);
	}
	
	@Test
	public void testList() {
		Criteria cri=new Criteria();
		List<CommunityBoardCommentVO> comment = mapper.getCommentListWithPaging(cri, 5);
		comment.forEach(comments->log.info(comments));
	}
}
