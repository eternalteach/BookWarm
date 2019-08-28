package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.ShopListService;

@Controller
public class ShopListController {
	
	@Inject
	ShopListService shopslistservice;
	
	//책 리스트 보여주는 페이지
	@RequestMapping(value = "/shop_list", method = RequestMethod.GET)
	public String shop_list(Model model) throws Exception {
		
		System.out.println("책 리스트 나오나용");
		model.addAttribute("list", shopslistservice.shoplist());
		return "shop_list";
	}
	
}
