package com.book.warm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public String index(HttpSession session, HttpServletRequest request) {
//		log.info("============================= index ===========================");
//		// 임시로그인 나중에 지우기
//		session = request.getSession(false);
//		session.setAttribute("user_id", "aaa");
//		log.info((String)session.getAttribute("user_id"));
//		// 여기까지 지우기
//		return "/index";
//	}

	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preview() {
		return "/preview";
	}

	@RequestMapping(value = "/getBookInfo2", method = RequestMethod.GET)
	public String first_page() {
		log.info("============================= getBookInfo ===========================");
		System.out.println("parsingJson : ");
		return "getBookInfo2";
	}

}
