package com.book.warm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Inject
	ShopBoardService service;

	@RequestMapping(path = "/cart")
	public String cart(HttpServletRequest req, Model model) {
		
		// url에서 user_id를 받아온다.
		String user_id = req.getParameter("user_id");
		
		List<CartJoinBookVO> list = service.cartList(user_id);
		model.addAttribute("list", list);

		return "/shop-cart";
	}

	@RequestMapping("/removeCartItem")
	public String removeCartItem(HttpServletRequest req, RedirectAttributes rttr) {
		System.out.println("removeCartItem()");
		// url에서 user_id를 받아온다.
		String user_id = req.getParameter("user_id");
		String isbn = req.getParameter("isbn");

		// 삭제하려는 cart_no가 넘어온 경우 : 삭제 -> 새로 뿌려주기
		if (isbn != null)
			service.removeCart(user_id, isbn);
		
		rttr.addAttribute("user_id", user_id);

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
	public String charge(HttpServletRequest req, Model model, HttpSession session) {
		String subTotal = req.getParameter("subTotal"); // 체크한 물품 총액
		String delivery = req.getParameter("delivery"); // 배송비(2500원 or 무료)
		String cart_no[] = req.getParameterValues("cart_no"); // 장바구니에 담아둔 책 cart_no
		String user_id = (String) session.getAttribute("user_id"); // 로그인한 유저의 아이디 받아온다.

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
	public List<CouponVO> pickCoupon(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		
		// 현재 로그인한 user가 가지고 있는 쿠폰을 list로 받아온다.
		List<CouponVO> couponList = service.getCouponList(user_id);
		// model.addAttribute("couponList", couponList);
		
		// return "/couponList";
		return couponList;
	}
	
	// 쿠폰 선택
	@RequestMapping("/useCoupon")
	public String useCoupon(HttpSession session, HttpServletRequest req, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		
		// 현재 로그인한 user가 가지고 있는 쿠폰을 list로 받아온다.
		List<CouponVO> couponList = service.getCouponList(user_id);
		model.addAttribute("couponList", couponList);
		
		return "/couponList";
	}

}
