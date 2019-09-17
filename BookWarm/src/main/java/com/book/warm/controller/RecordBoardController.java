package com.book.warm.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.RecordService;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecordBoardController {
	
	@Inject
	RecordService recordService;

	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/record", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardLog(Model model, @Param("bookVO") BookVO bookVO, Criteria criteria, HttpServletRequest req,HttpSession session)
			throws Exception {
		log.info("===== record() =====");
		String user_id=(String)session.getAttribute("user_id");
		log.info(user_id);
		bookVO = recordService.getBook(bookVO.getIsbn());// get isbn and set all bookVO attr
		List<LogingBoardVO> logingList = recordService.getList(criteria, bookVO,user_id);
		model.addAttribute("loginglist", logingList);
		model.addAttribute("pageMaker", new PageDTO(criteria, 123)); // inject totalPageNum

		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO); //
		int logingCount = recordService.getCount(bookVO,user_id); 
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
	public String recordwrite(@ModelAttribute("bookVO") BookVO bookVO) throws Exception {
		log.info("===== recordwrite() =====");
		return "/recordwrite";
	}

	@RequestMapping(value = "/recordDelete", method = RequestMethod.GET)
	public String recordDelete(@Param("write_no") String write_no, Criteria cri, RedirectAttributes rttr)
			throws Exception {
		log.info("===== recordDelete() =====");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("modalOpen", "open");

		LogingBoardVO willDeleteLoging = recordService.getRecord(write_no);
		recordService.deleteRecord(write_no);
		String isbn = willDeleteLoging.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}

	@RequestMapping(value = "/recordWriteSave", method = RequestMethod.POST)
	public String recordWriteSave(HttpSession session, LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== recordWriteSave() =====");
		String user_id=(String)session.getAttribute("user_id");
		logingBoardVO.setUser_id(user_id);
		logingBoardVO.getEnd_date();
		log.info("시작 날짜 : "+logingBoardVO.getStart_date());
		log.info("완독여부  : "+logingBoardVO.getEnd_date());
		recordService.addRecord(logingBoardVO);
		return "redirect:record?isbn=" + logingBoardVO.getIsbn();
	}

	@RequestMapping(value = "/recordmodify", method = RequestMethod.GET)
	public String recordmodify(@Param("write_no") String write_no, Model model,
			@ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) throws Exception {
		log.info("===== recordmodify() =====");
		LogingBoardVO willModifyLoging = recordService.getRecord(write_no);
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

		recordService.modifyRecord(logingBoardVO);
		String isbn = logingBoardVO.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}
}
