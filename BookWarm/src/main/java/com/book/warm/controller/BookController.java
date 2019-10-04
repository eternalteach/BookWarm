package com.book.warm.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.json.ParsingJson;
import com.book.warm.mapper.AddBookDetailInfoMapper;
import com.book.warm.service.BookService;
import com.book.warm.service.JsonToBookVOService;
import com.book.warm.vo.BookVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("book/")
public class BookController {
	@Inject
	JsonToBookVOService jsonToBookVOService;

	@Inject
	AddBookDetailInfoMapper mapper;

	@Autowired
	BookService bookService;

	@PostMapping(value = "/bookinfo", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> saveBookInfo(@RequestBody ParsingJson parsingJson) {
		log.info("saveBookInfo result : " + jsonToBookVOService.saveBookInfoToDB(parsingJson));
		return parsingJson != null ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/getBookInfo/{isbn}", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BookVO> getBookInfo(@PathVariable("isbn") String isbn) {
		log.info("==================== getBookInfo() ====================");
		log.info("isbn : " + isbn);
		return new ResponseEntity<>(bookService.getBook(isbn), HttpStatus.OK);
	}

	@GetMapping(value = "/checkUserBook/{isbn}", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> checkUserBook(@PathVariable("isbn") String isbn, Principal principal) {
		log.info("==================== checkUserBook() ====================");
		log.info("isbn : " + isbn);
		String user_id = principal.getName();
		return bookService.checkUserBook(isbn, user_id) ==0 ? new ResponseEntity<>("NOTEXIST", HttpStatus.OK) :new ResponseEntity<>("EXIST", HttpStatus.OK);
		 
	}

}
