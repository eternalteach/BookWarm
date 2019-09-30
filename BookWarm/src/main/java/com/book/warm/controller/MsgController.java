package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.MsgService;
import com.book.warm.vo.AdminBoardVO;
import com.book.warm.vo.MsgTableVO;

import lombok.extern.log4j.Log4j;

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
		
		cri.setAmount(10);
		//model.addAttribute("msglist", msgservice.msglist(user_id));
		int total = msgservice.getTotalCount(cri);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("msglist2", msgservice.msglist2(user_id));
		model.addAttribute("msgcount", msgservice.msgcount(user_id));
		model.addAttribute("msgcount2", msgservice.msgcount2(user_id));
		return "/message";
	}
	
	@GetMapping(value="/message/pages/{page}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MsgTableVO>> msgpaging(@PathVariable("page")int page, Principal principal){
		log.info("=================페이징 + 보낸쪽지함 리스트 뿌리기=============================");
		Criteria criteria = new Criteria(page, 10);
		String user_id = principal.getName();
		return new ResponseEntity<>(msgservice.msgpaging(user_id, criteria),HttpStatus.OK);
	}
	
	@GetMapping(value = "/send", consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<MsgTableVO> create(@RequestBody MsgTableVO msgvo, Principal principal){
		log.info("=================send=======================");
		msgservice.msginsert(msgvo);
		return new ResponseEntity<MsgTableVO>(msgservice.msginsert(msgvo),HttpStatus.OK);
	}
	
	// 모달창에서 쪽지보내기
//	@RequestMapping(value = "/send", method = RequestMethod.GET)
//	public String send(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo) {
//		log.info("=================send=============================");
//		msgservice.msginsert(msgvo);
//		return "redirect:/message";
//	}
	
	// 쪽지 삭제
//	@RequestMapping(value = "/msgdelete", method = RequestMethod.GET)
//	public String msgdelete(HttpServletRequest request, RedirectAttributes rttr, Model model, MsgTableVO msgvo) {
//		log.info("====================msgdelete========================");
//		String num = request.getParameter("msg_no");
//		int msg_no = Integer.parseInt(num);
//		log.info("쪽지번호 : " + msg_no);
//		msgservice.msgdelete(msg_no);
//		rttr.addFlashAttribute("tab_name", request.getParameter("tab_name"));
//
//		return "redirect:/message";
//	}
	
}
