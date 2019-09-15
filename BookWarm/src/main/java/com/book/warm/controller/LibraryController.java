package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.LibraryMapper;
import com.book.warm.vo.LibraryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LibraryController {

	@Inject
	LibraryMapper mapper;

	@RequestMapping(value = "/library", method = RequestMethod.GET)
	public String library(HttpSession session,HttpServletRequest request, LibraryVO libraryVO, Model model) throws Exception {
		log.info("==================== communityBoardSaveWrite() ====================");
		//유저 아이디 aaa로 세션에서 받아올 예정
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		log.info("session에 있는 user_id : " + user_id);
		model.addAttribute("libraryBooks",mapper.getLibraryBooks(user_id));
		
		return "library";
	}

}
