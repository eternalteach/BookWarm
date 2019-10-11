package com.book.warm.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.OrdersItemVO;
import com.book.warm.vo.OrdersVO;
import com.book.warm.vo.PostVO;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shop")
@Log4j
public class ShopController {

	@Inject
	ShopBoardService service;

	// 장바구니 추가
	@RequestMapping("/insertcart")
	public String insert(Principal principal, HttpServletRequest req, Model model, CartJoinBookVO cartvo) {
		log.info("====================insertcart()==========================");

		String user_id = principal.getName();
		String isbn = req.getParameter("isbn");
		String cart_cnt = req.getParameter("cart_cnt");// 책 권수

		cartvo.setUser_id(user_id);

		// 장바구니에 기존상품이 있는지 검사!!
		int countCart = service.countcart(isbn, user_id);
		log.info("장바구니에 기존상품이 있는지 검사" + countCart);
		log.info("select 책 권수:" + cart_cnt);

		// insert
		if (countCart == 0) {
			service.insertcart(cartvo);
			log.info("insert  구문 실행" + countCart);
		} else {
			service.updatecart(cartvo);
			log.info("update 구문 실행" + countCart);
		}
		return "redirect:/shop/cart";
	}

	@RequestMapping(path = "/cart")
	public String cart(Principal principal, Model model, CartJoinBookVO cartvo) {
		log.info("=================cart()==========================");

		String user_id = principal.getName();
		cartvo.setUser_id(user_id);

		List<CartJoinBookVO> list = service.cartList(user_id);

		model.addAttribute("list", list);
		return "/shop-cart";
	}

	@RequestMapping("/removeCartItem")
	public String removeCartItem(HttpServletRequest req, RedirectAttributes rttr) {
		log.info("=================removeCartItem()==========================");

		int cart_no = Integer.parseInt(req.getParameter("cart_no"));

		service.delete(cart_no);

		return "redirect:/shop/cart";
	}

	@RequestMapping("/cntUp")
	public String cntUp(Principal principal, HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt")) + 1;
		String cart_no = req.getParameter("cart_no");
		String user_id = principal.getName();

		service.updateCnt(cart_cnt, cart_no);

		return "redirect:cart?user_id=" + user_id;
	}

	@RequestMapping("/cntDown")
	public String cntDown(Principal principal, HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"));
		String user_id = principal.getName();

		// 수량이 0 이상(1,2,3,...)일 경우에만 줄일 수 있다.
		if (cart_cnt > 0) {
			cart_cnt -= 1;
			String cart_no = req.getParameter("cart_no");
			service.updateCnt(cart_cnt, cart_no);
		}

		return "redirect:cart?user_id=" + user_id;
	}

	@RequestMapping("/charge")
	public String charge(Principal principal, HttpServletRequest req, Model model, HttpSession session) {
		log.info("=================removeCartItem()==========================");

		String subTotal = req.getParameter("subTotal"); // 체크한 물품 총액
		String delivery = req.getParameter("delivery"); // 배송비(2500원 or 무료)
		String cart_no[] = req.getParameterValues("cart_no"); // 장바구니에 담아둔 책 cart_no
		String user_id = principal.getName(); // 로그인한 유저의 아이디 받아온다.

		List<CartJoinBookVO> list = new ArrayList<CartJoinBookVO>();
		CartJoinBookVO cartJoinBookVO;

		// 사용자에 대한 모든 정보를 userVO로 받아옴.
		UserVO userVO = service.getUserInfo(user_id);

		for (int i = 0; i < cart_no.length; i++) {
			// 선택한 카트에 맞는 정보 가져오기.
			cartJoinBookVO = service.getCartOne(cart_no[i]);
			// list에 붙인다.
			list.add(cartJoinBookVO);
		}

		model.addAttribute("list", list);
		model.addAttribute("subTotal", subTotal);
		model.addAttribute("delivery", delivery);
		model.addAttribute("userVO", userVO);
		System.out.println("subTotal" + subTotal);
		return "/shop-charge";
	}

	// 쿠폰 고르기창
	@RequestMapping(value = "/pickCoupon")
	@ResponseBody
	public List<CouponVO> pickCoupon(Principal principal, Model model) {
		String user_id = principal.getName();

		// 현재 로그인한 user가 가지고 있는 쿠폰을 list로 받아온다.
		List<CouponVO> couponList = service.getCouponList(user_id);

		System.out.println("couponList.size() : " + couponList.size());

		return couponList;
	}

	// 쿠폰 선택
	@RequestMapping("/useCoupon")
	public String useCoupon(Principal principal, HttpServletRequest req, Model model) {
		String user_id = principal.getName();

		// 현재 로그인한 user가 가지고 있는 쿠폰을 list로 받아온다.
		List<CouponVO> couponList = service.getCouponList(user_id);
		model.addAttribute("couponList", couponList);

		return "/couponList";
	}

