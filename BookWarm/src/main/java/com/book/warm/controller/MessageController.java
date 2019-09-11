package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Model model) throws Exception {
		
		return "message";
	}
	
	
}
