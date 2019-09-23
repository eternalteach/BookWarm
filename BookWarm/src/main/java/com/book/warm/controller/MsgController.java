package com.book.warm.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.MsgService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MsgController {

	@Inject
	MsgService msgservice;

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Principal principal, Model model) throws Exception {
		log.info("=================messgae=============================");
		String user_id =principal.getName();
		
		model.addAttribute("msglist", msgservice.msglist());
		return "message";
	}

}
