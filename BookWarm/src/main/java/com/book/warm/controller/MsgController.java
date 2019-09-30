package com.book.warm.controller;

import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.MsgService;
import com.book.warm.vo.MsgTableVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
//@RequestMapping("/message")
@Log4j
public class MsgController {

	@Inject
	MsgService msgservice;

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo, Criteria cri) {
		log.info("=================messgae=============================");
		String user_id = principal.getName();
		
		log.info("유저아이디:" + user_id);
		log.info(cri);
		
		//model.addAttribute("msglist", msgservice.msglist(user_id));
		
		model.addAttribute("msglist", msgservice.msgpaging(user_id, cri));
		
		int total = msgservice.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		model.addAttribute("msglist2", msgservice.msglist2(user_id));
		model.addAttribute("msgcount", msgservice.msgcount(user_id));
		model.addAttribute("msgcount2", msgservice.msgcount2(user_id));
		
		
		return "/message";
	}
	//모달창에서 쪽지보내기
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String send(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo) {
		log.info("=================send=============================");
		msgservice.msginsert(msgvo);
		return "redirect:/message";
	}
	//쪽지 삭제
	@RequestMapping(value = "/msgdelete", method = RequestMethod.GET)
	public String msgdelete(HttpServletRequest request, RedirectAttributes rttr, Model model, MsgTableVO msgvo) {
		log.info("====================msgdelete========================");
		String num = request.getParameter("msg_no");
		int msg_no = Integer.parseInt(num);
		log.info("쪽지번호 : " + msg_no);
		msgservice.msgdelete(msg_no);
		rttr.addFlashAttribute("tab_name", request.getParameter("tab_name"));
		
		return "redirect:/message";
	}

}
