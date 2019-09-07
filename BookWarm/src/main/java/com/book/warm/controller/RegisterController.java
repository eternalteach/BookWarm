package com.book.warm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.book.warm.service.LoginService;
import com.book.warm.service.RegisterService;
import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartVO;
import com.book.warm.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisterController {
	
	@Inject
	RegisterService registerService;
	
	// 회원가입(중복 확인)페이지 띄우는 controller
	@RequestMapping(value="/checkDuplicateRegister") 
	public String checkDuplicateRegister() {
		
		return "/checkDuplicateRegister";
	}
	
	// 중복확인처리 controller
	@RequestMapping(value="/checkDuplicated") 
	public String checkDuplicated(HttpServletRequest req, RedirectAttributes rttr) {
		
		// 1. 이름, 메일주소 받아온다
		String user_name = req.getParameter("user_name");
		String user_mail1 = req.getParameter("user_mail1");
		String user_mail2 = req.getParameter("user_mail2");
		String user_mail = user_mail1+"@"+user_mail2;
		
		// 2. 받아온 정보들을 가지고 있는 유저가 있는지 db에서 확인한다.
		UserVO userVO = registerService.checkUser(user_mail);
		
		if(userVO!=null) {
			// userVO로 받아온게 있다면 >> 이미 존재하는 유저(중복)
			rttr.addFlashAttribute("msg", "id, pw가 이미 존재하는 유저입니다."); 
			return "redirect:/login";
		}else {
			// userVO로 받아온게 없다면(null) >> 새로운 유저
			rttr.addFlashAttribute("user_name", user_name);
			rttr.addFlashAttribute("user_mail1", user_mail1);
			rttr.addFlashAttribute("user_mail2", user_mail2);
			
			return "redirect:/register";
		}
		
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/register") 
	public String register(HttpServletRequest req, Model model) {
		
		String user_name = null;
		String user_mail1 = null;
		String user_mail2 = null;
		
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(req);
		
		if(map!=null) {
			user_name = (String) map.get("user_name");
			user_mail1 = (String) map.get("user_mail1");
			user_mail2 = (String) map.get("user_mail2");
			
			model.addAttribute("user_name", user_name);
			model.addAttribute("user_mail1", user_mail1);
			model.addAttribute("user_mail2", user_mail2);
		}
		
		if(user_name!=null && user_mail1!=null && user_mail2!=null) {
			return "/register";
		}
		
		// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
		return "redirect:/checkDuplicateRegister";
	}
	
	// 회원가입 성공 페이지
	@RequestMapping(value="/registerSuccess", method=RequestMethod.POST)
	public String registerSuccess(UserVO userVO) {
		
		// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
		if(userVO==null)
			return "redirect:/checkDuplicateRegister";
		
		
		// 받아온 데이터 db에 넣기
		registerService.insertNewUser(userVO);
		return "/registerSuccess";
	}
	//
	@RequestMapping(value="/registerSuccess", method=RequestMethod.GET)
	public String registerSuccessByURL() {
		
		// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
		return "redirect:/checkDuplicateRegister";
		
	}
	
	
	// id 중복확인
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public int idCheck(@RequestParam("user_id") String user_id) {
		System.out.println("user_id : " + user_id);
		int rtn =  registerService.checkDuplicatedId(user_id);
		System.out.println("id 체크 완료");
		return rtn;
	}
	
	
}
