package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.service.UserInfoService;
import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserInfoController {
	
	@Inject
	UserInfoService userInfoService;
	
	// 나의 주문 내역 페이지
	@RequestMapping("/orderList")
	public void orderList(Principal principal, Model model) {
		String user_id = principal.getName();
		
		// orders, orders_item, book테이블 join해서 받아낸 로그인한 유저의 모든 주문
		List<OrderListVO> list = userInfoService.getMyOrders(user_id);
		model.addAttribute("list", list);
		
		// orders테이블에 있는 모든 튜플 가져온다
		List<OrdersVO> OrderList = userInfoService.getOrderList(user_id);
		model.addAttribute("orderList", OrderList);
		
		// 과거 모든 주문 개수
		int cnt = userInfoService.getOrderCnt(user_id);
		model.addAttribute("cnt", cnt);
	}
	
	// 마이 페이지(메인)
	@RequestMapping("/myInfo")
	public void myInfo(Principal principal, Model model) {
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
	}
}
