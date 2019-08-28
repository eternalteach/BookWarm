package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.warm.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService rbs;
	
	@RequestMapping("/reviewMain")
	public String recordMain(Model model) {
		
		model.addAttribute("list", rbs.selectBoardList());
		
		return "reviewMain";
	}
	
	@RequestMapping("/reviewPerBook")
	public String reviewPerBook(@RequestParam("isbn") String isbn, Model model) {
		
		model.addAttribute("list", rbs.selectListPerBook(isbn));
		
		return "reviewPerBook";
	}
	
}
