package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.AddBookDetailInfoMapper;
import com.book.warm.mapper.LibraryMapper;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LibraryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="library")
public class LibraryController {

	@Inject
	LibraryMapper mapper;
	
	@Inject
	AddBookDetailInfoMapper bookMapper;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String library(HttpSession session,HttpServletRequest request, Model model) throws Exception {
		log.info("==================== communityBoardSaveWrite() ====================");
		//유저 아이디 aaa로 세션에서 받아올 예정
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		log.info("session에 있는 user_id : " + user_id);
		model.addAttribute("libraryBooks",mapper.getLibraryBooks(user_id));
		return "library";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String modify(HttpSession session, HttpServletRequest request,BookVO bookVO) throws Exception {
		log.info("==================== delete() ====================");
		//유저 아이디 aaa로 세션에서 받아올 예정
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		log.info("session에 있는 user_id : " + user_id);
		String isbn=bookVO.getIsbn();
		log.info("isbn : "+isbn);
		log.info(mapper.deleteLibraryList(user_id,isbn));
		return "redirect:/library";
	}
	
	//add Comment
		@PostMapping(value = "/addBook", consumes = "application/json", produces = {
				MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> addBook(HttpSession session, HttpServletRequest request,@RequestBody LibraryVO libraryVO) {
			log.info("ISBN : " + libraryVO.getIsbn());
			session=request.getSession();
			String user_id=(String)session.getAttribute("user_id");
			BookVO bookVO = (bookMapper.getBook(libraryVO.getIsbn()));
			libraryVO.setUser_id(user_id);
			libraryVO.setIsbn(bookVO.getIsbn());
			libraryVO.setList_img_src(bookVO.getBook_img());
			libraryVO.setList_type("장르01");
			libraryVO.setList_no(19);
			log.info(libraryVO.getIsbn());
			log.info(libraryVO.getList_added_date());
			int insertCount = mapper.addMyBook(libraryVO);
			log.info("Comment INSERT COUNT : " + insertCount);
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

}