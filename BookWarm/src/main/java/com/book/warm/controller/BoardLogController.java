package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.LogingBoardService;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class BoardLogController {
	@Inject
	LogingBoardService lbs;

	@RequestMapping(value = "/boardlog", method = RequestMethod.GET) 
	// add task - get book command(need total page) 
	public String boardlog(Model model, LogingBoardVO logingBoardVO) throws Exception {
		log.info("===== boardlog() =====");
		int writeNo = logingBoardVO.getWriteNo();
		// 기록문에 등록한 읽은 페이지 필요하다.
		// 읽은 총 페이지 보여주기 -> sql문으로     (sum(end page) - sum (startpage))/ 기록 숫자(cnt) 
		// 또는 중복 제거하고 책의 읽은 페이지 수 보여주기
		model.addAttribute("boardlog", lbs.selectBoardOne(writeNo));
		return "/boardlog";
	}
}
