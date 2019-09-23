package com.book.warm.controller;

import java.security.Principal;

import javax.inject.Inject;

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
	public String library(Principal principal, Model model) throws Exception {
		
		System.out.println(principal);
		System.out.println("principal.getName(): " + principal.getName());
		
		model.addAttribute("libraryBooks",mapper.getLibraryBooks(principal.getName()));
		
		return "library";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String libraryPOST(Principal principal, Model model) throws Exception {
		
		System.out.println(principal);
		System.out.println("principal.getName(): " + principal.getName());
		
		model.addAttribute("libraryBooks",mapper.getLibraryBooks(principal.getName()));
		
		return "library";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String modify(Principal principal, BookVO bookVO) throws Exception {
		log.info("==================== delete() ====================");
		String user_id=principal.getName();
		String isbn=bookVO.getIsbn();
		log.info("isbn : "+isbn);
		log.info(mapper.deleteLibraryList(user_id,isbn));
		return "redirect:/library";
	}
	
	//add Comment
		@PostMapping(value = "/addBook", consumes = "application/json", produces = {
				MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> addBook(Principal principal,@RequestBody LibraryVO libraryVO) {
			log.info("==================== addBook() ====================");
			String user_id=principal.getName();
			BookVO bookVO = (bookMapper.getBook(libraryVO.getIsbn()));
			libraryVO.setUser_id(user_id);
			libraryVO.setIsbn(bookVO.getIsbn());
			libraryVO.setList_img_src(bookVO.getBook_img());
			libraryVO.setList_type("장르01");
			libraryVO.setList_no(19);
			int insertCount = mapper.addMyBook(libraryVO);
			log.info("Comment INSERT COUNT : " + insertCount);
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

}
