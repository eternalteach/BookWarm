package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.LibraryMapper;
import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LibraryController {

	@Inject
	LibraryMapper mapper;


	@RequestMapping(value = "/aaaaaaaaaa", method = RequestMethod.POST)
	public String communityBoardSaveWrite(CommunityBoardVO communityBoardVO) throws Exception {
		log.info("==================== communityBoardSaveWrite() ====================");
		return "redirect:aaaaaaaaaaa";
	}

}
