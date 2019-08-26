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
	
	@RequestMapping("features-footer-1")
	public String features_footer_1() {
		return "/includes/footer/features-footer-1";
	}
	
	@RequestMapping("features-footer-2")
	public String features_footer_2() {
		return "/includes/footer/features-footer-2";
	}
	
	@RequestMapping("features-footer-4")
	public String features_footer_4() {
		return "/includes/footer/features-footer-4";
	}
	
	@RequestMapping("features-footer-5")
	public String features_footer_5() {
		return "/includes/footer/features-footer-5";
	}
	
	
	
}
