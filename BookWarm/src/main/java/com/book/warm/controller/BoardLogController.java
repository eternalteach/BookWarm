package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.LogingBoardService;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class BoardLogController {
	@Inject
	LogingBoardService logingBoardService;

	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/boardlog", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardlog(Model model, LogingBoardVO logingBoardVO, BookVO bookVO) throws Exception {
		log.info("===== boardlog() =====");
		ArrayList<LogingBoardVO> logingList = logingBoardService.selectList(logingBoardVO.getWriteNo());
		int readPageNum=statisticsFunctionService.logingPage(logingList, bookVO);
		int logingCount = logingBoardService.CountWriteNo(logingBoardVO.getWriteNo());
		int bookTotalPage=bookVO.getTotalPage(); /*tmp value, please modify this code*/
		double reading=((double)readPageNum/(double)bookTotalPage)*100;
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookTotalPage", bookTotalPage);
		return "/boardlog";
	}
}
