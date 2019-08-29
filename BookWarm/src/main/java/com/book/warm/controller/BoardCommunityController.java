package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.CommunityBoardService;
import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardCommunityController {
	
	@Inject
	CommunityBoardService communityBoardService;

	@RequestMapping(value = "/communityboard", method = RequestMethod.GET)
	public String boardCommunity(Model model) throws Exception {
		log.info("===== boardCommunity() =====");

		ArrayList<CommunityBoardVO> list = communityBoardService.getCommunityBoardList();
		model.addAttribute("list", list);

		return "/communityboard";
	}

	@RequestMapping(value = "/communityboardview", method = RequestMethod.GET)
	public String communityboardview(Model model, HttpServletRequest request) throws Exception {
		log.info("===== communityboardview() =====");
		String commNo = request.getParameter("commNo");
		CommunityBoardVO communityBoardOne = communityBoardService.getCommunityBoardOne(commNo);
		System.out.println(communityBoardOne.getCommWrittenTime());
		model.addAttribute("communityBoardOne", communityBoardOne);
		System.out.println(communityBoardOne.getCommNo());
		return "/communityboardview";
	}

	@RequestMapping(value = "/communityboarddelete", method = RequestMethod.GET)
	public String communityBoardDelete(HttpServletRequest request) throws Exception {
		log.info("===== communityboardview() =====");
		String commNo = request.getParameter("commNo");
		int deleteCommNo = communityBoardService.getCommunityBoardOneDelete(commNo);
		log.info("delete : " + deleteCommNo);
		return "redirect:communityboard";
	}

	@RequestMapping(value = "/communityboardmodify", method = RequestMethod.GET)
	public String communityboardmodify(Model model, HttpServletRequest request) throws Exception {
		log.info("===== communityboardmodify() =====");
		String commNo = request.getParameter("commNo");
		CommunityBoardVO communityBoardOne = communityBoardService.getCommunityBoardOne(commNo);
		System.out.println(communityBoardOne.getCommWrittenTime());
		model.addAttribute("communityBoardOne", communityBoardOne);
		System.out.println(communityBoardOne.getCommNo());
		return "/communityboardmodify";
	}
}
