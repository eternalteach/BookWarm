package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.mapper.AdminMapper;
import com.book.warm.mapper.CommunityBoardMapper;
import com.book.warm.mapper.MemberMapper;
import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.CommunityBoardVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	@Autowired
	CommunityBoardMapper communityMapper;
	
	@Autowired
	ReviewBoardService reviewBoardService;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@GetMapping("")
	public void admin(Principal principal,Model model) {
		model.addAttribute("adminBoard",adminMapper.getAdminBoard());
		List<UserVO> adminUserList = memberMapper.readAllUser();
		model.addAttribute("userList",adminUserList);
		
		// 사용자 정보도 띄워야 한다.
	}
	
	// community 게시글 이동처리
	@GetMapping(value="/community/{comm_no}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommunityBoardVO> administrateCommunity(@PathVariable("comm_no")int comm_no, Principal principal){
		log.info("==================== administrateCommunity() ====================");
		log.info("Community No : " + comm_no);
		//트랜잭션 적용되어야 한다.
		CommunityBoardVO movePost=communityMapper.getCommunityBoardOne(comm_no);
		adminMapper.addAdminBoardFromCommunityBoard(movePost);
		communityMapper.modifyPostByAdmin(movePost);
	return new ResponseEntity<>(communityMapper.getCommunityBoardOne(comm_no),HttpStatus.OK);
	}
	
	@GetMapping(value="/review/{comm_no}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewBoardVO> administrateReview(@PathVariable("comm_no")int comm_no, Principal principal){
		log.info("==================== administrateReview() ====================");
		log.info("Review No : " + comm_no);
		//트랜잭션 적용되어야 한다.
		// 1. 이동할 게시글 정보 가져오기
		ReviewBoardVO movePost=reviewBoardService.selectedReview(comm_no);
		// 2. 관리자 게시판으로 복사
		adminMapper.addAdminBoardFromReviewBoard(movePost);
		// 3. 이동할 보드 내용 수정
		reviewBoardService.modifyAdmin(movePost);
		return new ResponseEntity<>(reviewBoardService.selectedReview(comm_no),HttpStatus.OK);
	}
	
	// USER 정보 받아오기
	@GetMapping(value="/admin/{user_id}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<UserVO> getUserID(@PathVariable("user_id")String user_id){
		log.info("==================== getUserID() ====================");
		log.info("getUserID : " + user_id);
		return new ResponseEntity<>(memberMapper.read(user_id),HttpStatus.OK);
	}
	
}
