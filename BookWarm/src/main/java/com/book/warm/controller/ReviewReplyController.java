package com.book.warm.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.book.warm.service.ReviewReplyService;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReviewReplyController {
	
	private ReviewReplyService rrs;
	
	// 댓글 입력
	@PostMapping(value="/new",
					 consumes = "application/json",
					 produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewReplyVO vo) {
		
		log.info("ReviewReplyVO: " + vo);
		int insertCount = rrs.register(vo);
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정 게시물의 댓글 목록 확인
	@GetMapping(value="/pages/{review_no}/{page}",
					produces= {
								MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReviewReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("review_no") int review_no) {
		
		log.info("getList");
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(rrs.getList(cri, review_no), HttpStatus.OK);
	}
	
	// 댓글 조회
	@GetMapping(value="/{review_re_no}",
					produces = { MediaType.APPLICATION_XML_VALUE,
									MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewReplyVO> get(@PathVariable("review_re_no") int review_re_no) {
		
		log.info("get: " + review_re_no);
		return new ResponseEntity<>(rrs.get(review_re_no), HttpStatus.OK);
	}
	
	// 댓글 삭제
	@DeleteMapping(value = "/{review_re_no}",
					   produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("review_re_no") int review_re_no) {
		
		log.info("remove: " + review_re_no);
		
		return rrs.remove(review_re_no) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
						  value = "/{review_re_no}",
						  consumes = "application/json",
						  produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody ReviewReplyVO vo,
			@PathVariable("review_re_no") int review_re_no) {
		
		vo.setReview_re_no(review_re_no);
		
		log.info("review_re_no: " + review_re_no);
		log.info("modify: " + vo);
		
		return rrs.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
}
