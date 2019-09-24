package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.warm.service.MsgService;
import com.book.warm.vo.MsgTableVO;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/message")
@Log4j
public class MsgController {

	@Inject
	MsgService msgservice;

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo) {
		log.info("=================messgae=============================");
		String user_id =principal.getName();
		String msg_get_id = request.getParameter("msg_get_id");
		String msg_send_id = request.getParameter("msg_send_id");
		msg_get_id =user_id;
		
		log.info("유저아이디:" + user_id);
		log.info("받는사람아이디:"+msg_get_id);
		
		//List<MsgTableVO> msglist = msgservice.msglist2(msg_send_id);
		
		model.addAttribute("msglist", msgservice.msglist(msg_get_id));
		//model.addAttribute("list", msglist);
		
		return "/message";
	}
	
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String send(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo) {
		log.info("=================send=============================");
		String user_id =principal.getName();
		String msg_get_id = request.getParameter("msg_get_id");
		String msg_send_id = request.getParameter("msg_send_id");
		
		msg_get_id =user_id;
		msgvo.setMsg_get_id(msg_get_id);
		
		msgservice.msginsert(msgvo);

		log.info("유저아이디 : " +user_id);
		log.info("보낸사람아이디:"+msg_get_id);
		log.info("받는사람아이디:"+msg_send_id);
		log.info("움아ㅣ러ㅗ미ㅏㅇ롬아ㅣㅓㄹ"+msgvo);
		
		return "redirect:/message";
	}

}
