package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.AddBookDetailInfoMapper;
import com.book.warm.mapper.LibraryMapper;
import com.book.warm.service.BookService;
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
	@Inject
	BookService bookService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String library(Authentication auth, Principal principal, Model model) throws Exception {
		
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
	
	@GetMapping(value = "/getList", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<LibraryVO>> libraryGetList(Principal principal, Model model) {
		log.info("====================Library Get List====================");
		String user_id=principal.getName();
		return new ResponseEntity<>(mapper.getLibraryBooks(user_id), HttpStatus.OK);
	}

	@GetMapping(value = "/getMyBooks", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<LibraryVO>> getMyBooks(Principal principal, Model model) {
		log.info("==================== getMyBooks() ====================");
		String user_id=principal.getName();
		return new ResponseEntity<>(mapper.getMyBooks(user_id), HttpStatus.OK);
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
	
	// delete
	@DeleteMapping(value="/delete/{isbn}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("isbn")String isbn,Principal principal){
		log.info("==================== delete() ====================");
		String user_id=principal.getName();
		return mapper.deleteMyBook(user_id,isbn)==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// delete
	@DeleteMapping(value="/modify/{isbn}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("isbn")String isbn,Principal principal){
		log.info("==================== modify() ====================");
		String user_id=principal.getName();
		return mapper.deleteLibraryList(user_id,isbn)==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// readd
	@DeleteMapping(value="/readd/{isbn}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> reAdd(@PathVariable("isbn")String isbn,Principal principal){
		log.info("==================== reAdd() ====================");
		String user_id=principal.getName();
		return mapper.reAddLibrary(user_id,isbn)==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//add Comment
	@PostMapping(value = "/addBook", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addBook(Principal principal,@RequestBody LibraryVO libraryVO) {
		log.info("==================== addBook() ====================");
		String user_id=principal.getName();
		BookVO bookVO = (bookMapper.getBook(libraryVO.getIsbn()));
		int insertCount=0;
		if(bookService.checkUserBook(bookVO.getIsbn(), user_id)==0) {
			libraryVO.setUser_id(user_id);
			libraryVO.setIsbn(bookVO.getIsbn());
			libraryVO.setList_img_src(bookVO.getBook_img());
			libraryVO.setList_type("장르01");
			insertCount = mapper.addMyBook(libraryVO);
		}
		log.info("Comment INSERT COUNT : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
