package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.ReviewBoardVO;

@Controller
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService rbs;
	
	@RequestMapping("/recordMain")
	public String recordMain(Model model) {
		
		model.addAttribute("list", rbs.selectBoardList());
		
		return "recordMain";
	}
	
}
