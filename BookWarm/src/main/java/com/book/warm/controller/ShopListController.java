package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ShopListController {
	
	@RequestMapping(value = "/shop_list", method = RequestMethod.GET)
	public String shop_list() {
		return "shop_list";
	}
	
}
