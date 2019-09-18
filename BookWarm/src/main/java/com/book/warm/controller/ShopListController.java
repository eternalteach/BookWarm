package com.book.warm.controller;

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

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	@Inject
	ShopBoardService service;
	
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
		
		log.info("session에 있는 user_id : " + user_id);
		
		String isbn = request.getParameter("isbn");
		
		BookListVO booklistvo = shoplistservice.bookdetail(isbn);
		String author = booklistvo.getAuthor();
		
		
		log.info("isbn : "+isbn);
		log.info("author :" + author);
		
		model.addAttribute("user_id", user_id);
		//model.addAttribute("pageWithLogin", true);
		model.addAttribute("bookdetail", shoplistservice.bookdetail(isbn));
		model.addAttribute("bookwritername", shoplistservice.bookwritername(author));
		
		return "shopproduct";
	}
	
	
	
}
