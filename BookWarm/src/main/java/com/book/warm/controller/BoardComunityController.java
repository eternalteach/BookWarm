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
public class BoardComunityController {
	@Inject
	LogingBoardService logingBoardService;

	@RequestMapping(value = "/boardcomunity", method = RequestMethod.GET)
	public String boardComunity() throws Exception {
		log.info("===== boardcomunity() =====");
		
		return "/boardcomunity";
	}
}
