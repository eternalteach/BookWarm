package com.book.warm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/index";
	}
	
	@RequestMapping(value = "/foo1", method = RequestMethod.GET)
	public String footer1() {
		return "includes/footer/footer1";	}
	
	@RequestMapping(value = "/foo2", method = RequestMethod.GET)
	public String foo2() {
		return "includes/footer/footer2";	}
	
	@RequestMapping(value = "/foo4", method = RequestMethod.GET)
	public String foo4() {
		return "includes/footer/footer4";	}
	
	@RequestMapping(value = "/transparent", method = RequestMethod.GET)
	public String transparent() {
		return "includes/header/transparent";	}
}