	// 주문 성공
	@Transactional
	@RequestMapping(value = "/successOrder")
	public String successOrder(Principal principal, @ModelAttribute("postVO") PostVO postVO, @ModelAttribute("ordersVO") OrdersVO ordersVO, @ModelAttribute("ordersItemVO") OrdersItemVO ordersItemVO,
			HttpServletRequest req, Model model) {
		System.out.println("successOrder()");
		String user_id = principal.getName(); // 로그인한 유저 id

		// ordersVO 커맨드 객체로 받아온 데이터
		String orders_payment = ordersVO.getOrders_payment(); // 결제 방법(kakao or cash)
		int orders_total = ordersVO.getOrders_total(); // 주문 총 금액
		int orders_pay_total = ordersVO.getOrders_pay_total(); // 총 지불 금액

		System.out.println("orders_pay_total : " + orders_pay_total);
		System.out.println("orders_total : " + orders_total);

		String refund_account = ordersVO.getRefund_account(); // 환불 받을 계좌번호
		String refund_bank = ordersVO.getRefund_bank(); // 환불 받을 은행
		String coupon_no = ordersVO.getCoupon_no(); // 쿠폰
		String orders_pay_date = "";

		// postVO 커맨드 객체로 받아온 데이터
		String post_name = postVO.getPost_name(); // 받는 사람
		String post_phone = postVO.getPost_phone(); // 받는 사람 전화번호
		int post_zipcode = postVO.getPost_zipcode(); // 받는 사람 우편번호
		String post_addr = postVO.getPost_addr(); // 받는 사람 집주소
		String post_addr_detail = postVO.getPost_addr_detail(); // 받는 사람 집주소 디테일

		if (post_addr_detail == null) {
			post_addr_detail = "''";
		}

		String useCoupon = req.getParameter("useCoupon"); // 사용한 쿠폰번호
		int usePoint = Integer.parseInt(req.getParameter("usePoint")); // 사용한 포인트
		int originalPoint = Integer.parseInt(req.getParameter("originalPoint")); // 원래 있던 포인트
		int savePoint = (int) (orders_total * 0.05); // 적립할 포인트

		String delivery = req.getParameter("delivery_fee"); // 배송비
		int delivery_fee;

		if (delivery.equals("무료")) {
			delivery_fee = 0;
		} else {
			delivery_fee = 2500;
		}
		System.out.println("delivery_fee : " + delivery_fee);

		// user_tot_price에 총액 ++
		service.addTotalPrice(user_id, orders_pay_total);

		// 사용한 쿠폰, 포인트 제거
		service.removeCoupon(user_id, useCoupon);

		// 잔여 포인트 = 원래 포인트 - 사용한 포인트 + 적립할 포인트
		service.setUserPoint(user_id, originalPoint - usePoint + savePoint);

		// req로 받아온 데이터
		String isbn[] = req.getParameterValues("isbn"); // 구매한 모든 책들의 isbn
		String cart_cnt[] = req.getParameterValues("cart_cnt"); // 구매한 책 각각의 수량

		// 배열 -> 리스트
		List<String> isbnList = new ArrayList<String>();
		List<String> cart_cntList = new ArrayList<String>();

		// 주문도서 종류의 수 == 각 도서의 주문 수량
		if (isbn.length == cart_cnt.length) {
			for (int i = 0; i < isbn.length; i++) {
				isbnList.add(isbn[i]);
				cart_cntList.add(cart_cnt[i]);
			}
		}

		if (orders_payment.equals("cash")) {
			// payment == cash >> orders_pay_date = ""
			orders_pay_date = "''";
		} else if (orders_payment.equals("kakao")) {
			// payment == kakao >> orders_pay_date = sysdate
			orders_pay_date = "sysdate";
		}

		// 1. post테이블에 배송지 추가
		service.addPost(user_id, post_name, post_phone, post_zipcode, post_addr, post_addr_detail);
		// 2. 배송지 번호 받아오기
		String post_no = service.getPost_no();
		// 3. orders테이블에 주문건 넣기
		service.addOrder(orders_payment, user_id, orders_total, refund_account, refund_bank, orders_pay_date, coupon_no,
				post_no, orders_pay_total, delivery_fee, usePoint);
		// 4. 주문건 번호 받아오기
		String orders_no = service.getOrders_no();
		// 5. orders_item테이블에 주문건 넣기
		for (int i = 0; i < isbn.length; i++) {
			service.addOrderItems(isbn[i], cart_cnt[i], orders_no);
		}

		model.addAttribute("isbn", isbn);
		model.addAttribute("cart_cnt", cart_cnt);

		// 주문한 시간으로부터 24시간 입금하지 않으면 주문 자동 취소
		// 주문한 시간+1일(입금기한) 가져오기
		String limit = service.limitDepositTime(orders_no);
		model.addAttribute("limit", limit);

		// successOrder.jsp에 보내야 야 하는 데이터 (view에서 받을 때)
		// 받는 사람, 휴대폰번호, 주소 >> postVO.post_name, postVO.post_phone,
		// postVO.post_zipcode+postVO.post_addr+postVO.post_addr_detail
		// 주문 도서명, 수량 >> isbn, cart_cnt(model객체로 넘겨준다.)
		// 총 결제 금액 >> ordersVO.orders_total
		// 결제 방법 >> ordersVO.orders_payment

		return "/successOrder";
	}

}
