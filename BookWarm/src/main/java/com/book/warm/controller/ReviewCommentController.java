package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.book.warm.page.Criteria;
import com.book.warm.service.ReviewCommentService;
import com.book.warm.vo.CommentPageDTO;
import com.book.warm.vo.ReviewCommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comments/")
@RestController
@Log4j
@AllArgsConstructor
public class ReviewCommentController {
	
	private ReviewCommentService service;
	
	// 댓글 입력
	@PostMapping(value="/new",
					 consumes = "application/json",
					 produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewCommentVO vo) {
		
		log.info("ReviewCommentVO: " + vo);
		int insertCount = service.register(vo);
		log.info("Comment INSERT COUNT: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정 게시물의 댓글 목록 확인
	@GetMapping(value="/pages/{review_no}/{page}",
					produces= {
								MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommentPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("review_no") int review_no) {
		
		Criteria cri = new Criteria(page, 10);
		
		log.info("get Comment List review_no: " + review_no);
		log.info("cri: " + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, review_no), HttpStatus.OK);
	}
	
	// 댓글 조회
	@GetMapping(value="/{review_cmt_no}",
					produces = { MediaType.APPLICATION_XML_VALUE,
									MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewCommentVO> get(@PathVariable("review_cmt_no") int review_cmt_no) {
		
		log.info("get: " + review_cmt_no);
		return new ResponseEntity<>(service.get(review_cmt_no), HttpStatus.OK);
	}
	
	// 댓글 삭제
	@PreAuthorize("principal.username == #vo.user_id")
	@DeleteMapping(value = "/{review_cmt_no}",
					   produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@RequestBody ReviewCommentVO vo,
												  @PathVariable("review_cmt_no") int review_cmt_no) {
		
		log.info("remove: " + review_cmt_no);
		
		return service.remove(review_cmt_no) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정
	@PreAuthorize("principal.username == #vo.user_id")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
						  value = "/{review_cmt_no}",
						  consumes = "application/json",
						  produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody ReviewCommentVO vo,
			@PathVariable("review_cmt_no") int review_cmt_no) {
		
		vo.setReview_cmt_no(review_cmt_no);
		
		log.info("review_cmt_no: " + review_cmt_no);
		log.info("modify: " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 내 리뷰에 달린 최근 댓글 목록
	@GetMapping(value="/recent",
					produces= {
								MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReviewCommentVO>> getCommentsOnMyReview(Principal principal) {
		
		return new ResponseEntity<>(service.getCommentsOnMyReview(principal.getName()), HttpStatus.OK);
	}
	
}
