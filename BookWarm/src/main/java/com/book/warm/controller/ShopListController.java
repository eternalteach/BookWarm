package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.page.Criteria;
import com.book.warm.service.ShopListService;
import com.book.warm.vo.PagingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	
	@RequestMapping(value = "/shoplist", method = RequestMethod.GET)
	public String shoplist(HttpSession session, HttpServletRequest request, Model model, Criteria criteria) throws Exception {
		log.info("==================shoplist====================================");
		
		session = request.getSession();
		String user_id =(String)session.getAttribute("user_id");
		
		model.addAttribute("shoptitlelist", shoplistservice.shoptitlelist());
		model.addAttribute("bookpricelist", shoplistservice.bookpricelist());
		
		return "shoplist";
	}
	
	@RequestMapping(value = "/shopproduct", method = RequestMethod.GET)
	public String shop_product(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		log.info("=========================== shopproduct ==============================");
		session = request.getSession();
		String isbn = request.getParameter("isbn");
		String author = request.getParameter("author");
		
		log.info("isbn : "+isbn);
		log.info("author :" + author);
		
		model.addAttribute("bookdetail", shoplistservice.bookdetail(isbn));
		model.addAttribute("bookwritername", shoplistservice.bookwritername(author));
		
		return "shopproduct";
	}
	
	
	
}
