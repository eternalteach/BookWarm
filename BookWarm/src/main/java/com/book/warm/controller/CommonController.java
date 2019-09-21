package com.book.warm.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	
	@GetMapping("/home")
	public String home() {
		
		return "index";
	}
	
	@GetMapping("/index")
	public void loginInput(Principal principal, String error, String logout, Model model) {
		
		
		// 다른 페이지에 접속하려고 하면 띄워지는 로그인 페이지.
		// 그럼 여기 말고 다른 메인 접속 메서드를 만들어놓으면 index로 가게 하면 어떤가여
		
		
		// index로 들어왔을 때, 로그인이 된 사용자라면 사용자의 id를 받아서 library로 가게 하고,
		// 아니라면 그냥 로그인 창을 띄운다.
		
		// 로그인을 시도했을 때(form 제출했을 때)
		// 로그인 성공하면 library페이지로 가고, 로그인에 실패하면 같은 페이지 redirect가 될 것임.
		
		// 다른 페이지들의 경우 모두 로그인이 된 사용자만 접근 가능.
		// 
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", " Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		
		log.info("post custom logout");
	}
}
