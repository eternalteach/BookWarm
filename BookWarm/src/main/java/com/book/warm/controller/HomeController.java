package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Log4j
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
	@RequestMapping(value = "getBookInfo2", method = RequestMethod.GET)
	public String first_page() {
		log.info("============================= getBookInfo ===========================");
		System.out.println("parsingJson Å×½ºÆ®");
		return "/getBookInfo2";
	}


	
}
