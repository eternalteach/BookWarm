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
	
	@RequestMapping("/reviewPerBook2")
	public String reviewPerBook2(@RequestParam("isbn") String isbn, Model model) {
		
		model.addAttribute("list", rbs.selectListPerBook(isbn));
		model.addAttribute("thumbnail", rbs.showBookThumbnail(isbn));
		return "reviewPerBook2";
	}
	
	
	@RequestMapping("/reviewPerBook")
	public String reviewPerBook(@RequestParam("isbn") String isbn, Model model) {
		
		model.addAttribute("list", rbs.selectListPerBook(isbn));
		model.addAttribute("thumbnail", rbs.showBookThumbnail(isbn));
		return "reviewPerBook";
	}
	
	@RequestMapping("/reviewSelectOne")
	public String reviewSelectOne(@RequestParam("review_no") String review_no, 
									    @RequestParam("isbn") String isbn, 
									    Model model) {
		
		model.addAttribute("review", rbs.selectedReview(review_no));
		model.addAttribute("book", rbs.bookInfo(isbn));
		return "reviewSelectOne";
	}
	
	@RequestMapping("/reviewWrite")
	public String reviewWrite(@RequestParam("isbn") String isbn, Model model) {
		
		
		
		return "reviewWrite";
	}
	
}
