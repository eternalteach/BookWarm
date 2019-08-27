package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.LogingBoardService;
import com.book.warm.vo.LogingBoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardLogController {
	@Inject
	LogingBoardService lbs;

	@RequestMapping(value = "/boardlog", method = RequestMethod.GET)
	public String boardlog(Model model, LogingBoardVO logingBoardVO) throws Exception {
		System.out.println("boardlog");
		int writeNo = logingBoardVO.getWriteNo();
		System.out.println("writeNo : "+writeNo);
		model.addAttribute("boardlog", lbs.selectBoardOne(writeNo));
		return "/boardlog";
	}
}
