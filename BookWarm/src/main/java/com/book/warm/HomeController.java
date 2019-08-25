package com.book.warm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/index";
	}
	
	@RequestMapping(value = "/dark", method = RequestMethod.GET)
	public String dark() {
		return "includes/header/header-dark-dropdown";
	}
	
	@RequestMapping(value = "/full", method = RequestMethod.GET)
	public String full() {
		return "includes/header/header-full-width";
	}
	
	@RequestMapping(value = "/foo1", method = RequestMethod.GET)
	public String footer1() {
		return "includes/footer/footer1";	}
	
	@RequestMapping(value = "/foo2", method = RequestMethod.GET)
	public String foo2() {
		return "includes/footer/footer2";	}
}
