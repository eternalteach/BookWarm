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

import com.book.warm.mapper.BookCoverMapper;
import com.book.warm.mapper.LogingBoardMapper;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookCoverVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardLogController {
	@Inject
	LogingBoardMapper logingBoardMapper;

	@Inject
	BookCoverMapper bookCoverMapper;
	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/boardlog", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardLog(Model model, @Param("bookVO") BookVO bookVO, Criteria criteria, HttpServletRequest req)
			throws Exception {
		log.info("===== boardlog() =====");
		log.info("boardlogmodify - cri.getAmount()" + criteria.getAmount());
		log.info("boardlogmodify - cri.getPageNum()" + criteria.getPageNum());
		bookVO = logingBoardMapper.getBookVO(bookVO.getIsbn());// get isbn and set all bookVO attr
		ArrayList<LogingBoardVO> logingList = logingBoardMapper.getListWithPaging(criteria, bookVO);
		model.addAttribute("loginglist", logingList);
		model.addAttribute("pageMaker", new PageDTO(criteria, 123));

		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO);
		int logingCount = logingBoardMapper.CountWriteNo(bookVO);
		int bookTotalPage = bookVO.getBook_tot_page(); /* tmp value, please modify this code */
		double reading = ((double) readPageNum / (double) bookTotalPage) * 100;
		model.addAttribute("startPage", statisticsFunctionService.firstPage(logingList));
		model.addAttribute("endPage", statisticsFunctionService.endPage(logingList));
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("modalOpen", req.getParameter("modalOpen"));
		return "/boardlog";
	}

	@RequestMapping(value = "/boardlogwrite", method = RequestMethod.GET)
	public String boardLogWrite(BookCoverVO bookCoverVO) throws Exception {
		log.info("===== boardLogWrite() =====");
		return "/boardlogwrite";
	}

	@RequestMapping(value = "/boardLogDelete", method = RequestMethod.GET)
	public String boardLogDelete(@Param("write_no") String write_no, Criteria cri, RedirectAttributes rttr)
			throws Exception {
		log.info("===== boardLogDelete() =====");
		log.info("boardLogDelete - cri.getAmount()" + cri.getAmount());
		log.info("boardLogDelete - cri.getPageNum()" + cri.getPageNum());

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("modalOpen", "open");

		LogingBoardVO willDeleteLoging = logingBoardMapper.getLogingVOForWriteNo(write_no);
		logingBoardMapper.deleteLoging(write_no);
		String isbn = willDeleteLoging.getIsbn();
		return "redirect:boardlog?isbn=" + isbn;
	}

	@RequestMapping(value = "/boardLogWriteSave", method = RequestMethod.POST)
	public String boardLogWriteSave(LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== boardLogWriteSave() =====");
		logingBoardMapper.logingBoard(logingBoardVO);
		String isbn = logingBoardVO.getIsbn();
		return "redirect:boardlog?isbn=" + isbn;
	}

	@RequestMapping(value = "/boardlogmodify", method = RequestMethod.GET)
	public String boardlogmodify(@Param("write_no") String write_no, Model model,
			@ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) throws Exception {
		log.info("===== boardlogmodify() =====");
		log.info("boardlogmodify - cri.getAmount()" + criteria.getAmount());
		log.info("boardlogmodify - cri.getPageNum()" + criteria.getPageNum());
		LogingBoardVO willModifyLoging = logingBoardMapper.getLogingVOForWriteNo(write_no);
		model.addAttribute("willModifyLoging", willModifyLoging);
		return "/boardlogmodify";
	}

	@RequestMapping(value = "/boardLogModifySave", method = RequestMethod.POST)
	public String boardLogModifySave(LogingBoardVO logingBoardVO, Criteria criteria,
			RedirectAttributes rttr) throws Exception {
		log.info("===== boardLogModifySave() =====");
		log.info("criteria.getAmount()"+criteria.getAmount());
		log.info("criteria.getPageNum()"+criteria.getPageNum());
		rttr.addAttribute("amount",criteria.getAmount());
		rttr.addAttribute("pageNum",criteria.getPageNum());
		rttr.addAttribute("modalOpen", "open");

		logingBoardMapper.modifyLoging(logingBoardVO);
		System.out.println("modifySave¿¡¼­ write_no" + logingBoardVO.getWrite_no());
		String isbn = logingBoardVO.getIsbn();
		return "redirect:boardlog?isbn=" + isbn;
	}
}
