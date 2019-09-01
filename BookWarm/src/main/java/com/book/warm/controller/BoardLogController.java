package com.book.warm.controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.BookCoverMapper;
import com.book.warm.mapper.LogingBoardMapper;
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
	public String boardLog(Model model, @Param("isbn") String isbn) throws Exception {
		log.info("===== boardlog() =====");

		BookVO bookVO = new BookVO(1000, "isbn001");

		ArrayList<LogingBoardVO> logingList = logingBoardMapper.selectList(isbn);
		System.out.println("logingList.get(0)" + logingList.get(0).getStart_date());
		Timestamp ts = new Timestamp(19910101);
		BookCoverVO BookCoverVO = bookCoverMapper.getBookImg(isbn);
		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO);
		int logingCount = logingBoardMapper.CountWriteNo(isbn);
		int bookTotalPage = bookVO.getTotalPage(); /* tmp value, please modify this code */
		double reading = ((double) readPageNum / (double) bookTotalPage) * 100;
		model.addAttribute("startPage", statisticsFunctionService.firstPage(logingList));
		model.addAttribute("endPage", statisticsFunctionService.endPage(logingList));
		model.addAttribute("loginglist", logingList);
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookTotalPage", bookTotalPage);
		model.addAttribute("BookCoverVO", BookCoverVO);
		return "/boardlog";
	}

	@RequestMapping(value = "/boardlogwrite", method = RequestMethod.GET)
	public String boardLogWrite() throws Exception {
		log.info("===== boardLogWrite() =====");
		return "/boardlogwrite";
	}

	@RequestMapping(value = "/boardlogmodify", method = RequestMethod.GET)
	public String boardlogmodify(@Param("write_no") String write_no, Model model) throws Exception {
		log.info("===== boardlogmodify() =====");
		LogingBoardVO willModifyLoging = logingBoardMapper.getLogingVOForWriteNo(write_no);
		model.addAttribute("willModifyLoging", willModifyLoging);
		System.out.println("modify에서 write_no" + willModifyLoging.getWrite_no());
		System.out.println("modify에서start_date" + willModifyLoging.getStart_date());
		return "/boardlogmodify";
	}

	@RequestMapping(value = "/boardLogWriteSave", method = RequestMethod.POST)
	public String boardLogWriteSave(LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== boardLogWriteSave() =====");
		logingBoardMapper.logingBoard(logingBoardVO);
		String isbn = logingBoardVO.getIsbn();
		return "redirect:boardlog?isbn=" + isbn;
	}

	@RequestMapping(value = "/boardLogModifySave", method = RequestMethod.POST)
	public String boardLogModifySave(LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== boardLogModifySave() =====");

		logingBoardMapper.modifyLoging(logingBoardVO);
		System.out.println("modifySave에서 write_no" + logingBoardVO.getWrite_no());
		String isbn = logingBoardVO.getIsbn();
		return "redirect:boardlog?isbn=" + isbn;
	}
}
