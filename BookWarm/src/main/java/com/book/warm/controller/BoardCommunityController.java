package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;

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

	@RequestMapping(value = "/boardcommunity", method = RequestMethod.GET)
	public String boardCommunity(Model model) throws Exception {
		log.info("===== boardCommunity() =====");

		ArrayList<CommunityBoardVO> list = communityBoardService.getCommunityBoardList();
		System.out.println(list.get(0).getCommNo());
		model.addAttribute("list", list);

		return "/boardcommunity";
	}
}
