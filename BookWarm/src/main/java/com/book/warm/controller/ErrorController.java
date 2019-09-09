package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	@RequestMapping("/404")
	public String error404() {
		return "/error404";
	}
	
	@RequestMapping("/500")
	public String error500() {
		return "/error500";
	}
}
