package com.book.warm.controller;

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

import com.book.warm.page.CommunityCommentPageDTO;
import com.book.warm.page.Criteria;
import com.book.warm.service.CommunityBoardCommentService;
import com.book.warm.vo.CommunityBoardCommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("CommunityBoardComment/")
@RestController
@Log4j
@AllArgsConstructor
public class BoardCommunityCommentController {

	private CommunityBoardCommentService service;

	//add Comment
	@PostMapping(value = "/new", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody CommunityBoardCommentVO communityBoardCommentVO) {
		log.info("CommunityBoardCommentVO : " + communityBoardCommentVO);
		int insertCount = service.register(communityBoardCommentVO);
		log.info("Comment INSERT COUNT : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	//check comm_no's comment
	@GetMapping(value = "/pages/{comm_no}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommunityCommentPageDTO> getList(@PathVariable("page") int page,
			@PathVariable("comm_no") int comm_no) {
		log.info("====================get List====================");
		Criteria criteria = new Criteria(page, 10);
		log.info(criteria);
		log.info(comm_no);
		return new ResponseEntity<>(service.getListPage(criteria, comm_no), HttpStatus.OK);
	}
	// get comment
	@GetMapping(value="{comm_cmt_no}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommunityBoardCommentVO> get(@PathVariable("comm_cmt_no")int comm_cmt_no){
	log.info("get : " + comm_cmt_no);
	return new ResponseEntity<>(service.get(comm_cmt_no),HttpStatus.OK);
	}
	
	// remove comment
	@DeleteMapping(value="{comm_cmt_no}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("comm_cmt_no")int comm_cmt_no){
		log.info("remove : " + comm_cmt_no);
		return service.remove(comm_cmt_no)==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// modify comment
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{comm_cmt_no}",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CommunityBoardCommentVO communityBoardCommentVO, @PathVariable("comm_cmt_no")int comm_cmt_no){
		communityBoardCommentVO.setComm_cmt_no(comm_cmt_no);
		log.info("comm_cmt_no : "+comm_cmt_no);
		log.info("modify: " + communityBoardCommentVO);
		return service.modify(communityBoardCommentVO)==1 ? new ResponseEntity<>("success",HttpStatus.OK): new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
}
