package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.page.Criteria;
import com.book.warm.service.ShopListService;
import com.book.warm.vo.PagingBoardVO;

@Controller
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	
	@RequestMapping(value = "/shoplist", method = RequestMethod.GET)
	public String shop_list(Model model, Criteria criteria) throws Exception {
		
		System.out.println("==================shoplist====================================");
		model.addAttribute("shoptitlelist", shoplistservice.shoptitlelist());
		model.addAttribute("bookpricelist", shoplistservice.bookpricelist());
		
		return "shoplist";
	}
	
	@RequestMapping(value = "/shopproduct", method = RequestMethod.GET)
	public String shop_product(HttpServletRequest req, Model model) throws Exception {
		
		String isbn = req.getParameter("isbn");
		String wname = req.getParameter("writer_name");
		
		System.out.println("=========================== shopproduct ==============================");
		System.out.println("isbn : "+isbn);
		System.out.println("작가명 :" +wname);
		
		model.addAttribute("bookdetail", shoplistservice.bookdetail(isbn, wname));
		model.addAttribute("bookwritername", shoplistservice.bookwritername(wname));
		
		return "shopproduct";
	}
	
	
	
}
