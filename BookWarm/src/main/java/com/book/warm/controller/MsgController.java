package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.MsgService;

@Controller
public class MsgController {

	@Inject
	MsgService msgservice;

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Model model) throws Exception {
		model.addAttribute("msglist", msgservice.msglist());
		return "message";
	}

	@RequestMapping(value = "/messaginsert", method = RequestMethod.GET)
	public String megr(Model model) throws Exception {
		model.addAttribute("msglist", msgservice.msglist());
		return "messaginsert";
	}
}
