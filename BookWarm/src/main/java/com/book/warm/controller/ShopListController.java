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

import com.book.warm.page.Criteria;
import com.book.warm.service.ShopBoardService;
import com.book.warm.service.ShopListService;
import com.book.warm.vo.BookListVO;
import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	@Inject
	ShopBoardService shopboardservice;
	
	@RequestMapping(value = "/shoplist", method = RequestMethod.GET)
	public String shoplist(HttpSession session, HttpServletRequest request, Model model, Criteria criteria) throws Exception {
		log.info("==================shoplist====================================");
		
		session = request.getSession();
		String user_id =(String)session.getAttribute("user_id");
		log.info("session에 있는 user_id : " + user_id);
		
		
		model.addAttribute("shoptitlelist", shoplistservice.shoptitlelist());
		model.addAttribute("bookpricelist", shoplistservice.bookpricelist());
		model.addAttribute("bookpricelist2", shoplistservice.bookpricelist2());
		
		return "shoplist";
	}
	
	//책 상세정보 보기
	@RequestMapping(value = "/shopproduct", method = RequestMethod.GET)
	public String shop_product(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		log.info("=========================== shopproduct ==============================");
		session = request.getSession();
		String user_id =(String)session.getAttribute("user_id");
		String isbn = request.getParameter("isbn");
		BookListVO booklistvo = shoplistservice.bookdetail(isbn);
		String author = booklistvo.getAuthor();
		
		log.info("session에 있는 user_id : " + user_id);
		log.info("isbn : "+isbn);
		log.info("author :" + author);
		
		model.addAttribute("user_id", user_id);
		//model.addAttribute("pageWithLogin", true);
		model.addAttribute("bookdetail", shoplistservice.bookdetail(isbn));
		model.addAttribute("bookwritername", shoplistservice.bookwritername(author));
		
		//구매버튼으로 넘길때 받아 올 것들
		String cart_no = request.getParameter("cart_no");  
		String subTotal = request.getParameter("subTotal"); // 체크한 물품 총액
		String delivery = request.getParameter("delivery"); // 배송비(2500원 or 무료)
		List<CartJoinBookVO> list = new ArrayList<CartJoinBookVO>();
		UserVO userVO = shopboardservice.getUserInfo(user_id);
		System.out.println(cart_no);
		return "shopproduct";
	}
	
	
	
}
