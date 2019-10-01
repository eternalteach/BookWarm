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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
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
	public String message(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo, Criteria cri) {
		log.info("=================messgae=============================");
		String user_id = principal.getName();
		log.info("유저아이디:" + user_id);
		log.info(cri);
		
		model.addAttribute("msglist", msgservice.msglist(user_id));
		model.addAttribute("msglist2", msgservice.msglist2(user_id));
		cri.setAmount(10);
		//받은개수
		int total = msgservice.getTotalCount(user_id, cri);
		model.addAttribute("total", total);
		//보낸개수
		int total2 = msgservice.sendTotalCount(user_id, cri);
		model.addAttribute("total2", total2);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("msgcount", msgservice.msgcount(user_id));
		model.addAttribute("msgcount2", msgservice.msgcount2(user_id));
		return "/message";
	}
	
	//받은리스트
	@GetMapping(value="/message/get/{page}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MsgTableVO>> msgpaging(@PathVariable("page")int page, Principal principal){
		log.info("=================페이징 + 받은쪽지함 리스트 뿌리기=============================");
		Criteria criteria = new Criteria(page, 10);
		String user_id = principal.getName();
		return new ResponseEntity<>(msgservice.msgpaging(user_id, criteria),HttpStatus.OK);
	}
	
	//보낸쪽지리스트
	@GetMapping(value="/message/send/{page}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MsgTableVO>> msgpaging2(@PathVariable("page")int page, Principal principal){
		log.info("=================페이징 + 보낸쪽지함 리스트 뿌리기=============================");
		Criteria criteria = new Criteria(page, 10);
		String user_id = principal.getName();
		return new ResponseEntity<>(msgservice.msgpaging2(user_id, criteria),HttpStatus.OK);
	}
	
	// 모달창에서 쪽지보내기
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String send(Principal principal, HttpServletRequest request, Model model, MsgTableVO msgvo) {
		log.info("=================send=============================");
		msgservice.msginsert(msgvo);
		return "redirect:/message";
	}
	
	//쪽지삭제
	@DeleteMapping(value= "/msgdelete/{msg_no},{msg_get_id}",
				produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> msgdelete(@PathVariable("msg_no") int msg_no, Principal principal){
		log.info("====================삭제====================================");
		String user_id = principal.getName();
		return msgservice.msgdelete(msg_no, user_id)==1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
	
}
