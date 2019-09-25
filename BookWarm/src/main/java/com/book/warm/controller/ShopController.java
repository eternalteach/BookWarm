package com.book.warm.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.PayVO;
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
	
	//장바구니 추가
	@RequestMapping("/insertcart")
	public String insert(HttpSession session, HttpServletRequest req, Model model, CartJoinBookVO cartvo) {
		log.info("====================insertcart()==========================");
		session = req.getSession();
		
		String user_id =(String)session.getAttribute("user_id");
		String isbn = req.getParameter("isbn");
		String cart_cnt = req.getParameter("cart_cnt");//책 권수
		
		cartvo.setUser_id(user_id);
		
		//장바구니에 기존상품이 있는지 검사!!	
		int countCart = service.countcart(isbn, user_id);
		log.info("장바구니에 기존상품이 있는지 검사" + countCart);
		log.info("select 책 권수:" + cart_cnt);
		
		//insert
		if(countCart == 0) {
			service.insertcart(cartvo);
			log.info("insert  구문 실행" + countCart);
		}else {
			service.updatecart(cartvo);	
			log.info("update 구문 실행" + countCart);
		}		
		return "redirect:/shop/cart";
	}
	
	@RequestMapping(path = "/cart")
	public String cart(Principal principal, Model model, CartJoinBookVO cartvo) {
		log.info("=================cart()==========================");

		String user_id =principal.getName();
		cartvo.setUser_id(user_id);
		
		List<CartJoinBookVO> list = service.cartList(user_id);
		
		model.addAttribute("list", list);
		return "/shop-cart";
	}
	
	@RequestMapping("/removeCartItem")
	public String removeCartItem(HttpServletRequest req, RedirectAttributes rttr) {
		log.info("=================removeCartItem()==========================");
		// url에서 user_id를 받아온다.
		String user_id = req.getParameter("user_id");
		String isbn = req.getParameter("isbn");
		int cart_no = Integer.parseInt(req.getParameter("cart_no"));

//		// 삭제하려는 cart_no가 넘어온 경우 : 삭제 -> 새로 뿌려주기
//		if (isbn != null)
//			service.removeCart(user_id, isbn);
		service.delete(cart_no);
		
		return "redirect:/shop/cart";
	}
	

	@RequestMapping("/cntUp")
	public String cntUp(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt")) + 1;
		String cart_no = req.getParameter("cart_no");
		String user_id = req.getParameter("user_id");

		service.updateCnt(cart_cnt, cart_no);

		return "redirect:cart?user_id=" + user_id;
	}

	@RequestMapping("/cntDown")
	public String cntDown(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"));
		String user_id = req.getParameter("user_id");

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
		System.out.println("subTotal"+subTotal);
		return "/shop-charge";
	}
	
	// 쿠폰 고르기창
	@RequestMapping(value="/pickCoupon")
	@ResponseBody
	public List<CouponVO> pickCoupon(Principal principal, Model model) {
		String user_id = principal.getName();
		
		// 현재 로그인한 user가 가지고 있는 쿠폰을 list로 받아온다.
		List<CouponVO> couponList = service.getCouponList(user_id);
		// model.addAttribute("couponList", couponList);
		
		// return "/couponList";
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
	
	
	// 주문 성공 >> 트랜잭션으로 묶어야함
	@RequestMapping("successOrder")
	public String successOrder(Principal principal, PayVO payVO, HttpServletRequest req, Model model) {
		
		
		String pay_way = payVO.getPay_way(); // 결제 방법(kakao or cash)
		int pay_total = payVO.getPay_total(); // 주문 총 금액
		String pay_refund_account = payVO.getPay_refund_account(); // 환불 받을 계좌번호
		String pay_refund_bank = payVO.getPay_refund_bank(); // 환불 받을 은행
		String coupon_no = payVO.getCoupon_no(); // 쿠폰
		
		String user_id = principal.getName(); // 로그인한 유저 id
		String name = req.getParameter(""); // 받는 사람 이름
		String isbn[] = req.getParameterValues("isbn"); // 구매한 모든 책들의 isbn
		String cart_cnt[] = req.getParameterValues("cart_cnt"); // 구매한 모든 책들의 isbn
		String orders_pay_date = "";
		
		System.out.println("payment(kakao) : "+payVO.getPay_way());
		
		if(pay_way.equals("cash")) {
			// payment == cash  >>  orders_pay_date = ""
			orders_pay_date = "''";
		}else if(pay_way.equals("kakao")) {
			// payment == kakao  >>  orders_pay_date = sysdate
			orders_pay_date = "sysdate";
		}
		
		// pay테이블에 주문건 넣기
		service.makePayment(pay_way, pay_total, pay_refund_account, pay_refund_bank, orders_pay_date, coupon_no);
		int pay_no = service.getPay_no();
		
		// orders테이블에 주문건 넣기
		for(int i=0; i<isbn.length; i++) {
			service.makeOrder(user_id, isbn[i], cart_cnt[i], pay_no);
		}
		
		// successOrder.jsp에 보내야 하는 데이터
		// 받는 사람, 휴대폰번호, 주소
		
		// 주문 도서명, 수량
		// 총 결제 금액
		// 결제 방법
		
		
		return "/successOrder";
	}
	

}
