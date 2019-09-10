package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/index";
	}
	
	@RequestMapping(value = "library", method = RequestMethod.GET)
	public String library() {
		return "/library";
	}
	@RequestMapping(value = "first_page", method = RequestMethod.GET)
	public String first_page() {
		return "/first_page";
	}
}
