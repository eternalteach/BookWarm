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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.warm.mapper.AdminMapper;
import com.book.warm.mapper.CommunityBoardMapper;
import com.book.warm.mapper.MemberMapper;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.AuthenticationService;
import com.book.warm.service.OrdersStatusService;
import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.AdminBoardVO;
import com.book.warm.vo.AuthVO;
import com.book.warm.vo.CommunityBoardVO;
import com.book.warm.vo.OrdersItemVO;
import com.book.warm.vo.OrdersStatusVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_MANAGER')")
public class AdminController {
	
	@Autowired
	CommunityBoardMapper communityMapper;
	
	@Autowired
	ReviewBoardService reviewBoardService;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	CommunityBoardMapper communityBoardMapper;
	
	@Autowired
	AuthenticationService authenticationService;
	
	@Autowired
	OrdersStatusService ordersStatusService;
	
	@GetMapping("")
	public void admin(Principal principal,Model model,Criteria criteria) {
		log.info("================ admin() ===============");
		// 한 페이지에 10개씩
		criteria.setAmount(10);
		
		//사용자 정보
		List<UserVO> adminUserList = memberMapper.readAllUser();
		model.addAttribute("userList",adminUserList);
		
		//커뮤니티
		int numberOfPostsOnCommunityBoard=adminMapper.getNumberOfPostsOnDeletedCommunityBoard();
		model.addAttribute("numberOfPostsOnCommunityBoard", numberOfPostsOnCommunityBoard);
		
		//리뷰
		int numberOfPostsOnReviewBoard=adminMapper.getNumberOfPostsOnDeletedReviewBoard();
		model.addAttribute("reviewBoardList", adminMapper.getReviewBoardListWithPaging(criteria));
		model.addAttribute("reviewPageMaker", new PageDTO(criteria, numberOfPostsOnReviewBoard));
		model.addAttribute("numberOfPostsOnReviewBoard", numberOfPostsOnReviewBoard);
		
		// 주문 상태
		List<OrdersStatusVO> status = adminMapper.getOrdersStatus();
		
		for(int i=0; i<status.size(); i++) {
			System.out.println("주문 상태 : "+status.get(i).getOrders_status());
			switch(status.get(i).getOrders_status()) {
				case "주문 완료":
					status.get(i).setOrders_status_num(1);
					break;
				case "배송 준비중":
					status.get(i).setOrders_status_num(2);
					break;
				case "배송중":
					status.get(i).setOrders_status_num(3);
					break;
				case "배송 완료":
					status.get(i).setOrders_status_num(4);
					break;
				case "미입금 취소":
					status.get(i).setOrders_status_num(5);
					break;
			}
		}
		model.addAttribute("orders_status", status);
		
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
	
	@GetMapping(value="/community/pages/{page}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AdminBoardVO>> getDelCommBoardListWithPaging(@PathVariable("page")int page){
		log.info("==================== getDelCommBoardListWithPaging() ====================");
		Criteria criteria = new Criteria(page, 10);
		return new ResponseEntity<>(adminMapper.getCommunityBoardListWithPaging(criteria),HttpStatus.OK);
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
	
	@GetMapping(value="/review/pages/{page}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AdminBoardVO>> getDelReviewBoardListWithPaging(@PathVariable("page")int page){
		log.info("==================== getDelReviewBoardListWithPaging() ====================");
		Criteria criteria = new Criteria(page, 10);
		return new ResponseEntity<>(adminMapper.getReviewBoardListWithPaging(criteria),HttpStatus.OK);
	}
	
	// User 권한 수정하기
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/authentication",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyUserAuthentication(@RequestBody AuthVO authVO){
		log.info("========== modifyUserAuthentication()");
		log.info(authVO.getAuthority());
		log.info(authVO.getUser_id());
		return authenticationService.modifyAuthentication(authVO)==1 ? new ResponseEntity<>("success",HttpStatus.OK): new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/modifyOrdersStatus",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyOrdersStatus(@RequestBody OrdersStatusVO ordersStatusVO){
		log.info("========== modifyOrdersStatus()");
		log.info("orders_no : " + ordersStatusVO.getOrders_no()); // 바꿀 대상의 orders_no
		log.info("orders_status : " + ordersStatusVO.getOrders_status()); // 바꾸려는 상태
		
		int modify = ordersStatusService.modifyOrdersStatus(ordersStatusVO);
		
		log.info("ordersStatusService.modifyOrdersStatus(ordersStatusVO) : "+modify);
		
		return modify>=1 ? new ResponseEntity<>("success",HttpStatus.OK): new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	
}
