package com.book.warm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.mapper.AdminMapper;
import com.book.warm.mapper.CommunityBoardMapper;
import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	@Autowired
	CommunityBoardMapper communityMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@GetMapping("")
	public void admin(Principal principal) {
		
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
	// 이동된 게시글 다시 원상복구 시키기 아직 코딩 안함
	@GetMapping(value="/community/", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommunityBoardVO> revertAdministrateCommunity(@PathVariable("comm_no")int comm_no, Principal principal){
		log.info("==================== administrateCommunity() ====================");
		log.info("Community No : " + comm_no);
		//트랜잭션 적용되어야 한다.
		CommunityBoardVO movePost=communityMapper.getCommunityBoardOne(comm_no);
		adminMapper.addAdminBoardFromCommunityBoard(movePost);
		communityMapper.modifyPostByAdmin(movePost);
		return new ResponseEntity<>(communityMapper.getCommunityBoardOne(comm_no),HttpStatus.OK);
	}
	
}
