package com.book.warm.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.ReviewBoardService;
import com.book.warm.service.UserInfoService;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;
import com.book.warm.vo.PostVO;
import com.book.warm.vo.UserVO;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserInfoController {
	
	@Inject
	UserInfoService userInfoService;
	@Inject
	ReviewBoardService reviewBoardService;
	
	// 나의 주문 내역 페이지
	@RequestMapping("/orderList")
	public void orderList(Principal principal, Model model, Criteria cri) {
		String user_id = principal.getName();
		
		// orders, orders_item, book테이블 join해서 받아낸 로그인한 유저의 모든 주문
		List<OrderListVO> list = userInfoService.getMyOrders(user_id, cri);
		model.addAttribute("list", list);
		
		// orders테이블에 있는 모든 튜플 가져온다
		List<OrdersVO> OrderList = userInfoService.getOrderList(user_id);
		model.addAttribute("orderList", OrderList);
		
		// 과거 모든 주문 개수
		int cnt = userInfoService.getOrderCnt(user_id);
		model.addAttribute("cnt", cnt);
		
		// 페이징처리
		model.addAttribute("pageMaker", new PageDTO(cri, cnt));
	}
	
	// 마이 페이지(메인)
	@RequestMapping("/myInfo")
	public void myInfo(Principal principal, Model model, Criteria cri) {
		String user_id = principal.getName();
		
		// view로 보내야하는 데이터
		// 1. user_id
		model.addAttribute("user_id", user_id);
		
		// 2. point
		int point = userInfoService.getPoint(user_id);
		model.addAttribute("point", point);
		
		// 3. couponCnt
		int couponCnt = userInfoService.getCouponCnt(user_id);
		model.addAttribute("couponCnt", couponCnt);
		
		// 4. 최근 내 리뷰를 리스트로 받아온다.
		System.out.println("1");
		model.addAttribute("list", reviewBoardService.selectBoardList(user_id, cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reviewBoardService.getTotal(user_id)));
		System.out.println("2");
	}
	
	@RequestMapping("/modifyMyInfo")
	public void modifyMyInfo(Principal principal,Model model) {
		String user_id=principal.getName();
		model.addAttribute("userinfo",userInfoService.getUserInfo(user_id));
		
	}
	@PostMapping("/modifyUserInfo")
	public String modifyUserInfo(Principal principal,UserVO userInfo) {
		String user_id=principal.getName();
		userInfo.setUser_id(user_id);
		userInfoService.modifyUserInfo(userInfo);
		return "/myInfo";
	}
	
	// 마이 페이지(탈퇴)
	@Transactional
	@RequestMapping("/dropOut")
	public String dropOut(Principal principal, Model model) {
		String user_id = principal.getName();
		
		// 1. 받아온 아이디를 받아 쓰는 모든 테이블(db)에서 삭제
		// 1-1. authorities(권한)테이블에서는 유저 삭제
		userInfoService.removeUserFromAuthorities(user_id);
		
		// 1-2. <user_info>를 참조하는 모든 테이블에서 유저 none으로 변경
		userInfoService.removeUserFromBook_star(user_id);
		userInfoService.removeUserFromCart(user_id);
		userInfoService.removeUserFromCoupon_no(user_id);
		userInfoService.removeUserFromFriend(user_id);
		userInfoService.removeUserFromLibrary(user_id);
		userInfoService.removeUserFromLoging_board(user_id);
		userInfoService.removeUserFromMsg_table1(user_id);
		userInfoService.removeUserFromMsg_table2(user_id);
		userInfoService.removeUserFromOrders(user_id);
		userInfoService.removeUserFromPost(user_id);
		userInfoService.removeUserFromReview_board(user_id);
		
		// 1-3. <user_info>에서 유저 삭제
		userInfoService.removeUser(user_id);
		
		// 2. 로그아웃, index로 보내준다.
		return "redirect:customLogout";
	}
	
	// 과거 주문 내역 클릭했을 때 배송정보(상세) 모달로 띄우기
	@RequestMapping("/orderDetails")
	@ResponseBody
	@Transactional
	public ResponseEntity<String> orderDetails(Principal principal, @Param("orders_no") String orders_no) {
		
		String user_id = principal.getName();
		// 주문건에 대한 결제, 쿠폰, 배송 정보를 가져온다.
		// 1. 결제 정보 가져오기.
		OrdersVO order = userInfoService.getOrderDetails(orders_no);
		
		// 2. 쿠폰 정보 가져오기.
		String coupon_no = order.getCoupon_no();
		CouponVO coupon = null;
		
		// 쿠폰 사용해서 결제를 진행한 경우에만 쿠폰의 정보를 가져온다.
		// 쿠폰 사용하지 않고 결제했을 경우에는 null
		if(coupon_no != null) {
			coupon = userInfoService.getUsedCoupon(coupon_no);
		}
		
		// 3. 배송 정보 가져오기
		String post_no = order.getPost_no();
		System.out.println("post_no : "+post_no);
		PostVO post = null;
		if(post_no != null) {
			post = userInfoService.getPostInfo(post_no);
		}	

		// 4. 맵으로 묶기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("coupon", coupon);
		map.put("post", post);
		
		// 5. map json으로 변환
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<String>(json, resHeader, HttpStatus.CREATED);
	}
	
	@RequestMapping("/searchCoupon")
	@ResponseBody
	public CouponVO searchCoupon(@RequestParam("coupon_no") String coupon_no) {
		System.out.println("searchCoupon()");
		CouponVO couponVO = userInfoService.getCoupon(coupon_no);
		return couponVO;
	}
	
	// 선택한 쿠폰 내 계정에 등록
	@RequestMapping("/selectCoupon")
	public String selectCoupon(Principal principal, @RequestParam("coupon_no") String coupon_no) {
		System.out.println("selectCoupon()");
		String user_id = principal.getName();
		
		// 1. coupon_no 테이블에 선택한 쿠폰 등록
		userInfoService.setCoupon(user_id, coupon_no);
		
		return "redirect:myInfo";
	}
//	
//	// 선택한 쿠폰 내 계정에 등록
//	@RequestMapping("/selectCoupon")
//	@ResponseBody
//	public int selectCoupon(Principal principal, @RequestParam("coupon_no") String coupon_no) {
//		System.out.println("selectCoupon()");
//		String user_id = principal.getName();
//		
//		// 1. coupon_no 테이블에 선택한 쿠폰 등록
//		userInfoService.setCoupon(user_id, coupon_no);
//		
//		// myInfo.jsp페이지에 있는 쿠폰 개수 받아온다.
//		int couponCnt = userInfoService.getCouponCnt(user_id);
//		return couponCnt;
//	}
}
