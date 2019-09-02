package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.CommunityBoardMapper;
import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardCommunityController {
	
	@Inject
	CommunityBoardMapper communityBoardMapper;

	@RequestMapping(value = "/communityboard", method = RequestMethod.GET)
	public String boardCommunity(Model model) throws Exception {
		log.info("===== boardCommunity() =====");

		ArrayList<CommunityBoardVO> list = communityBoardMapper.getCommunityBoardList();
		model.addAttribute("loginglist", list);

		return "/communityboard";
	}

	@RequestMapping(value = "/communityboardview", method = RequestMethod.GET)
	public String communityboardview(Model model, HttpServletRequest request) throws Exception {
		log.info("===== communityboardview() =====");
		String comm_no = request.getParameter("comm_no");
		CommunityBoardVO communityBoardOne = communityBoardMapper.getCommunityBoardOne(comm_no);
		System.out.println(communityBoardOne.getComm_written_time());
		model.addAttribute("communityBoardOne", communityBoardOne);
		System.out.println(communityBoardOne.getComm_no());
		return "/communityboardview";
	}

	@RequestMapping(value = "/communityboarddelete", method = RequestMethod.GET)
	public String communityBoardDelete(HttpServletRequest request) throws Exception {
		log.info("===== communityboarddelete() =====");
		String comm_no = request.getParameter("comm_no");
		Integer deletecomm_no = communityBoardMapper.getCommunityBoardOneDelete(comm_no);
		log.info("delete : " + deletecomm_no);
		return "redirect:communityboard";
	}

	@RequestMapping(value = "/communityboardmodify", method = RequestMethod.GET)
	public String communityboardmodify(Model model, HttpServletRequest request) throws Exception {
		log.info("===== communityboardmodify() =====");
		String comm_no = request.getParameter("comm_no");
		CommunityBoardVO communityBoardOne = communityBoardMapper.getCommunityBoardOne(comm_no);
		System.out.println(communityBoardOne.getComm_written_time());
		model.addAttribute("communityBoardOne", communityBoardOne);
		System.out.println(communityBoardOne.getComm_no());
		return "/communityboardmodify";
	}
	@RequestMapping(value = "/communityboardwrite", method = RequestMethod.GET)
	public String communityboardmodify() throws Exception {
		log.info("===== communityboardwrite() =====");
		return "/communityboardwrite";
	}
	@RequestMapping(value = "/communityBoardSaveModify", method = RequestMethod.POST)
	public String communityBoardSaveModify(CommunityBoardVO communityBoardVO) throws Exception {
		log.info("===== communityBoardSaveModify() =====");
		System.out.println("communityBoardVO.getComm_no()"+communityBoardVO.getComm_no());
		Integer modifyCommunityBoardOne = communityBoardMapper.modifyCommunityBoardOne(communityBoardVO);
		System.out.println(modifyCommunityBoardOne);
		return "redirect:communityboard";
	}
	@RequestMapping(value = "/communityBoardSaveWrite", method = RequestMethod.POST)
	public String communityBoardSaveWrite(CommunityBoardVO communityBoardVO) throws Exception {
		log.info("===== communityBoardSaveWrite() =====");
		communityBoardMapper.insertCommunityBoardWrite(communityBoardVO);
		return "redirect:communityboard";
	}
}
