package com.book.warm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preview() {
		return "/preview";
	}
}
