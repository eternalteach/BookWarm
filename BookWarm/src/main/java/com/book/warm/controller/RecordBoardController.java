package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.mapper.LogingBoardMapper;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecordBoardController {
	@Inject
	LogingBoardMapper logingBoardMapper;

	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/record", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardLog(Model model, @Param("bookVO") BookVO bookVO, Criteria criteria, HttpServletRequest req)
			throws Exception {
		log.info("===== record() =====");
		bookVO = logingBoardMapper.getBookVO(bookVO.getIsbn());// get isbn and set all bookVO attr
		ArrayList<LogingBoardVO> logingList = logingBoardMapper.getListWithPaging(criteria, bookVO);
		model.addAttribute("loginglist", logingList);
		model.addAttribute("pageMaker", new PageDTO(criteria, 123)); // inject totalPageNum

		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO); //
		int logingCount = logingBoardMapper.CountWriteNo(bookVO); 
		int bookTotalPage = bookVO.getBook_tot_page(); /* tmp value, please modify this code */
		double reading = ((double) readPageNum / (double) bookTotalPage) * 100; // 
		model.addAttribute("startPage", statisticsFunctionService.firstPage(logingList));
		model.addAttribute("endPage", statisticsFunctionService.endPage(logingList));
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("modalOpen", req.getParameter("modalOpen"));
		return "/record";
	}

	@RequestMapping(value = "/recordwrite", method = RequestMethod.GET)
	public String recordwrite(BookVO bookVO) throws Exception {
		log.info("===== boardLogWrite() =====");
		return "/recordwrite";
	}

	@RequestMapping(value = "/recordDelete", method = RequestMethod.GET)
	public String recordDelete(@Param("write_no") String write_no, Criteria cri, RedirectAttributes rttr)
			throws Exception {
		log.info("===== recordDelete() =====");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("modalOpen", "open");

		LogingBoardVO willDeleteLoging = logingBoardMapper.getLogingVOForWriteNo(write_no);
		logingBoardMapper.deleteLoging(write_no);
		String isbn = willDeleteLoging.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}

	@RequestMapping(value = "/recordWriteSave", method = RequestMethod.POST)
	public String recordWriteSave(LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== recordWriteSave() =====");
		log.info(logingBoardVO.getIsbn());
		log.info(logingBoardVO.getEnd_page());
		log.info(logingBoardVO.getStart_date());
		log.info(logingBoardVO.getStart_page());
		log.info(logingBoardVO.getUser_id());
		logingBoardMapper.logingBoard(logingBoardVO);
		String isbn = logingBoardVO.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}

	@RequestMapping(value = "/recordmodify", method = RequestMethod.GET)
	public String recordmodify(@Param("write_no") String write_no, Model model,
			@ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) throws Exception {
		log.info("===== recordmodify() =====");
		LogingBoardVO willModifyLoging = logingBoardMapper.getLogingVOForWriteNo(write_no);
		model.addAttribute("willModifyLoging", willModifyLoging);
		return "/recordmodify";
	}

	@RequestMapping(value = "/recordModifySave", method = RequestMethod.POST)
	public String boardLogModifySave(LogingBoardVO logingBoardVO, Criteria criteria,
			RedirectAttributes rttr) throws Exception {
		log.info("===== recordModifySave() =====");
		rttr.addAttribute("amount",criteria.getAmount());
		rttr.addAttribute("pageNum",criteria.getPageNum());
		rttr.addAttribute("modalOpen", "open");

		logingBoardMapper.modifyLoging(logingBoardVO);
		String isbn = logingBoardVO.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}
}
