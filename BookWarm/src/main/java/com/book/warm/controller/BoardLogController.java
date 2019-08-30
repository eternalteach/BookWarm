package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.ISBNimgMapper;
import com.book.warm.mapper.LogingBoardMapper;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.ISBNimgVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardLogController {
	@Inject
	LogingBoardMapper logingBoardMapper;

	@Inject
	ISBNimgMapper iBNimgMapper;
	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/boardlog", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardLog(Model model, LogingBoardVO logingBoardVO, BookVO bookVO) throws Exception {
		log.info("===== boardlog() =====");
		ArrayList<LogingBoardVO> logingList = logingBoardMapper.selectList(logingBoardVO.getIsbn());
		String isbn = "isbn001";
		ISBNimgVO iSBNimgVO = iBNimgMapper.getBookImg(isbn);
		System.out.println(iSBNimgVO.getIsbn());
		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO);
		int startPage = statisticsFunctionService.firstPage(logingList);
		int endPage = statisticsFunctionService.endPage(logingList);
		int logingCount = logingBoardMapper.CountWriteNo(logingBoardVO.getIsbn());
		int bookTotalPage = bookVO.getTotalPage(); /* tmp value, please modify this code */
		double reading = ((double) readPageNum / (double) bookTotalPage) * 100;
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("loginglist", logingList);
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookTotalPage", bookTotalPage);
		model.addAttribute("ISBNimg", iSBNimgVO);
		return "/boardlog";
	}

	@RequestMapping(value = "/boardlogwrite", method = RequestMethod.GET)
	public String boardLogWrite() throws Exception {
		log.info("===== boardLogWrite() =====");
		return "/boardlogwrite";
	}

	@RequestMapping(value = "/boardLogWriteSave", method = RequestMethod.POST)
	public String boardLogWriteSave() throws Exception {
		log.info("===== boardLogWrite() =====");
		return "redirect:boardlog";
	}
}
