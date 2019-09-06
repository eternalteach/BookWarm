package com.book.warm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.LoginService;
import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartVO;
import com.book.warm.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Inject
	LoginService loginService;
	
	@RequestMapping("/login")
	public String login(HttpSession session, HttpServletRequest req, Model model) {
		
		String user = (String) session.getAttribute("user_id");
		String rtn;
		
		// 1. 이전 로그인 했을 때 자동로그인 체크했었는지 확인 (user_id쿠키 있는지 확인)
		Cookie[] cookies = req.getCookies();
		if(cookies!=null && cookies.length>0) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("user_id")) {
					// 쿠키의 key값이 user_id라면 value를 'user_id'변수에 저장시킨다.
					user = cookies[i].getValue();
					// 세션도 만들어줌
					session.setAttribute("user_id", user);
				}
			}
		}
		
		// 2. 로그인 성공 여부 확인
		if(user!=null) {
			// 로그인 성공
			rtn = "redirect:/shop/cart?user_id="+user;
		}else {
			// 로그인 실패 or 로그인페이지 처음 들어갔을 때
			rtn = "/login";
		}
		
		return rtn;
	}
	
	@RequestMapping(value="/loginAction", method=RequestMethod.POST)
	public String loginAction(HttpServletRequest req, HttpServletResponse res, RedirectAttributes rttr) {
		
		HttpSession session = req.getSession();
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		String remember = req.getParameter("remember");
		
		UserVO user = loginService.loginMember(user_id, user_pw);
		
		if(user!=null) {
			// 로그인 성공
			session.setAttribute("user_id", user_id);
			if(remember!=null && remember.equals("on")) { // 자동로그인 yes
				Cookie cookie = new Cookie("user_id", user_id);
				cookie.setMaxAge(60*60*24); // 하루동안만 유지
//				cookie.setMaxAge(60); // 1분동안만 유지
				res.addCookie(cookie);
			}
			// return "/index";
		}
		
		return "redirect:login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, HttpServletResponse res, HttpServletRequest req) {
		
		// 1. 세션 해제
		session.invalidate();
		// 2. 자동로그인 설정 돼있는 상태 >> 쿠키 삭제
		Cookie[] cookies = req.getCookies();
		if(cookies!=null && cookies.length>0) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("user_id")) {
					cookies[i].setMaxAge(0);
					res.addCookie(cookies[i]);
				}
			}
		}
		
		return "redirect:login";
	}
	
}
