package com.book.warm.controller;

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
		
		// 장바구니 화면에 그냥 접속한 경우
		List<CartVO> list = service.cartList(user_id);
		
		model.addAttribute("list", list);
		
		return "/shop-cart";
	}
	
}
