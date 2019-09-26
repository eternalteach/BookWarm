package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		String user_id = principal.getName();
		String msg_get_id = request.getParameter("msg_get_id");
		// getid와 로그인 한 사람은 같다
		msg_get_id = user_id;
		
		log.info("유저아이디:" + user_id);
		log.info("받는사람아이디:" + msg_get_id);
		
		model.addAttribute("msglist", msgservice.msglist(msg_get_id));
		model.addAttribute("msglist2", msgservice.msglist2(msg_get_id));
		//model.addAttribute("count", msgservice.(Integer.parseInt(count(msg_get_id)));
		
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
	public String msgdelete(HttpServletRequest request, Model model, MsgTableVO msgvo) {
		log.info("====================msgdelete========================");
		String num = request.getParameter("msg_no");
		int msg_no = Integer.parseInt(num);
		log.info("쪽지번호 : " + msg_no);
		msgservice.msgdelete(msg_no);
		rttr.addFlashAttribute("tab_name", request.getParameter("tab_name"));
		//model.addAttribute("msgdelete", msgservice.msgdelete(msg_no));
		
		return "redirect:/message";
	}

}
