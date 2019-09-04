package com.book.warm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Inject
	ShopBoardService service;
	
	@RequestMapping("/shop-cart")
	public String shop_cart(HttpServletRequest req, Model model) {
		
		// url에서 user_id를 받아온다.
		String user_id = req.getParameter("user_id");
		String isbn = req.getParameter("isbn");
		
		// 삭제하려는 cart_no가 넘어온 경우 : 삭제 -> 새로 뿌려주기
		if(isbn != null) 
			service.removeCart(user_id, isbn);
		System.out.println(user_id);
		// 장바구니 화면에 그냥 접속한 경우
		List<CartVO> list = service.cartList(user_id);
		
		model.addAttribute("list", list);
		
		return "/shop-cart";
	}
	
	@RequestMapping("/cntUp")
	public String cntUp(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"))+1;
		String cart_no = req.getParameter("cart_no");
		String user_id = req.getParameter("user_id");
		
		service.updateCnt(cart_cnt, cart_no);
		
		return "redirect:shop-cart?user_id="+user_id;
	}
	
	@RequestMapping("/cntDown")
	public String cntDown(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"))-1;
		String cart_no = req.getParameter("cart_no");
		String user_id = req.getParameter("user_id");
		
		service.updateCnt(cart_cnt, cart_no);
		
		return "redirect:shop-cart?user_id="+user_id;
	}
	
	@RequestMapping("/charge")
	public String charge(HttpServletRequest req, Model model) {
		String subTotal = req.getParameter("subTotal");
		String delivery = req.getParameter("delivery");
		String cart_no[] = req.getParameterValues("cart_no");
		
		List<CartVO> list = new ArrayList<CartVO>();
		CartVO cartVO;
		
		for(int i=0; i<cart_no.length; i++) {
			// 선택한 카트에 맞는 정보 가져오기.
			cartVO = service.getCartOne(cart_no[i]);
			// list에 붙인다.
			list.add(cartVO);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("subTotal", subTotal);
		model.addAttribute("delivery", delivery);
		
		return "/shop-charge";
	}
	
}
